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
 * @copyright  Copyright (c) 2010 AgileOne Team ( http://www.woniuxy.com/ )
 * @license    GNU General Public License V3 ( http://www.gnu.org/licenses )
 * @version    2009-2-1 1.0
 * @author     DengQiang ( http://www.woniuxy.com/teacher/1 )
 */

// Set Include Path and Autoload Zend Framework
set_include_path('.'
    . PATH_SEPARATOR . 'Library'
    . PATH_SEPARATOR . 'App/Model'
    . PATH_SEPARATOR . 'Admin/Model'
    . PATH_SEPARATOR . get_include_path());
include 'Library/Zend/Loader.php';
Zend_Loader::registerAutoload();

// Set global DB connection adapter
session_start();
$config = new Zend_Config_Ini('Common/Config/Global.conf');
if ($config->db->dbname == '') {
	header('Location: Install');
	return;
}

$db = Zend_Db::factory($config->db->adapter, $config->db->toArray());
$db->query('SET NAMES UTF8');
Zend_Db_Table::setDefaultAdapter($db);
Zend_Registry::set('config', $config);

// Set baseDir and baseUrl for global use
Zend_Registry::set('baseDir', dirname($_SERVER['SCRIPT_NAME']));
Zend_Registry::set('baseUrl', $_SERVER['SCRIPT_NAME']);

// Global cache setting
$lifetime = $config->cache->lifetime * 24 * 3600;
$frontendOptions = array('lifeTime'=>$lifetime);
$backendOptionsData = array('cache_dir'=>'Cache/Data');
$cacheData = Zend_Cache::factory('Page', 'File', $frontendOptions, $backendOptionsData);
Zend_Registry::set('cacheData', $cacheData);
$backendOptionsConfig = array('cache_dir'=>'Cache/Config');
$cacheConfig = Zend_Cache::factory('Page', 'File', $frontendOptions, $backendOptionsConfig);
Zend_Registry::set('cacheConfig', $cacheConfig);
        
// Set default language
$frontendOptions = array('lifeTime'=>24*60*60*30, 'automatic_serialization'=>true);
$backendOptions = array('cache_dir'=>'Cache/Lang');
$cacheLang = Zend_Cache::factory('Page', 'File', $frontendOptions, $backendOptions);
Zend_Registry::set('cacheLang', $cacheLang);
Zend_Translate::setCache($cacheLang);
if (! isset($_SESSION['locale']))
    $translate = new Zend_Translate('ini', 'Common/Lang/', $config->lang->default, 
        array('scan' => Zend_Translate::LOCALE_FILENAME));
else {
    $locale = $_SESSION['locale'];
    $translate = new Zend_Translate('ini', 'Common/Lang/Lang.' . $locale, $locale);
}
Zend_Registry::set('Zend_Translate', $translate);

// Initialize view and layout
$view = new Zend_View();
$view->setScriptPath('App/View');
// $view->addHelperPath('Common/Helper', 'Common_Helper');
if (! isset($_SESSION['isLogin']) || $_SESSION['isLogin'] != 'true')
    Zend_Layout::startMvc(array('layoutPath' => 'Common/Layout', 'layout'=>'Login'));
else {
    Zend_Layout::startMvc(array('layoutPath' => 'Common/Layout', 'layout'=>'Default'));
    if ($_SESSION['goAdmin'] == 'true')
        $view->setScriptPath('Admin/View');
}
Zend_Registry::set('view', $view);

// Initialize Zend front controller
$frontController = Zend_Controller_Front::getInstance();
$frontController->setControllerDirectory(array(
	'default' => 'App/Controller',
    'admin' => 'Admin/Controller'
    ));
//$frontController->setParam('useDefaultControllerAlways', true); //No controller, redirect to Default
$frontController->setParam('noViewRenderer', true); //Need specify the view script manually
$frontController->setParam('noErrorHandler', false); //true: no error handle   false: redirect to ErrorController
$frontController->setParam('env', APPLICATION_ENVIRONMENT);
$frontController->dispatch();
?>