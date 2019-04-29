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
 * @version    2009-2-24 1.0
 * @author     DengQiang (http://www.51testing.com/?uid/275266)
 */

class Admin_UserController extends Zend_Controller_Action {

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
        $sql = 'select roleid, rolename from role order by roleid';
        $role = $this->db->fetchAll($sql);
        $this->view->role = $role;
        
        $sql = 'select projectid, projname from project order by projectid';
        $project = $this->db->fetchAll($sql);
        $this->view->project = $project;
        
        $sql = 'select customerid, custname from customer order by customerid';
        $customer = $this->db->fetchAll($sql);
        $this->view->customer = $customer;
        echo $this->view->render('User.phtml');
    }
    
    public function queryAction() {
        $select = $this->db->select();
        $select->from('user', '*');
        if ($_POST['userid'] != '')
            $select->where('userid = ?', $_POST['userid']);
        if ($_POST['username'] != '')
            $select->where("username like '%" . $_POST['username'] . "%'");
        if ($_POST['email'] != '')
            $select->where("email like '%" . $_POST['email'] . "%'");
        if ($_POST['status'] != '')
            $select->where('status = ?', $_POST['status']);
        if ($_POST['roleid'] != '')
            $select->where('user.roleid = ?', $_POST['roleid']);
        if ($_POST['customerid'] != '')
            $select->where('user.customerid = ?', $_POST['customerid']);
        //$select->where('username != ?', 'admin');
        $select->order('userid DESC');
        $select->join('role', 'role.roleid = user.roleid', 'rolename');
        
        $totalRecord = count($this->db->fetchAll($select));
        $pagerSize = Zend_Registry::get('config')->pager->size;
        $currentPage = $_POST['currentpage'];
        $select->limitPage($currentPage,$pagerSize);
        $result = $this->db->fetchAll($select);

        $count = count($result);
        for ($i = 0; $i < $count; $i++) {
            if ($result[$i]['status'] == 1)
                $result[$i]['status'] = 'Normal';
            else
                $result[$i]['status'] = 'Locked';
            $userid = $result[$i]['userid'];
            $customerid = $result[$i]['customerid'];
            $sql = "select project.projectid, project.projname from project, userproject
                where userid=$userid and userproject.projectid=project.projectid";
            $resultProject = $this->db->fetchAll($sql);
            $countProject = count($resultProject);
            if ($countProject > 0) {
                for ($j = 0; $j < $countProject; $j++) {
                    $result[$i]['projname'] .= $resultProject[$j]['projname'] . '<br>';
                }
            }
            else
                $result[$i]['projname'] = '';
            $sql = "select custname from customer where customerid=$customerid";
            $resultCustomer = $this->db->fetchAll($sql);
            if (count($resultCustomer) == 1)
                $result[$i]['custname'] = $resultCustomer[0]['custname'];
            else 
                $result[$i]['custname'] = '';
        }
        
        $result[]['totalRecord'] = $totalRecord;
        echo json_encode($result);
    }

    public function addAction() {
        $user = new User();
        $userProject = new UserProject();
        $projectList = explode(',', $_POST['userproject']);
        
        $where = $this->db->quoteInto('username = ?', $_POST['username']);
        $countExist = $user->fetchAll($where)->count();
        if ($countExist > 0) {
            echo 'user_exist';
            return;
        }
        
        $where = $this->db->quoteInto('email = ?', $_POST['email']);
        $countExist = $user->fetchAll($where)->count();
        if ($countExist > 0) {
            echo 'email_exist';
            return;
        }

        $data = array(
        	'username' => $_POST['username'],
        	'password' => md5($_POST['password']),
        	'email' => $_POST['email'],
            'status' => $_POST['status'],
        	'roleid' => $_POST['roleid'],
            'defaultproject' => $projectList[0],
            'customerid' => $_POST['customerid'],
            'createdtime' => date('Y-m-d H:i:s'),
            'updatedtime' => date('Y-m-d H:i:s')
        );
        $id = $user->insert($data);
        if ($id > 0) {
            foreach ($projectList as $pl) {
                $data = array(
                    'userid' => $id,
                    'projectid' => $pl
                );
                $userProject->insert($data);
            }
            $message = 'Add user successfully [ID=' . $id . ']';
            Logging::write(Logging::MODULE_ADMIN, Logging::LEVEL_INFO, $message);
            echo $id;
        } else {
            $message = 'Add user unsuccessfully [ID=null]';
            Logging::write(Logging::MODULE_ADMIN, Logging::LEVEL_ERROR, $message);
            echo 'error';
        }
    }

    public function editAction() {
        $user = new User();
        $userProject = new UserProject();
        $userid = $_POST['userid'];

        $data = array(
        	'email' => $_POST['email'],
            'status' => $_POST['status'],
        	'roleid' => $_POST['roleid'],
            'customerid' => $_POST['customerid'],
            'updatedtime' => date('Y-m-d H:i:s')
        );
        if ($_POST['password'] != '')
            $data['password'] = md5($_POST['password']);
        
        $where = $this->db->quoteInto('userid = ?', $userid);
        $row = $user->update($data, $where);
        if ($row == 1) {
            $userProject->delete($where);
            $projectList = explode(',', $_POST['userproject']);
            $lenPL = count($projectList);
            for ($i = 0; $i < $lenPL; $i++) {
                $data = array(
                    'userid' => $userid,
                    'projectid' => $projectList[$i]
                );
                $userProject->insert($data);
            }
            $message = 'Update user successfully [ID=' . $userid . ']';
            Logging::write(Logging::MODULE_ADMIN, Logging::LEVEL_INFO, $message);
            echo $row;
        } else {
            $message = 'Update user unsuccessfully [ID=' . $userid . ']';
            Logging::write(Logging::MODULE_ADMIN, Logging::LEVEL_ERROR, $message);
            echo 'error';
        }
    }

    public function deleteAction() {
        $user = new User();
        $userid = $_POST['userid'];
        $userRow = $user->find($userid)->current();
        
        if ($userRow->username == 'admin') {
        	echo 'cant_delete_admin';
        	return;
        }
        
//        $upRowCount = $userRow->findDependentRowset('UserProject')->count();
//        if ($upRowCount > 0) {
//            echo $this->translate->_('message.common.table.referenced') , 'Project';
//            return;
//        }
        
        $row = $userRow->delete();
        if ($row == 1) {
            $message = 'Delete user successfully [ID=' . $userid . ']';
            Logging::write(Logging::MODULE_ADMIN, Logging::LEVEL_INFO, $message);
            echo $row;
        } else {
            $message = 'Delete user unsuccessfully [ID=' . $userid . ']';
            Logging::write(Logging::MODULE_ADMIN, Logging::LEVEL_ERROR, $message);
            echo 'error';
        }
    }
}
?>