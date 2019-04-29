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
 * @version    2009-5-19 1.0
 * @author     DengQiang (http://www.51testing.com/?uid/275266)
 */

class UserController extends Zend_Controller_Action {

    /**
     * Initialize the controller for common usage
     */
    public function init() {
    	$this->view = Zend_Registry::get('view');
        $this->translate = Zend_Registry::get('Zend_Translate');
        $this->db = Zend_Db_Table::getDefaultAdapter();
        $this->_helper->layout->disableLayout();
    }
    
    public function listAction() {
//    	$this->_helper->layout->enableLayout();
    	
//    	$sql = 'select userid, username, rolename from user, role
//        	where user.roleid=role.roleid order by userid';
//        $user = $this->db->fetchAll($sql);
//        $this->view->user = $user;
        
    	echo $this->view->render('UserList.phtml');
    }
    
    public function queryAction() {
    	$select = $this->db->select();
        $select->from('user', '*');
        if ($_POST['username'] != '')
            $select->where("username like '%" . $_POST['username'] . "%'");
        $select->join('role', 'user.roleid=role.roleid', 'rolename');
        $select->order('userid');
        $result = $this->db->fetchAll($select);
        echo json_encode($result);
    }
}