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
 * @version    2009-3-7 1.0
 * @author     DengQiang (http://www.51testing.com/?uid/275266)
 */

class Admin_ToolController extends Zend_Controller_Action {

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
        echo $this->view->render('Tool.phtml');
    }
    
    public function ccacheAction() {
        $mode = $_POST['mode'];
        $cacheData = Zend_Registry::get('cacheData');
        $cacheConfig = Zend_Registry::get('cacheConfig');
        $cacheLang = Zend_Registry::get('cacheLang');
        if ($mode == 'old') {
            $cacheData->clean(Zend_Cache::CLEANING_MODE_OLD);
            $cacheConfig->clean(Zend_Cache::CLEANING_MODE_OLD);
            $cacheLang->clean(Zend_Cache::CLEANING_MODE_OLD);
            $message = 'Clear expired cache successfully.';
            Logging::write(Logging::MODULE_ADMIN, Logging::LEVEL_WARN, $message);
            echo 'successful';
        }
        else {
            $cacheData->clean(Zend_Cache::CLEANING_MODE_ALL);
            $cacheConfig->clean(Zend_Cache::CLEANING_MODE_ALL);
            $cacheLang->clean(Zend_Cache::CLEANING_MODE_ALL);
            $message = 'Clear all cache successfully.';
            Logging::write(Logging::MODULE_ADMIN, Logging::LEVEL_WARN, $message);
            echo 'successful';
        }
    }
    
    public function backupAction() {
        $mode = $_POST['mode'];
        $dbBackup = new DBBackup();
        $tables = $this->db->listTables();
        if ($mode == 'schema') {
            $fileName = $dbBackup->schemaToSql($tables);
            $message = "Backup table schema successfully:<br>" . $fileName;
        }
        else {
            $fileName = $dbBackup->dataToSql($tables);
            $message = "Backup database successfully:<br>" . $fileName;
        }
        $url = Zend_Registry::get('baseDir') . '/Attachment/DBBackup/' . $fileName;
        Logging::write(Logging::MODULE_ADMIN, Logging::LEVEL_INFO, $message);
        echo "<a href=$url>$url</a>";
    }
}
?>