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
 * @version    2009-2-24 1.0
 * @author     DengQiang (http://www.51testing.com/?uid/275266)
 */

/**
 * Define a Helper for the Edit table's Hide/Show
 */
class Common_Helper_HideShow
{
	public function hideShow()
	{
	    $this->translate = Zend_Registry::get('Zend_Translate');
	    $output = '&nbsp;&nbsp';
	    $output .= '<label id="hideShow">' . $this->translate->_('common.button.hide') . '</label>&nbsp;|&nbsp';
	    //$output .= '<label id="show">' . $this->translate->_('common.button.show') . '</label>';
	    return $output;
	}
}
?>