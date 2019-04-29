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
 * @version    2009-2-14 1.0
 * @author     DengQiang (http://www.51testing.com/?uid/275266)
 */

class ErrorController extends Zend_Controller_Action {

    /**
     * Initialize the controller for common usage
     */
    public function init() {
        $this->view = Zend_Registry::get('view');
        $this->translate = Zend_Registry::get('Zend_Translate');
    }

    /**
     * Show the global error message page
     *
     * @param  null
     * @return null
     */
    public function errorAction() {
        $this->view->message = $this->translate->_('message.common.url.invalid');
        echo $this->view->render('Error.phtml');
    }
}
?>