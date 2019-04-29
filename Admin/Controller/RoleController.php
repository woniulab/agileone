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
 * @version    2009-3-9 1.0
 * @author     DengQiang (http://www.51testing.com/?uid/275266)
 */

class Admin_RoleController extends Zend_Controller_Action {

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
        echo $this->view->render('Role.phtml');
    }
    
    public function queryAction() {
        $role = new Role();
        $roleid = $_POST['roleid'];
        
        $where = null;
        if ($roleid != '') {
            $where = $this->db->quoteInto('roleid = ?', $roleid);
        }
        $order = 'roleid';
        
        $result = $role->fetchAll($where, $order)->toArray();
        $result[]['totalRecord'] = count($result);
        
        echo json_encode($result);
    }
    
    public function addAction() {
        $role = new Role();
        
        $where = $this->db->quoteInto('rolename = ?', $_POST['rolename']);
        $countExist = $role->fetchAll($where)->count();
        if ($countExist > 0) {
            echo 'role_exist';
            return;
        }
        
        $data = array(
        	'rolename' => $_POST['rolename'],
        	'roledesc' => $_POST['roledesc'],
        	'dashboard' => $_POST['dashboard'],
            'notice' => $_POST['notice'],
            'minutes' => $_POST['minutes'],
            'knowledge' => $_POST['knowledge'],
            'project' => $_POST['project'],
        	'task' => $_POST['task'],
            'proposal' => $_POST['proposal'],
            'userstory' => $_POST['userstory'],
            'spec' => $_POST['spec'],
            'testcase' => $_POST['testcase'],
        	'execution' => $_POST['execution'],
            'defect' => $_POST['defect'],
        );
        $id = $role->insert($data);
        if ($id > 0) {
            $message = 'Add role successfully [ID=' . $id . ']';
            Logging::write(Logging::MODULE_ADMIN, Logging::LEVEL_INFO, $message);
            echo $id;
        } else {
            $message = 'Add role unsuccessfully [ID=null]';
            Logging::write(Logging::MODULE_ADMIN, Logging::LEVEL_ERROR, $message);
            echo 'error';
        }
    }
    
    public function editAction() {
        $role = new Role();
        $roleid = $_POST['roleid'];

        $where = $this->db->quoteInto('rolename = ?', $_POST['rolename'])
                . $this->db->quoteInto(' AND roleid <> ?', $roleid);
        $countExist = $role->fetchAll($where)->count();
        if ($countExist > 0) {
            echo 'role_exist';
            return;
        }
        
        $data = array(
        	'rolename' => $_POST['rolename'],
        	'roledesc' => $_POST['roledesc'],
        	'dashboard' => $_POST['dashboard'],
            'notice' => $_POST['notice'],
            'minutes' => $_POST['minutes'],
            'knowledge' => $_POST['knowledge'],
            'project' => $_POST['project'],
        	'task' => $_POST['task'],
            'proposal' => $_POST['proposal'],
            'userstory' => $_POST['userstory'],
            'spec' => $_POST['spec'],
            'testcase' => $_POST['testcase'],
        	'execution' => $_POST['execution'],
            'defect' => $_POST['defect']
        );
        $where = $this->db->quoteInto('roleid = ?', $roleid);
        $row = $role->update($data, $where);
        if ($row == 1) {
            $message = 'Update role successfully [ID=' . $roleid . ']';
            Logging::write(Logging::MODULE_ADMIN, Logging::LEVEL_INFO, $message);
            echo $row;
        } else {
            $message = 'Update role unsuccessfully [ID=null]';
            Logging::write(Logging::MODULE_ADMIN, Logging::LEVEL_ERROR, $message);
            echo 'error';
        }
    }
    
    public function deleteAction() {
        $role = new Role();
        $roleid = $_POST['roleid'];
        $roleRow = $role->find($roleid)->current();
        
        // If role is reserved by Agileone, can't delete it
        if ($roleid <= 7) {
            echo $this->translate->_('message.role.rolename.reserved');
            return;
        }
        
        $userRowCount = $roleRow->findDependentRowset('User')->count();
        if ($userRowCount > 0) {
            echo $this->translate->_('message.common.table.referenced') , 'User';
            return;
        }

        $row = $roleRow->delete();
        if ($row == 1) {
            $message = 'Delete role successfully [ID=' . $roleid . ']';
            Logging::write(Logging::MODULE_ADMIN, Logging::LEVEL_INFO, $message);
            echo $row;
        } else {
            $message = 'Delete role unsuccessfully [ID=' . $roleid . ']';
            Logging::write(Logging::MODULE_ADMIN, Logging::LEVEL_ERROR, $message);
            echo 'error';
        }
    }
}
?>