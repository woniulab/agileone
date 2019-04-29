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
 * @version    2009-2-2 1.0
 * @author     DengQiang (http://www.51testing.com/?uid/275266)
 */

class Admin_CommonController extends Zend_Controller_Action {

    /**
     * Initialize the controller for common usage
     */
    public function init() {
        $this->translate = Zend_Registry::get('Zend_Translate');
        $this->_helper->layout->disableLayout();
    }

    public function chlangAction() {
        $_SESSION['locale'] = $this->getRequest()->getParam('locale');
        // header('Location: ' . Zend_Registry::get('baseUrl') . '/admin');
        header('Location: ' . $_SERVER['HTTP_REFERER']);
    }

    public function exitadminAction() {
        $_SESSION['goAdmin'] = array();
        header('Location: ' . Zend_Registry::get('baseUrl'));
    }
}
?>