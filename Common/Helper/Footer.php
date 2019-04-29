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
 * @version    2009-8-6 1.0
 * @author     DengQiang (http://www.51testing.com/?uid/275266)
 */

/**
 * Define a Helper for the HTML Header
 */
class Common_Helper_Footer
{
	public function footer($colNumber)
	{
		$this->translate = Zend_Registry::get('Zend_Translate');
		$output = "";
		$output .= '<tfoot><tr><td colspan="' . $colNumber . '"><strong>';
		$output .= $this->translate->_('common.page.total') . ':&nbsp;&nbsp;<span id="totalRecord"></span>&nbsp;&nbsp;&nbsp;&nbsp;</strong>';
		$output .= '<span id="pager" class="pager">';
		$output .= '<img src="' . Zend_Registry::get('baseDir') . '/Common/Image/first.png" class="first"/>&nbsp;';
		$output .= '<img src="' . Zend_Registry::get('baseDir') . '/Common/Image/prev.png" class="prev"/>&nbsp;';
		$output .= '<input type="text" class="pagedisplay paginator"/>&nbsp;';
		$output .= '<img src="' . Zend_Registry::get('baseDir') . '/Common/Image/next.png" class="next"/>&nbsp;';
		$output .= '<img src="' . Zend_Registry::get('baseDir') . '/Common/Image/last.png" class="last"/>&nbsp;';
		$output .= '<select class="pagesize paginator">';
		$output .= '<option value="20">20</option>';
		$output .= '<option value="50" selected="selected">50</option>';
		$output .= '<option value="100">100</option>';
		$output .= '</select>';
		$output .= '</span>';
		$output .= '</td>';
		$output .= '<td align="right"><a href="#top"><strong>' . $this->translate->_('common.page.top') . '</strong></a>';
		$output .= '</td></tr></tfoot>';		
	    return $output;
	}
}
?>