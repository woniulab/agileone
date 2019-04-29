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
 * @version    2009-3-5 1.0
 * @author     DengQiang (http://www.51testing.com/?uid/275266)
 */

class Admin_GlobalController extends Zend_Controller_Action {

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
        echo $this->view->render('Global.phtml');
    }
    
    public function setlangAction() {
        $lang = $_POST['lang'];
        $file = new File();
        $state = $file->updateConfig(array('lang.default' => $lang), 'Common/Config/Global.conf');
        if ($state == 'successful') {
            $message = 'Set default language to [' . $lang . ']';
            Logging::write(Logging::MODULE_ADMIN, Logging::LEVEL_WARN, $message);
        }
        echo $state;
    }
    
    public function setcacheAction() {
        $cache = $_POST['cache'];
        $file = new File();
        $state = $file->updateConfig(array('cache.lifetime' => $cache), 'Common/Config/Global.conf');
        if ($state == 'successful') {
            $message = 'Set cache lifecycle time to [' . $cache . ']';
            Logging::write(Logging::MODULE_ADMIN, Logging::LEVEL_WARN, $message);
        }
        echo $state;
    }
    
    public function setcookieAction() {
        $cookie = $_POST['cookie'];
        $file = new File();
        $state = $file->updateConfig(array('cookie.lifetime' => $cookie), 'Common/Config/Global.conf');
        if ($state == 'successful') {
            $message = 'Set cookie lifecycle time to [' . $cookie . ']';
            Logging::write(Logging::MODULE_ADMIN, Logging::LEVEL_WARN, $message);
        }
        echo $state;
    }
    
    public function setrewriteAction() {
        $rewrite = $_POST['rewrite'];
        $file = new File();
        $state = $file->updateConfig(array('module.rewrite' => $rewrite), 'Common/Config/Global.conf');
        if ($state == 'successful') {
            $message = 'Set module rewrite to [' . $rewrite . ']';
            Logging::write(Logging::MODULE_ADMIN, Logging::LEVEL_WARN, $message);
        }
        echo $state;
    }
    
	public function setpagersizeAction() {
        $pagerSize = $_POST['pagersize'];
        $file = new File();
        $state = $file->updateConfig(array('pager.size' => $pagerSize), 'Common/Config/Global.conf');
        if ($state == 'successful') {
            $message = 'Set pager size to [' . $pagerSize . ']';
            Logging::write(Logging::MODULE_ADMIN, Logging::LEVEL_WARN, $message);
        }
        echo $state;
    }
    
	public function setuploadsizeAction() {
        $uploadSize = $_POST['uploadsize'];
        $file = new File();
        $state = $file->updateConfig(array('upload.size' => $uploadSize), 'Common/Config/Global.conf');
        if ($state == 'successful') {
            $message = 'Set upload size to [' . $uploadSize . ']';
            Logging::write(Logging::MODULE_ADMIN, Logging::LEVEL_WARN, $message);
        }
        echo $state;
    }
}
?>