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

class VersionController extends Zend_Controller_Action {

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
        $sql = "select * from version where projectid=${projectid} 
        	order by versionid";
        $result = $this->db->fetchAll($sql);
        echo json_encode($result);
    }

    public function addAction() {
        if (! Permission::isAllowed('project', 'edit')) {
            echo 'no_permission';
            return;
        }
        
        $version = new Version();
        
        $where = $this->db->quoteInto('version = ?', $_POST['version']);
        if ($version->fetchAll($where)->count() > 0) {
            $result = $version->fetchAll($where);
            foreach ($result as $value) {
                if ($value['build'] == $_POST['build']) {
                    echo 'version_exist';
                    return;
                }
            }
        }

        $data = array(
            'projectid' => $_POST['projectid'],
        	'version' => $_POST['version'],
        	'build' => $_POST['build'],
            'changelog' => Common::replaceAmpStrip($_POST['changelog']),
            'createdtime' => date('Y-m-d H:i:s')
        );
        $id = $version->insert($data);
        if ($id > 0) {
            $message = 'Add version successfully [ID=' . $id . ']';
            Logging::write(Logging::MODULE_PROJECT, Logging::LEVEL_INFO, $message);
            echo $id;
        } else {
            $message = 'Add version unsuccessfully [ID=null]';
            Logging::write(Logging::MODULE_PROJECT, Logging::LEVEL_ERROR, $message);
            echo 'error';
        }
    }

    public function deleteAction() {
        if (! Permission::isAllowed('project', 'edit')) {
            echo 'no_permission';
            return;
        }
        
        $version = new Version();
        $versionid = $_POST['versionid'];
        $versionRow = $version->find($versionid)->current();
        
        $row = $versionRow->delete();
        if ($row == 1) {
            $message = 'Delete version successfully [ID=' . $versionid . ']';
            Logging::write(Logging::MODULE_PROJECT, Logging::LEVEL_INFO, $message);
            echo $row;
        } else {
            $message = 'Delete version unsuccessfully [ID=' . $versionid . ']';
            Logging::write(Logging::MODULE_PROJECT, Logging::LEVEL_ERROR, $message);
            echo 'error';
        }
    }
}
?>