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
 * @version    2010-4-14 1.1 (New in version 1.1)
 * @author     DengQiang (http://www.51testing.com/?uid/275266)
 */

class TaskController extends Zend_Controller_Action {

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
    	echo $this->view->render('Task.phtml');
    }
    
    public function queryAction() {
        $select = $this->db->select();
        $select->from('task', '*');
        if ($_POST['taskid'] != '')
            $select->where('taskid = ?', $_POST['taskid']);
        if ($_POST['userid'] != '')
            $select->where('userid = ?' , $_POST['userid']);
        if ($_POST['refertype'] != '')
            $select->where('refertype = ?', $_POST['refertype']);
        if ($_POST['referid'] != '')
            $select->where('referid = ?', $_POST['referid']);
        if ($_POST['content'] != '')
            $select->where("content like '%" . $_POST['content'] . "'");
        if ($_POST['status'] != '')
            $select->where('status = ?', $_POST['content']);
        $select->order('taskid DESC');
        
        $totalRecord = count($this->db->fetchAll($select));
        $pagerSize = Zend_Registry::get('config')->pager->size;
        $currentPage = $_POST['currentpage'];
        $select->limitPage($currentPage,$pagerSize);
        $result = $this->db->fetchAll($select);
        $result[]['totalRecord'] = $totalRecord;

        echo json_encode($result);
    }
    
    public function assigneeAction() {
    	$refertype = $_POST['refertype'];
    	$referid = $_POST['referid'];
    	$sql = "select user.userid, user.username, role.rolename from task, user, role 
    			where task.refertype='$refertype' and task.referid=$referid and 
    			task.userid=user.userid and user.roleid=role.roleid order by user.userid";
    	$result = $this->db->fetchAll($sql);
    	
    	echo json_encode($result);
    }
    
    public function addAction() {
       	$task = new Task();
       	
   		$where = $this->db->quoteInto('refertype = ?', $_POST['refertype'])
               . $this->db->quoteInto(' AND referid = ?', $_POST['referid'])
               . $this->db->quoteInto(' AND userid = ?', $_POST['userid']);
	    $countExist = $task->fetchAll($where)->count();
	    if ($countExist > 0) {
	    	echo 'task_exist';
	    	return;
	    }
	    else {
	    	$data = array(
                'userid' => $_POST['userid'],
                'refertype' => $_POST['refertype'],
               	'referid' => $_POST['referid'],
               	'content' => 'Assinged to work for ' . $_POST['refertype'] . ' ' . $_POST['referid'],
               	'createdtime' => date('Y-m-d H:i:s'),
           		'updatedtime' => date('Y-m-d H:i:s')
            );
            $id = $task->insert($data);
            if ($id > 0) {
	            $message = 'Add task successfully [ID=' . $id . ']';
	            Logging::write(Logging::MODULE_TASK, Logging::LEVEL_INFO, $message);
	            echo $id;
	        }
	        else {
	            $message = 'Add task unsuccessfully [ID=null]';
	            Logging::write(Logging::MODULE_TASK, Logging::LEVEL_ERROR, $message);
	            echo 'error';
	        }
	    }
    }
    
    public function editAction() {
       	
    }
    
    public function deleteAction() {
        $task = new Task();
       	
   		$where = $this->db->quoteInto('refertype = ?', $_POST['refertype'])
               . $this->db->quoteInto(' AND referid = ?', $_POST['referid'])
               . $this->db->quoteInto(' AND userid = ?', $_POST['userid']);
        $taskRow = $task->fetchAll($where)->current();
        $taskid = $taskRow->taskid;
        $row = $taskRow->delete();
    	if ($row == 1) {
            $message = 'Delete task successfully [ID=' . $taskid . ']';
            Logging::write(Logging::MODULE_TASK, Logging::LEVEL_INFO, $message);
            echo $row;
        }
        else {
            $message = 'Delete task unsuccessfully [ID=null]';
            Logging::write(Logging::MODULE_TASK, Logging::LEVEL_ERROR, $message);
            echo 'error';
        }
    }
    
    public function statusAction() {
    	$task = new Task();
    	$taskid = $_POST['taskid'];
    	$status = $_POST['status'];
    	
    	$data = array(
    		'status' => $status,
    		'updatedtime' => date('Y-m-d H:i:s')
    	);
    	$where = $this->db->quoteInto('taskid = ?', $taskid);
        $row = $task->update($data, $where);
        if ($row == 1) {
            $message = 'Update task status to ' . $status . ' [ID=' . $taskid . ']';
            Logging::write(Logging::MODULE_DEFECT, Logging::LEVEL_INFO, $message);
            echo $row;
        } else {
            $message = 'Update task status unsuccessfully [ID=' . $taskid . ']';
            Logging::write(Logging::MODULE_DEFECT, Logging::LEVEL_ERROR, $message);
            echo 'error';
        }
    }
}
?>