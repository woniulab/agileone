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
 * @version    2009-7-21 1.0
 * @author     DengQiang (http://www.51testing.com/?uid/275266)
 */

class DefectController extends Zend_Controller_Action {

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

        $sql1 = 'select modname from module where projectid=' . $_SESSION['currentProjectId']
    	       . ' order by moduleid';
        $module = $this->db->fetchAll($sql1);
        $this->view->module = $module;
        
        $sql2 = 'select pfname from platform where projectid=' . $_SESSION['currentProjectId']
    	       . ' order by platformid desc';
        $platform = $this->db->fetchAll($sql2);
        $this->view->platform = $platform;
        
        $sql3 = 'select version, build from version where projectid=' . $_SESSION['currentProjectId']
    	       . ' order by versionid desc';
        $version = $this->db->fetchAll($sql3);
        $this->view->version = $version;
        
        $projectid = $_SESSION['currentProjectId'];
        $sql4 = "select userid, username from user where userid in
        	(select userid from userproject where projectid=${projectid})
        	order by user.userid";
        $user = $this->db->fetchAll($sql4);
        $this->view->user = $user;

    	if ($this->getRequest()->getParam('source') != '')
        	$this->view->source = $this->getRequest()->getParam('source');
        	
    	echo $this->view->render('Defect.phtml');
    }
    
    public function queryAction() {
        $select = $this->db->select();        
        $select->from('defect', '*');
        if ($_POST['defectid'] != '')
            $select->where('defectid = ?', $_POST['defectid']); 
        if ($_POST['creator'] != '')
            $select->where("creator like '%" . $_POST['creator'] . "%'");
        if ($_POST['source'] != '')
            $select->where("source like '%" . $_POST['source'] . "%'"); 
        if ($_POST['status'] != '')
            $select->where('status = ?', $_POST['status']);
        if ($_POST['severity'] != '')
            $select->where('severity = ?', $_POST['severity']);
        if ($_POST['priority'] != '')
            $select->where('priority = ?', $_POST['priority']);
        if ($_POST['module'] != '')
            $select->where('module = ?', $_POST['module']);
        if ($_POST['platform'] != '')
            $select->where('platform = ?', $_POST['platform']);
        if ($_POST['version'] != '')
            $select->where('version = ?', $_POST['version']);
        if ($_POST['headline'] != '')
            $select->where("headline like '%" . $_POST['headline'] . "%'");
        if ($_POST['content'] != '')
            $select->where("content like '%" . Common::replaceAmpStrip($_POST['content']) . "%'");
        $select->where('projectid = ?', $_SESSION['currentProjectId']);
        $select->order('defectid DESC');
        
        $totalRecord = count($this->db->fetchAll($select));
        $pagerSize = Zend_Registry::get('config')->pager->size;
        $currentPage = $_POST['currentpage'];
        $select->limitPage($currentPage,$pagerSize);
        $result = $this->db->fetchAll($select);
        $result[]['totalRecord'] = $totalRecord;
        
        echo json_encode($result);        
    }
    
    public function addAction() {
        if (! Permission::isAllowed('defect', 'add')) {
            echo 'no_permission';
            return;
        }
        
        $defect = new Defect();
    	$where = $this->db->quoteInto('headline = ?', $_POST['headline']);
        $countExist = $defect->fetchAll($where)->count();
        if ($countExist > 0) {
            echo 'defect_exist';
            return;
        }
        
        $data = array(
        	'projectid' => $_SESSION['currentProjectId'],
        	'source' => $_POST['source'],
            'creator' => $_SESSION['userName'],
            'status' => $_POST['status'],
            'severity' => $_POST['severity'],
            'priority' => $_POST['priority'],
        	'module' => $_POST['module'],
	        'platform' => $_POST['platform'],
	        'version' => $_POST['version'],
            'headline' => $_POST['headline'],
            'content' => Common::replaceAmpStrip($_POST['content']),
            'createdtime' => date('Y-m-d H:i:s'),
            'updatedtime' => date('Y-m-d H:i:s')
        );
        $id = $defect->insert($data);
        if ($id > 0) {        	
            $message = 'Add defect successfully [ID=' . $id . ']';
            Logging::write(Logging::MODULE_DEFECT, Logging::LEVEL_INFO, $message);
            echo $id;
        } else {
            $message = 'Add defect unsuccessfully [ID=null]';
            Logging::write(Logging::MODULE_DEFECT, Logging::LEVEL_ERROR, $message);
            echo 'error';
        }
    }
    
    public function editAction() {
        if (! Permission::isAllowed('defect', 'edit')) {
            echo 'no_permission';
            return;
        }
        
        $defect = new Defect();        
        $defectid = $_POST['defectid'];
        $defectRow = $defect->find($defectid)->current();
        
    	$where = $this->db->quoteInto('headline = ?', $_POST['headline'])
    			. $this->db->quoteInto(' AND defectid <> ?', $defectid);
        $countExist = $defect->fetchAll($where)->count();
        if ($countExist > 0) {
            echo 'defect_exist';
            return;
        }
        
        if ($_SESSION['userName'] != $defectRow->creator && $_SESSION['userRole'] != 'Administrator') {
            echo 'no_permission';
            return;
        }
            
        $data = array(
        	'source' => $_POST['source'],
            'status' => $_POST['status'],
            'severity' => $_POST['severity'],
            'priority' => $_POST['priority'],
        	'module' => $_POST['module'],
	        'platform' => $_POST['platform'],
	        'version' => $_POST['version'],
            'headline' => $_POST['headline'],
            'content' => Common::replaceAmpStrip($_POST['content']),
            'updatedtime' => date('Y-m-d H:i:s')
        );
        $where = $this->db->quoteInto('defectid = ?', $defectid);
        $row = $defect->update($data, $where);
        if ($row == 1) {
            $message = 'Update defect successfully [ID=' . $defectid . ']';
            Logging::write(Logging::MODULE_DEFECT, Logging::LEVEL_INFO, $message);
            echo $row;
        } else {
            $message = 'Update defect unsuccessfully [ID=' . $defectid . ']';
            Logging::write(Logging::MODULE_DEFECT, Logging::LEVEL_ERROR, $message);
            echo 'error';
        }
    }
    
    public function deleteAction() {
        if (! Permission::isAllowed('userstory', 'delete')) {
            echo 'no_permission';
            return;
        }
        
        $defect = new Defect();        
        $defectid = $_POST['defectid'];
    	$defectRow = $defect->find($defectid)->current();
        
        if ($_SESSION['userName'] != $defectRow->creator && $_SESSION['userRole'] != 'Administrator') {
            echo 'no_permission';
            return;
        }
        
        $row = $defectRow->delete();
        if ($row == 1) {
            $message = 'Delete defect successfully [ID=' . $defectid . ']';
            Logging::write(Logging::MODULE_DEFECT, Logging::LEVEL_INFO, $message);
            echo $row;
        } else {
            $message = 'Delete defect unsuccessfully [ID=' . $defectid . ']';
            Logging::write(Logging::MODULE_DEFECT, Logging::LEVEL_ERROR, $message);
            echo 'error';
        }
    }
}
?>