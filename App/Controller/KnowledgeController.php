<?php
/**
 * AgileOne - Power to Agile Development
 *
 * LICENSE
 *
 * All AgileOne source files are subject to GPL V3 license:
 * 1) You may use the Software for free and non-commercial use
 * 2) You may modify or propagate the source code of the Software
 * 3) Please purchase commercial license for support and consultation
 * For more license infomation, please read the file License.txt.
 *
 * @copyright  Copyright (c) 2010 AgileOne Team (http://code.google.com/p/agileone/)
 * @license    GNU General Public License V3 (http://www.gnu.org/licenses)
 * @version    2009-5-18 1.0
 * @author     DengQiang (http://www.51testing.com/?uid/275266)
 */

class KnowledgeController extends Zend_Controller_Action {

	/**
	 * Initialize the controller for common usage
	 */
    public function init() {
    	$this->view = Zend_Registry::get('view');
    	$this->translate = Zend_Registry::get('Zend_Translate');
    	$this->db = Zend_Db_Table::getDefaultAdapter();
    	$this->_helper->layout->disableLayout();
    }
    
    public function indexAction() {
    	$this->_helper->layout->enableLayout();
    	
    	$sql = 'select projectid, projname from project order by projectid';
        $project = $this->db->fetchAll($sql);
        $this->view->project = $project;
        
    	echo $this->view->render('Knowledge.phtml');
    }
    
    public function queryAction() {
        $select = $this->db->select();
        $select->from('knowledge', '*');
        if ($_POST['knowledgeid'] != '')
            $select->where('knowledgeid = ?', $_POST['knowledgeid']);
        if ($_POST['creator'] != '')
            $select->where("creator like '%" . $_POST['creator'] . "%'");
        if ($_POST['type'] != '')
            $select->where('type = ?', $_POST['type']);
        if ($_POST['projectid'] != '')
            $select->where('knowledge.projectid = ?', $_POST['projectid']);
        if ($_POST['headline'] != '')
            $select->where("headline like '%" . $_POST['headline'] . "'");
        if ($_POST['content'] != '')
            $select->where("content like '%" . Common::replaceAmpStrip($_POST['content']) . "%'");
        $select->join('project', 'project.projectid=knowledge.projectid', 'projname');
        $select->order('knowledgeid DESC');
        
        $totalRecord = count($this->db->fetchAll($select));
        $pagerSize = Zend_Registry::get('config')->pager->size;
        $currentPage = $_POST['currentpage'];
        $select->limitPage($currentPage,$pagerSize);
        $result = $this->db->fetchAll($select);
        $result[]['totalRecord'] = $totalRecord;

        echo json_encode($result);
    }
    
    public function addAction() {
        if (! Permission::isAllowed('knowledge', 'add')) {
            echo 'no_permission';
            return;
        }
        
        $knowledge = new Knowledge();
        $data = array(
            'creator' => $_SESSION['userName'],
            'type' => $_POST['type'],
            'projectid' => $_POST['projectid'],
            'headline' => $_POST['headline'],
            'content' => Common::replaceAmpStrip($_POST['content']),
            'createdtime' => date('Y-m-d H:i:s'),
            'updatedtime' => date('Y-m-d H:i:s')
        );
        $id = $knowledge->insert($data);
        if ($id > 0) {
            $message = 'Add knowledge successfully [ID=' . $id . ']';
            Logging::write(Logging::MODULE_KNOWLEDGE, Logging::LEVEL_INFO, $message);
            echo $id;
        } else {
            $message = 'Add knowledge unsuccessfully [ID=null]';
            Logging::write(Logging::MODULE_KNOWLEDGE, Logging::LEVEL_ERROR, $message);
            echo 'error';
        }
    }
    
    public function editAction() {
        if (! Permission::isAllowed('knowledge', 'edit')) {
            echo 'no_permission';
            return;
        }
        
        $knowledge = new Knowledge();
        $knowledgeid = $_POST['knowledgeid'];
        
        $data = array(
            'type' => $_POST['type'],
            'projectid' => $_POST['projectid'],
            'headline' => $_POST['headline'],
            'content' => Common::replaceAmpStrip($_POST['content']),
            'updatedtime' => date('Y-m-d H:i:s')
        );
        $where = $this->db->quoteInto('knowledgeid = ?', $knowledgeid);
        $row = $knowledge->update($data, $where);
        if ($row == 1) {
            $message = 'Update knowledge successfully [ID=' . $knowledgeid . ']';
            Logging::write(Logging::MODULE_KNOWLEDGE, Logging::LEVEL_INFO, $message);
            echo $row;
        } else {
            $message = 'Update knowledge unsuccessfully [ID=' . $knowledgeid . ']';
            Logging::write(Logging::MODULE_KNOWLEDGE, Logging::LEVEL_ERROR, $message);
            echo 'error';
        }
    }
    
    public function deleteAction() {
        if (! Permission::isAllowed('knowledge', 'delete')) {
            echo 'no_permission';
            return;
        }
        
        $knowledge = new Knowledge();
        $knowledgeid = $_POST['knowledgeid'];       
        $knowledgeRow = $knowledge->find($knowledgeid)->current();
        
        $row = $knowledgeRow->delete();
        if ($row == 1) {
            $message = 'Delete knowledge successfully [ID=' . $knowledgeid . ']';
            Logging::write(Logging::MODULE_KNOWLEDGE, Logging::LEVEL_INFO, $message);
            echo $row;
        } else {
            $message = 'Delete knowledge unsuccessfully [ID=' . $knowledgeid . ']';
            Logging::write(Logging::MODULE_KNOWLEDGE, Logging::LEVEL_ERROR, $message);
            echo 'error';
        }
    }
}
?>