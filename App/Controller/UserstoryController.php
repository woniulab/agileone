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
 * @version    2009-5-24 1.0
 * @version	   2010-4-13 1.1 (Change to "Create Userstory: $id", change manday to finishdate, separate to task controller)
 * @author	   DengQiang (http://www.51testing.com/?uid/275266)
 */

class UserstoryController extends Zend_Controller_Action {

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

    	$sql1 = 'select msname from milestone where projectid=' . $_SESSION['currentProjectId']
    	       . ' order by milestoneid';
        $milestone = $this->db->fetchAll($sql1);
        $this->view->milestone = $milestone;
        
        $sql2 = 'select modname from module where projectid=' . $_SESSION['currentProjectId']
    	       . ' order by moduleid';
        $module = $this->db->fetchAll($sql2);
        $this->view->module = $module;
        
        $sql3 = 'select proposalid, headline from proposal where projectid=' . $_SESSION['currentProjectId']
    	       . ' order by proposalid';
        $proposal = $this->db->fetchAll($sql3);
        $this->view->proposal = $proposal;
        
        if ($this->getRequest()->getParam('proposalid') != '') {
        	$proposalid = $this->getRequest()->getParam('proposalid');
       	$sql4 = 'select content from proposal where proposalid = ' . $proposalid;
       	$result = $this->db->fetchAll($sql4);
       	$this->view->proposalContent = $result[0]['content'];
        $this->view->proposalId = $proposalid;}
        
        $projectid = $_SESSION['currentProjectId'];
        $sql5 = "select userid, username, rolename from user, role
        	where user.roleid=role.roleid and userid in
        	(select userid from userproject where projectid=${projectid})
        	order by user.userid";
        $member = $this->db->fetchAll($sql5);
        $this->view->member = $member;
        
        $sql6 = 'select userid, username from user';
        $user = $this->db->fetchAll($sql6);
        $this->view->user = $user;
       
    	echo $this->view->render('Userstory.phtml');
    }
    
    public function queryAction() {
        $select = $this->db->select();
        $select->from('userstory', '*');
        if ($_POST['userstoryid'] != '')
            $select->where('userstoryid = ?', $_POST['userstoryid']);
        if ($_POST['proposalid'] != '')
            $select->where('proposalid = ?', $_POST['proposalid']);
        if ($_POST['creator'] != '')
            $select->where("creator like '%" . $_POST['creator'] . "%'");
        if ($_POST['priority'] != '')
            $select->where('priority = ?', $_POST['priority']);
        if ($_POST['milestone'] != '')
            $select->where('milestone = ?', $_POST['milestone']);
        if ($_POST['module'] != '')
            $select->where('module = ?', $_POST['module']);
        if ($_POST['status'] != '')
            $select->where('status = ?', $_POST['status']);
         if ($_POST['finishdate'] != '')
            $select->where('finishdate = ?', $_POST['finishdate']);
        if ($_POST['headline'] != '')
            $select->where("headline like '%" . $_POST['headline'] . "%'");
        if ($_POST['content'] != '')
            $select->where("content like '%" . Common::replaceAmpStrip($_POST['content']) . "%'");
        $select->where('userstory.projectid = ?', $_SESSION['currentProjectId']);
        $select->order('userstoryid DESC');
        
        $totalRecord = count($this->db->fetchAll($select));
        $pagerSize = Zend_Registry::get('config')->pager->size;
        $currentPage = $_POST['currentpage'];
        $select->limitPage($currentPage,$pagerSize);
        $result = $this->db->fetchAll($select);
        
//        $count = count($result);
//        $referid = $_POST['userstoryid'];
//        if ($count == 1 && $referid != '' && $referid > 0) {
//	        $sql = "select user.userid, user.username from user, task
//	                where task.userid=user.userid and task.referid=$referid";
//	            $resultAssignee = $this->db->fetchAll($sql);
//	            $countAssignee = count($resultAssignee);
//	            if ($countAssignee > 0) {
//	                for ($j = 0; $j < $countAssignee; $j++) {
//	                    $result[0]['assignee'] .= $resultAssignee[$j]['username'] . ',';
//	                }
//	            }
//	            else
//                	$result[0]['assignee'] = '';
//        }
        $result[]['totalRecord'] = $totalRecord;
        
        echo json_encode($result);
    }
    
    public function addAction() {
        if (! Permission::isAllowed('userstory', 'add')) {
            echo 'no_permission';
            return;
        }
        
        $userstory = new Userstory();
        //$task = new Task();
        $proposalid = $_POST['proposalid'];
        
    	$where = $this->db->quoteInto('headline = ?', $_POST['headline']);
        $countExist = $userstory->fetchAll($where)->count();
        if ($countExist > 0) {
            echo 'userstory_exist';
            return;
        }
        
        $data = array(
            'projectid' => $_SESSION['currentProjectId'],
            'creator' => $_SESSION['userName'],
            'proposalid' => $proposalid,
            'priority' => $_POST['priority'],
            'milestone' => $_POST['milestone'],
            'module' => $_POST['module'],
            'status' => $_POST['status'],
        	'finishdate' => $_POST['finishdate'],
        	'headline' => $_POST['headline'],
            'content' => Common::replaceAmpStrip($_POST['content']),
            'createdtime' => date('Y-m-d H:i:s'),
            'updatedtime' => date('Y-m-d H:i:s')
        );
        $id = $userstory->insert($data);
        if ($id > 0) {
        	if ($proposalid != '') {
        		$proposal = new Proposal();
        		$proposalRow = $proposal->find($proposalid)->current();
        		if ($proposalRow->processresult == '')
        			$processresult = '';
        		else 
        			$processresult = $proposalRow->processresult . ' ## ';
        		$data = array(
        			processed => 1,
        			processresult => $processresult . 'Created Userstory: ' . $id
        		);
        		$where = $this->db->quoteInto('proposalid = ?', $proposalid);
        		$proposal->update($data, $where);
        	}
        	
//        	if ($_POST['assignee'] != '') {
//	        	$assigneeList = explode(',', $_POST['assignee']);
//	        	foreach ($assigneeList as $al) {
//	                $data = array(
//	                    'userid' => $al,
//	                    'refertype' => 'userstory',
//	                	'referid' => $id,
//	                	'content' => 'Assinged to work for usertory ' . $id,
//	                	'createdtime' => date('Y-m-d H:i:s'),
//	            		'updatedtime' => date('Y-m-d H:i:s')
//	                );
//	                $task->insert($data);
//	            }
//        	}

            $message = 'Add userstory successfully [ID=' . $id . ']';
            Logging::write(Logging::MODULE_USERSTORY, Logging::LEVEL_INFO, $message);
            echo $id;
        } else {
            $message = 'Add userstory unsuccessfully [ID=null]';
            Logging::write(Logging::MODULE_USERSTORY, Logging::LEVEL_ERROR, $message);
            echo 'error';
        }
    }
    
    public function editAction() {
        if (! Permission::isAllowed('userstory', 'edit')) {
            echo 'no_permission';
            return;
        }
        
        $userstory = new Userstory();
        //$task = new Task();
        $userstoryid = $_POST['userstoryid'];
        $userstoryRow = $userstory->find($userstoryid)->current();
        
        if ($_SESSION['userName'] != $userstoryRow->creator && $_SESSION['userRole'] != 'Administrator') {
            echo 'no_permission';
            return;
        }
        
    	$where = $this->db->quoteInto('headline = ?', $_POST['headline'])
    			. $this->db->quoteInto(' AND userstoryid <> ?', $userstoryid);
        $countExist = $userstory->fetchAll($where)->count();
        if ($countExist > 0) {
            echo 'userstory_exist';
            return;
        }
            
        $data = array(
            'projectid' => $_SESSION['currentProjectId'],
            'proposalid' => $_POST['proposalid'],
            'priority' => $_POST['priority'],
            'milestone' => $_POST['milestone'],
            'module' => $_POST['module'],
            'status' => $_POST['status'],
        	'finishdate' => $_POST['finishdate'],
        	'headline' => $_POST['headline'],
            'content' => Common::replaceAmpStrip($_POST['content']),
            'updatedtime' => date('Y-m-d H:i:s')
        );
        $where = $this->db->quoteInto('userstoryid = ?', $userstoryid);
        $row = $userstory->update($data, $where);
        if ($row == 1) {
        	
//        	$where = $this->db->quoteInto('refertype = ?', 'userstory');
//        	$where .= $this->db->quoteInto(' AND referid = ?', $userstoryid);
//        	$taskRowSet = $task->fetchAll($where);  
//        	if ($_POST['assignee'] != '') {
//	        	$assigneeList = explode(',', $_POST['assignee']); 	
//	        	foreach ($taskRowSet as $taskRow) {
//	        		if (in_array($taskRow['userid'], $assigneeList)) {
//	        			foreach ($assigneeList as $key => $value) {
//						if ($taskRow['userid'] == $value)
//	        				array_splice($assigneeList, $key, 1);
//	        			}
//	        		}
//	        		else {
//	        			$taskRow->delete();
//	        		}
//	        	}
//	        	if (count($assigneeList) > 0) {
//		        	foreach ($assigneeList as $al) {
//		                $data = array(
//		                    'userid' => $al,
//		                    'refertype' => 'userstory',
//		                	'referid' => $userstoryid,
//		                	'content' => 'Assinged to work for usertory ' . $userstoryid,
//		                	'createdtime' => date('Y-m-d H:i:s'),
//		            		'updatedtime' => date('Y-m-d H:i:s')
//		                );
//		                $task->insert($data);
//		            }
//	        	}
//        	}
            $message = 'Update userstory successfully [ID=' . $userstoryid . ']';
            Logging::write(Logging::MODULE_USERSTORY, Logging::LEVEL_INFO, $message);
            echo $row;
        } else {
            $message = 'Update userstory unsuccessfully [ID=' . $userstoryid . ']';
            Logging::write(Logging::MODULE_USERSTORY, Logging::LEVEL_ERROR, $message);
            echo 'error';
        }
    }
    
    public function deleteAction() {
        if (! Permission::isAllowed('userstory', 'delete')) {
            echo 'no_permission';
            return;
        }
        
        $userstory = new Userstory();        
        $userstoryid = $_POST['userstoryid'];
        $userstoryRow = $userstory->find($userstoryid)->current();
        
        if ($_SESSION['userName'] != $userstoryRow->creator && $_SESSION['userRole'] != 'Administrator') {
            echo 'no_permission';
            return;
        }
        
        $row = $userstoryRow->delete();
        if ($row == 1) {
        	$task = new Task();
        	$where = $this->db->quoteInto('refertype = ?', 'userstory');
        	$where .= $this->db->quoteInto(' AND referid = ?', $userstoryid);
        	$task->delete($where);
            $message = 'Delete userstory successfully [ID=' . $userstoryid . ']';
            Logging::write(Logging::MODULE_USERSTORY, Logging::LEVEL_INFO, $message);
            echo $row;
        } else {
            $message = 'Delete userstory unsuccessfully [ID=' . $userstoryid . ']';
            Logging::write(Logging::MODULE_USERSTORY, Logging::LEVEL_ERROR, $message);
            echo 'error';
        }
    }
}
?>