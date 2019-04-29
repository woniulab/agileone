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
 * Define a Helper for the Data table's operations column
 */
class Common_Helper_EditLabel
{
	public function editLabel($type, $userid)
	{
	    $this->translate = Zend_Registry::get('Zend_Translate');
	    if ($type == 'normal')
	    {
    	    $output = '<a href="' . Zend_Registry::get('baseUrl') . '/admin/user/index/userid/' . $userid . '">' . $this->translate->_('common.button.edit') . '</a>&nbsp;&nbsp;';
    	    $output .= '<a href="' . Zend_Registry::get('baseUrl') . '/admin/user/delete/userid/'. $userid . '">' . $this->translate->_('common.button.delete') . '</a>';
	    }
	    elseif ($type == 'search')
	    {
	        $output = '<a href=' . Zend_Registry::get('baseUrl') . '/admin/user/index/userid/' . '" + json[i].' . $userid . ' +">' . $this->translate->_('common.button.edit') . '</a>&nbsp;&nbsp;';
    	    $output .= '<a href=' . Zend_Registry::get('baseUrl') . '/admin/user/delete/userid/'. '" + json[i].' . $userid . ' +">' . $this->translate->_('common.button.delete') . '</a>';
	    }
	    else 
	    {
	        $output = '';
	    }
	    return $output;
	}
}
?>