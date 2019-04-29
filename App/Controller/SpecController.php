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
 * @version    2009-9-1 1.0
 * @author     DengQiang (http://www.51testing.com/?uid/275266)
 */

class SpecController extends Zend_Controller_Action {

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

        $sql1 = 'select userstoryid, headline from userstory where projectid=' . $_SESSION['currentProjectId']
    	       . ' order by userstoryid';
        $userstory = $this->db->fetchAll($sql1);
        $this->view->userstory = $userstory;

    	if ($this->getRequest()->getParam('userstoryid') != '')
        	$this->view->userstoryid = $this->getRequest()->getParam('userstoryid');
       
    	echo $this->view->render('Spec.phtml');
    }
    
    public function queryAction() {
        $select = $this->db->select();
        $select->from('spec', '*');
        if ($_POST['specid'] != '')
            $select->where('specid = ?', $_POST['specid']);  
        if ($_POST['creator'] != '')
            $select->where("creator like '%" . $_POST['creator'] . "%'");
        if ($_POST['userstoryid'] != '')
            $select->where('userstoryid = ?', $_POST['userstoryid']);
        if ($_POST['type'] != '')
            $select->where('type = ?', $_POST['type']);
        if ($_POST['content'] != '')
            $select->where("content like '%" . Common::replaceAmpStrip($_POST['content']) . "%'");
        $select->where('spec.projectid = ?', $_SESSION['currentProjectId']);
        $select->order('specid DESC');
        
        $totalRecord = count($this->db->fetchAll($select));
        $pagerSize = Zend_Registry::get('config')->pager->size;
        $currentPage = $_POST['currentpage'];
        $select->limitPage($currentPage,$pagerSize);
        $result = $this->db->fetchAll($select);
        $result[]['totalRecord'] = $totalRecord;
        
        echo json_encode($result);
    }
    
    public function addAction() {
        if (! Permission::isAllowed('spec', 'add')) {
            echo 'no_permission';
            return;
        }
        
        $spec = new Spec();
        $data = array(
        	'projectid' => $_SESSION['currentProjectId'],
            'creator' => $_SESSION['userName'],
            'userstoryid' => $_POST['userstoryid'],
            'type' => $_POST['type'],
            'content' => Common::replaceAmpStrip($_POST['content']),
            'createdtime' => date('Y-m-d H:i:s'),
            'updatedtime' => date('Y-m-d H:i:s')
        );
        $id = $spec->insert($data);
        if ($id > 0) {
            $message = 'Add specification successfully [ID=' . $id . ']';
            Logging::write(Logging::MODULE_SPEC, Logging::LEVEL_INFO, $message);
            echo $id;
        } else {
            $message = 'Add specification unsuccessfully [ID=null]';
            Logging::write(Logging::MODULE_SPEC, Logging::LEVEL_ERROR, $message);
            echo 'error';
        }
    }
    
    public function editAction() {
        if (! Permission::isAllowed('spec', 'edit')) {
            echo 'no_permission';
            return;
        }
        
        $spec = new Spec();        
        $specid = $_POST['specid'];
        $specRow = $spec->find($specid)->current();
        
        if ($_SESSION['userName'] != $specRow->creator && $_SESSION['userRole'] != 'Administrator') {
            echo 'no_permission';
            return;
        }
            
        $data = array(
            'projectid' => $_SESSION['currentProjectId'],
            'userstoryid' => $_POST['userstoryid'],
            'type' => $_POST['type'],
            'content' => Common::replaceAmpStrip($_POST['content']),
            'updatedtime' => date('Y-m-d H:i:s')
        );
        $where = $this->db->quoteInto('specid = ?', $specid);
        $row = $spec->update($data, $where);
        if ($row == 1) {
            $message = 'Update specification successfully [ID=' . $specid . ']';
            Logging::write(Logging::MODULE_SPEC, Logging::LEVEL_INFO, $message);
            echo $row;
        } else {
            $message = 'Update specification unsuccessfully [ID=' . $specid . ']';
            Logging::write(Logging::MODULE_SPEC, Logging::LEVEL_ERROR, $message);
            echo 'error';
        }
    }
    
    public function deleteAction() {
        if (! Permission::isAllowed('spec', 'delete')) {
            echo 'no_permission';
            return;
        }
        
        $spec = new Spec();        
        $specid = $_POST['specid'];
    	$specRow = $spec->find($specid)->current();
        
        if ($_SESSION['userName'] != $specRow->creator && $_SESSION['userRole'] != 'Administrator') {
            echo 'no_permission';
            return;
        }
        
        $row = $specRow->delete();
        if ($row == 1) {
            $message = 'Delete specification successfully [ID=' . $specid . ']';
            Logging::write(Logging::MODULE_SPEC, Logging::LEVEL_INFO, $message);
            echo $row;
        } else {
            $message = 'Delete specification unsuccessfully [ID=' . $specid . ']';
            Logging::write(Logging::MODULE_SPEC, Logging::LEVEL_ERROR, $message);
            echo 'error';
        }
    }
}
?>