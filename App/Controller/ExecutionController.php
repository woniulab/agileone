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
 * @version    2010-1-22 1.0
 * @author     DengQiang (http://www.51testing.com/?uid/275266)
 */

class ExecutionController extends Zend_Controller_Action {

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
        
        $sql1 = 'select pfname from platform where projectid=' . $_SESSION['currentProjectId']
       			. ' order by platformid desc';
       	$platform = $this->db->fetchAll($sql1);
        $this->view->platform = $platform;
        
        $sql2 = 'select version, build from version where projectid=' . $_SESSION['currentProjectId']
       			. ' order by versionid desc'; 
       	$version = $this->db->fetchAll($sql2);
        $this->view->version = $version;
        
    	echo $this->view->render('Execution.phtml');
    }
    
    public function queryAction() {
        $select = $this->db->select();
        $select->from('execution', '*');
        if ($_POST['executionid'] != '')
            $select->where('executionid = ?', $_POST['executionid']);
        if ($_POST['testcaseid'] != '')
            $select->where('testcaseid = ?', $_POST['testcaseid']);
        if ($_POST['tester'] != '')
            $select->where("tester like '%" . $_POST['tester'] . "'");
        if ($_POST['platform'] != '')
            $select->where('platform = ?', $_POST['platform']);
        if ($_POST['version'] != '')
            $select->where('version = ?', $_POST['version']);
        if ($_POST['result'] != '')
            $select->where('result = ?', $_POST['result']);
        if ($_POST['comment'] != '')
            $select->where("comment like '%" . $_POST['comment'] . "'");
        $select->order('executionid DESC');
        $select->join('testcase', 'testcase.testcaseid = execution.testcaseid', 'headline');
        
        $totalRecord = count($this->db->fetchAll($select));
        $pagerSize = Zend_Registry::get('config')->pager->size;
        $currentPage = $_POST['currentpage'];
        $select->limitPage($currentPage,$pagerSize);
        $result = $this->db->fetchAll($select);
        $result[]['totalRecord'] = $totalRecord;

        echo json_encode($result);
    }
    
	public function addAction() {
    	if (! Permission::isAllowed('execution', 'add')) {
            echo 'no_permission';
            return;
        }
        
        $execution = new Execution();
    	$data = array(
    		'projectid' => $_SESSION['currentProjectId'],
        	'testcaseid' => $_POST['testcaseid'],
    		'tester' => $_SESSION['userName'],
            'platform' => $_POST['platform'],
            'version' => $_POST['version'],
            'result' => $_POST['result'],
            'comment' => $_POST['comment'],
            'exectime' => date('Y-m-d H:i:s')
        );
        $id = $execution->insert($data);
        if ($id > 0) {
            $message = 'Add execution result successfully [ID=' . $id . ']';
            Logging::write(Logging::MODULE_EXECUTION, Logging::LEVEL_INFO, $message);
            echo $id;
        } else {
            $message = 'Add execution result unsuccessfully [ID=null]';
            Logging::write(Logging::MODULE_EXECUTION, Logging::LEVEL_ERROR, $message);
            echo 'error';
        }
    }
    
    public function editAction() {
    if (! Permission::isAllowed('execution', 'edit')) {
            echo 'no_permission';
            return;
        }
        
        $execution = new Execution();
        $executionid = $_POST['executionid'];
        
    	$data = array(
    		'tester' => $_POST['tester'],
            'platform' => $_POST['platform'],
            'version' => $_POST['version'],
            'result' => $_POST['result'],
            'comment' => $_POST['comment'],
            'exectime' => date('Y-m-d H:i:s')
        );
        $where = $this->db->quoteInto('executionid = ?', $executionid);
        $row = $execution->update($data, $where);
        if ($row == 1) {
            $message = 'Update execution result successfully [ID=' . $executionid . ']';
            Logging::write(Logging::MODULE_EXECUTION, Logging::LEVEL_INFO, $message);
            echo $row;
        } else {
            $message = 'Update execution result unsuccessfully [ID=' . $executionid . ']';
            Logging::write(Logging::MODULE_EXECUTION, Logging::LEVEL_ERROR, $message);
            echo 'error';
        }
    }
    
	public function deleteAction() {
        if (! Permission::isAllowed('execution', 'delete')) {
            echo 'no_permission';
            return;
        }
        
        $execution = new Execution();        
        $executionid = $_POST['executionid'];
    	$executionRow = $execution->find($executionid)->current();
        
        $row = $executionRow->delete();
        if ($row == 1) {
            $message = 'Delete execution result successfully [ID=' . $executionid . ']';
            Logging::write(Logging::MODULE_EXECUTION, Logging::LEVEL_INFO, $message);
            echo $row;
        } else {
            $message = 'Delete execution result unsuccessfully [ID=' . $executionid . ']';
            Logging::write(Logging::MODULE_EXECUTION, Logging::LEVEL_ERROR, $message);
            echo 'error';
        }
    }
}
?>