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

class ModuleController extends Zend_Controller_Action {

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
        $sql = "select * from module where projectid=${projectid} 
        	order by moduleid";
        $result = $this->db->fetchAll($sql);
        echo json_encode($result);
    }

    public function addAction() {
        if (! Permission::isAllowed('project', 'edit')) {
            echo 'no_permission';
            return;
        }
        
        $module = new Module();
        
        $where = $this->db->quoteInto('modname = ?', $_POST['modname']);
        $countExist = $module->fetchAll($where)->count();
        if ($countExist > 0) {
            echo 'module_exist';
            return;
        }

        $data = array(
            'projectid' => $_POST['projectid'],
        	'modname' => $_POST['modname'],
        	'modusage' => $_POST['modusage']
        );
        $id = $module->insert($data);
        if ($id > 0) {
            $message = 'Add module successfully [ID=' . $id . ']';
            Logging::write(Logging::MODULE_PROJECT, Logging::LEVEL_INFO, $message);
            echo $id;
        } else {
            $message = 'Add module unsuccessfully [ID=null]';
            Logging::write(Logging::MODULE_PROJECT, Logging::LEVEL_ERROR, $message);
            echo 'error';
        }
    }

    public function deleteAction() {
        if (! Permission::isAllowed('project', 'edit')) {
            echo 'no_permission';
            return;
        }
        
        $module = new Module();
        $moduleid = $_POST['moduleid'];
        $moduleRow = $module->find($moduleid)->current();
        
        $row = $moduleRow->delete();
        if ($row == 1) {
            $message = 'Delete module successfully [ID=' . $moduleid . ']';
            Logging::write(Logging::MODULE_PROJECT, Logging::LEVEL_INFO, $message);
            echo $row;
        } else {
            $message = 'Delete module unsuccessfully [ID=' . $moduleid . ']';
            Logging::write(Logging::MODULE_PROJECT, Logging::LEVEL_ERROR, $message);
            echo 'error';
        }
    }
}
?>