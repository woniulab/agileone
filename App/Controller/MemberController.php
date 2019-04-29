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
 * @version    2010-4-15 1.1 (update permission from add/delete to edit)
 * @author     DengQiang (http://www.51testing.com/?uid/275266)
 */

class MemberController extends Zend_Controller_Action {

    /**
     * Initialize the controller for common usage
     */
    public function init() {
        $this->translate = Zend_Registry::get('Zend_Translate');
        $this->db = Zend_Db_Table::getDefaultAdapter();
        $this->_helper->layout->disableLayout();
    }
    
    public function queryAction() {
        $projectid = $_POST['projectid'];
        $sql = "select userid, username, rolename from user, role
        	where user.roleid=role.roleid and userid in
        	(select userid from userproject where projectid=${projectid})
        	order by user.roleid";
        $result = $this->db->fetchAll($sql);
        echo json_encode($result);
    }
    
    public function addAction() {
        if (! Permission::isAllowed('project', 'edit')) {
            echo 'no_permission';
            return;
        }
        
        $userProject = new UserProject();
        
        $where = $this->db->quoteInto('projectid = ?', $_POST['projectid'])
                . $this->db->quoteInto(' AND userid = ?', $_POST['userid']);
        $countExist = $userProject->fetchAll($where)->count();
        if ($countExist > 0) {
            echo 'user_exist';
            return;
        }
        
        $data = array(
            'userid' => $_POST['userid'],
            'projectid' => $_POST['projectid']
        );
        
        $id = $userProject->insert($data);
        if ($id > 0) {
            $message = 'Add member successfully [UID=' . $_POST['userid'] . ']';
            Logging::write(Logging::MODULE_PROJECT, Logging::LEVEL_INFO, $message);
            echo $id;
        } else {
            $message = 'Add member unsuccessfully [UID=' . $_POST['userid'] . ']';
            Logging::write(Logging::MODULE_PROJECT, Logging::LEVEL_ERROR, $message);
            echo 'error';
        }
    }
    
    public function deleteAction() {
        if (! Permission::isAllowed('project', 'edit')) {
            echo 'no_permission';
            return;
        }
        
        $userProject = new UserProject();
        $where = $this->db->quoteInto('projectid = ?', $_POST['projectid'])
                . $this->db->quoteInto(' AND userid = ?', $_POST['userid']);
        $row = $userProject->delete($where);
        if ($row == 1) {
            $message = 'Delete member successfully [UID=' . $_POST['userid'] . ']';
            Logging::write(Logging::MODULE_PROJECT, Logging::LEVEL_INFO, $message);
            echo $row;
        } else {
            $message = 'Delete member unsuccessfully [UID=' . $_POST['userid'] . ']';
            Logging::write(Logging::MODULE_PROJECT, Logging::LEVEL_ERROR, $message);
            echo 'error';
        }
    }
}
?>