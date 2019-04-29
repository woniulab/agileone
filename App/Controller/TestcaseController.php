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
 * @version    2009-7-20 1.0
 * @author     DengQiang (http://www.51testing.com/?uid/275266)
 */

class TestcaseController extends Zend_Controller_Action {

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
        	
       	$sql2 = 'select pfname from platform where projectid=' . $_SESSION['currentProjectId']
       			. ' order by platformid desc';
       	$platform = $this->db->fetchAll($sql2);
        $this->view->platform = $platform;
        
        $sql3 = 'select version, build from version where projectid=' . $_SESSION['currentProjectId']
       			. ' order by versionid desc'; 
       	$version = $this->db->fetchAll($sql3);
        $this->view->version = $version;
       
    	echo $this->view->render('Testcase.phtml');
    }
    
    public function queryAction() {
        $select = $this->db->select();
        $select->from('testcase', '*');
        if ($_POST['testcaseid'] != '')
            $select->where('testcaseid = ?', $_POST['testcaseid']); 
        if ($_POST['creator'] != '')
            $select->where("creator like '%" . $_POST['creator'] . "%'");
        if ($_POST['userstoryid'] != '')
            $select->where('userstoryid = ?', $_POST['userstoryid']);
        if ($_POST['type'] != '')
            $select->where('type = ?', $_POST['type']);
        if ($_POST['status'] != '')
            $select->where('status = ?', $_POST['status']);
        if ($_POST['priority'] != '')
            $select->where('priority = ?', $_POST['priority']);
        if ($_POST['headline'] != '')
            $select->where("tester headline '%" . $_POST['headline'] . "%'");
        if ($_POST['content'] != '')
            $select->where("content like '%" . Common::replaceAmpStrip($_POST['content']) . "%'");
        $select->where('testcase.projectid = ?', $_SESSION['currentProjectId']);
        $select->order('testcaseid DESC');
        
        $totalRecord = count($this->db->fetchAll($select));
        $pagerSize = Zend_Registry::get('config')->pager->size;
        $currentPage = $_POST['currentpage'];
        $select->limitPage($currentPage,$pagerSize);
        $result = $this->db->fetchAll($select);
        $result[]['totalRecord'] = $totalRecord;
        
        echo json_encode($result);
    }
    
	public function resultAction() {
		$select1 = $this->db->select();
        $select1->from('testcase', '*');
        $select1->where('testcaseid = ?', $_POST['testcaseid']);
        $result1 = $this->db->fetchAll($select1);
        
        $select2 = $this->db->select();
        $select2->from('execution', '*');
        $select2->where('testcaseid = ?', $_POST['testcaseid']);
        $select2->order('executionid DESC');
        $select2->limit(1);
        $result2 = $this->db->fetchAll($select2);
        
        if (count($result2) > 0)
        	echo json_encode(array_merge($result1, $result2));
        else
        	echo json_encode($result1);
    }
    
    public function addAction() {
        if (! Permission::isAllowed('testcase', 'add')) {
            echo 'no_permission';
            return;
        }
        
        $testcase = new Testcase();
    	$where = $this->db->quoteInto('headline = ?', $_POST['headline']);
        $countExist = $testcase->fetchAll($where)->count();
        if ($countExist > 0) {
            echo 'testcase_exist';
            return;
        }
        
        $data = array(
            'projectid' => $_SESSION['currentProjectId'],
            'creator' => $_SESSION['userName'],
            'userstoryid' => $_POST['userstoryid'],
            'type' => $_POST['type'],
        	'status' => $_POST['status'],
            'priority' => $_POST['priority'],
            'headline' => $_POST['headline'],
            'content' => Common::replaceAmpStrip($_POST['content']),
            'createdtime' => date('Y-m-d H:i:s'),
            'updatedtime' => date('Y-m-d H:i:s')
        );
        $id = $testcase->insert($data);
        if ($id > 0) {
            $message = 'Add testcase successfully [ID=' . $id . ']';
            Logging::write(Logging::MODULE_TESTCASE, Logging::LEVEL_INFO, $message);
            echo $id;
        } else {
            $message = 'Add testcase unsuccessfully [ID=null]';
            Logging::write(Logging::MODULE_TESTCASE, Logging::LEVEL_ERROR, $message);
            echo 'error';
        }
    }
    
    public function editAction() {
        if (! Permission::isAllowed('testcase', 'edit')) {
            echo 'no_permission';
            return;
        }
        
        $testcase = new Testcase();        
        $testcaseid = $_POST['testcaseid'];
        $testcaseRow = $testcase->find($testcaseid)->current();
        
    	$where = $this->db->quoteInto('headline = ?', $_POST['headline'])
    			. $this->db->quoteInto(' AND testcaseid <> ?', $testcaseid);
        $countExist = $testcase->fetchAll($where)->count();
        if ($countExist > 0) {
            echo 'testcase_exist';
            return;
        }
        
        if ($_SESSION['userName'] != $testcaseRow->creator && $_SESSION['userRole'] != 'Administrator') {
            echo 'no_permission';
            return;
        }
            
        $data = array(
            'userstoryid' => $_POST['userstoryid'],
            'type' => $_POST['type'],
        	'status' => $_POST['status'],
            'priority' => $_POST['priority'],
            'headline' => $_POST['headline'],
            'content' => Common::replaceAmpStrip($_POST['content']),
            'updatedtime' => date('Y-m-d H:i:s')
        );
        $where = $this->db->quoteInto('testcaseid = ?', $testcaseid);
        $row = $testcase->update($data, $where);
        if ($row == 1) {
            $message = 'Update testcase successfully [ID=' . $testcaseid . ']';
            Logging::write(Logging::MODULE_TESTCASE, Logging::LEVEL_INFO, $message);
            echo $row;
        } else {
            $message = 'Update testcase unsuccessfully [ID=' . $testcaseid . ']';
            Logging::write(Logging::MODULE_TESTCASE, Logging::LEVEL_ERROR, $message);
            echo 'error';
        }
    }
    
    public function deleteAction() {
        if (! Permission::isAllowed('testcase', 'delete')) {
            echo 'no_permission';
            return;
        }
        
        $testcase = new Testcase();        
        $testcaseid = $_POST['testcaseid'];
    	$testcaseRow = $testcase->find($testcaseid)->current();
        
        if ($_SESSION['userName'] != $testcaseRow->creator && $_SESSION['userRole'] != 'Administrator') {
            echo 'no_permission';
            return;
        }
        
        $row = $testcaseRow->delete();
        if ($row == 1) {
            $message = 'Delete testcase successfully [ID=' . $testcaseid . ']';
            Logging::write(Logging::MODULE_TESTCASE, Logging::LEVEL_INFO, $message);
            echo $row;
        } else {
            $message = 'Delete testcase unsuccessfully [ID=' . $testcaseid . ']';
            Logging::write(Logging::MODULE_TESTCASE, Logging::LEVEL_ERROR, $message);
            echo 'error';
        }
    }
}
?>