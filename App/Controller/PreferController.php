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
 * @version    2009-3-22 1.0
 * @author     DengQiang (http://www.51testing.com/?uid/275266)
 */

class PreferController extends Zend_Controller_Action {

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
    	$role = new Role();
    	$where = $this->db->quoteInto('rolename = ?', $_SESSION['userRole']);
    	$roleRow = $role->fetchRow($where);
    	$this->view->roledesc = $roleRow->roledesc;
    	
    	$user = new User();
    	$userRow = $user->find($_SESSION['userId'])->current();
    	$projectRowset = $userRow->findManyToManyRowset('Project', 'UserProject')->toArray();
    	$this->view->myproject = $projectRowset;
    	echo $this->view->render('Prefer.phtml');
    }
    
    public function editAction() {
        $user = new User();
        $userid = $_SESSION['userId'];
        
        $data = array(
            'defaultproject' => $_POST['defaultproject'],
        	'email' => $_POST['email'],
            'updatedtime' => date('Y-m-d H:i:s')
        );
        if ($_POST['password'] != '')
            $data['password'] = md5($_POST['password']);
        
        $where = $this->db->quoteInto('userid = ?', $userid);
        $row = $user->update($data, $where);
        if ($row == 1) {
            $_SESSION['currentProjectId'] = $_POST['defaultproject'];
            $_SESSION['currentProjectName'] = $_POST['projname'];
            $_SESSION['userEmail'] = $_POST['email'];
            
            $message = 'Update user successfully [ID=' . $userid . ']';
            Logging::write(Logging::MODULE_SYSTEM, Logging::LEVEL_INFO, $message);
            echo $row;
        }
        else {
            $message = 'Update user unsuccessfully [ID=' . $userid . ']';
            Logging::write(Logging::MODULE_SYSTEM, Logging::LEVEL_ERROR, $message);
            echo 'error';
        }
    }
    
    public function roleAction() {
        $role = new Role();
        $rolename = $_POST['rolename'];
        $where = $this->db->quoteInto('rolename = ?', $rolename);
        $result = $role->fetchAll($where);
        echo json_encode($result->toArray());
    }
}
?>