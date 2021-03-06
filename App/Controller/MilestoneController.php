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
 * @version    2009-5-20 1.0
 * @version    2010-4-15 1.1 (update permission from add/delete to edit, add editAction)
 * @author     DengQiang (http://www.51testing.com/?uid/275266)
 */

class MilestoneController extends Zend_Controller_Action {

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
        $sql = "select * from milestone where projectid=${projectid} 
        	order by milestoneid";
        $result = $this->db->fetchAll($sql);
        echo json_encode($result);
    }

    public function addAction() {
        if (! Permission::isAllowed('project', 'edit')) {
            echo 'no_permission';
            return;
        }
        
        $milestone = new Milestone();
        
        $where = $this->db->quoteInto('msname = ?', $_POST['msname'])
               . $this->db->quoteInto(' AND projectid = ?', $_POST['projectid']);
        $countExist = $milestone->fetchAll($where)->count();
        if ($countExist > 0) {
            echo 'milestone_exist';
            return;
        }

        $data = array(
            'projectid' => $_POST['projectid'],
        	'msname' => $_POST['msname'],
        	'msusage' => $_POST['msusage'],
            'createdtime' => date('Y-m-d H:i:s'),
        	'updatedtime' => date('Y-m-d H:i:s')
        );
        $id = $milestone->insert($data);
        if ($id > 0) {
            $message = 'Add milestone successfully [ID=' . $id . ']';
            Logging::write(Logging::MODULE_PROJECT, Logging::LEVEL_INFO, $message);
            echo $id;
        } else {
            $message = 'Add milestone unsuccessfully [ID=null]';
            Logging::write(Logging::MODULE_PROJECT, Logging::LEVEL_ERROR, $message);
            echo 'error';
        }
    }
    
    public function editAction() {
        if (! Permission::isAllowed('project', 'edit')) {
            echo 'no_permission';
            return;
        }
        
        $milestone = new Milestone();
        
        $where = $this->db->quoteInto('msname = ?', $_POST['msname'])
               . $this->db->quoteInto(' AND milestoneid <> ?', $_POST['milestoneid'])
               . $this->db->quoteInto(' AND projectid = ?', $_POST['projectid']);
        $countExist = $milestone->fetchAll($where)->count();
        if ($countExist > 0) {
            echo 'milestone_exist';
            return;
        }

        $data = array(
            'projectid' => $_POST['projectid'],
        	'msname' => $_POST['msname'],
        	'msusage' => $_POST['msusage'],
            'updatedtime' => date('Y-m-d H:i:s')
        );
        $where = $this->db->quoteInto('milestoneid = ?', $_POST['milestoneid']);
        $row = $milestone->update($data, $where);
        if ($row == 1) {
            $message = 'Update milestone successfully [ID=' . $_POST['milestoneid'] . ']';
            Logging::write(Logging::MODULE_PROJECT, Logging::LEVEL_INFO, $message);
            echo $row;
        } else {
            $message = 'Update milestone unsuccessfully [ID=' . $_POST['milestoneid'] . ']';
            Logging::write(Logging::MODULE_PROJECT, Logging::LEVEL_ERROR, $message);
            echo 'error';
        }
    }

    public function deleteAction() {
        if (! Permission::isAllowed('project', 'edit')) {
            echo 'no_permission';
            return;
        }
        
        $milestone = new Milestone();
        $milestoneid = $_POST['milestoneid'];
        $milestoneRow = $milestone->find($milestoneid)->current();
        
        $row = $milestoneRow->delete();
        if ($row == 1) {
            $message = 'Delete milestone successfully [ID=' . $milestoneid . ']';
            Logging::write(Logging::MODULE_PROJECT, Logging::LEVEL_INFO, $message);
            echo $row;
        } else {
            $message = 'Delete milestone unsuccessfully [ID=' . $milestoneid . ']';
            Logging::write(Logging::MODULE_PROJECT, Logging::LEVEL_ERROR, $message);
            echo 'error';
        }
    }
}
?>