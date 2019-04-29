<?php
/**
 * AgileOne - Power to Agile Development
 *
 * LICENSE
 *
 * All AgileOne source files are subject to GPL V3 license:
 * 1) You may use the Software for free and non-commercial use
 * 2) You may modify or propagate the source code of the Software
 * We follow GPL V3 to release all source files, but:
 * 1) All copyright of the Software belongs to AgileOne Team
 * 2) Please purchase the commercial license for commercial use
 * For more license infomation, please read the file License.txt.
 *
 * @category   AgileOne
 * @package    AgileOne_Common_Helper
 * @copyright  Copyright (c) 2010 AgileOne Team (http://code.google.com/p/agileone/)
 * @license    GNU General Public License V3 (http://www.gnu.org/licenses)
 * @version    2009-2-25 1.0
 * @author     DengQiang (http://www.51testing.com/?uid/275266)
 */

/**
 * Define a Helper for the HTML Header
 */
class Common_Helper_Header
{
	public function header($type)
	{
	    $this->translate = Zend_Registry::get('Zend_Translate');
	    if ($type == 'login')
	        $title = 'AgileOne - Login Page';
	    elseif ($type == 'admin')
	        $title = 'AgileOne - System Administrator';
	    else 
	        $title = 'AgileOne - Power to Agile Development';
	    $output = '<title>' . $title . '</title>';
        $output .= '<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />';
        $output .= '<meta name="Keywords" content="AgileOne, Agile Development, Agile Software Management" />';
        $output .= '<link rel="stylesheet" type="text/css" href="' . Zend_Registry::get('baseDir') . '/Common/Layout/Default.css" />';
        $output .= '<script language="JavaScript" type="text/javascript" src="' . Zend_Registry::get('baseDir') . '/Library/JQuery/jquery.js"></script>';
	    return $output;
	}
}
?>