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
 * @version    2009-2-10 1.0
 * @author     DengQiang (http://www.51testing.com/?uid/275266)
 */

class CommonController extends Zend_Controller_Action {

    /**
     * Initialize the controller for common usage
     */
    public function init() {
        $this->view = Zend_Registry::get('view');
        $this->translate = Zend_Registry::get('Zend_Translate');
        $this->db = Zend_Db_Table::getDefaultAdapter();
        $this->_helper->layout->disableLayout();
    }

    public function chlangAction() {
        $_SESSION['locale'] = $this->getRequest()->getParam('locale');
        // header('Location: ' . Zend_Registry::get('baseUrl'));
        header('Location: ' . $_SERVER['HTTP_REFERER']);
    }
    
    public function chprojAction() {
        $projectid = $_POST['projectid'];
        $projname = $_POST['projname'];
        $_SESSION['currentProjectId'] = $projectid;
        $_SESSION['currentProjectName'] = $projname;
        
        $curprojFolder = str_replace(' ', '', $projname);
        $file = new File();
        $file->updateConfig(array('curproj.folder'=>$curprojFolder), 'Common/Config/Global.conf');
                    
        echo $_SERVER['HTTP_REFERER'];
    }

    public function goadminAction() {
        if ($_SESSION['userRole'] == 'Administrator') {
            $_SESSION['goAdmin'] = 'true';
            header('Location: ' . Zend_Registry::get('baseUrl') . '/admin');
        } else {
            $this->_helper->layout->enableLayout();
            $this->view->message = $this->translate->_('message.common.noperm.query');
            echo $this->view->render('Error.phtml');
        }
    }

    public function loginAction() {
        $username = $_POST['username'];
        $password = $_POST['password'];
        $savelogin = $_POST['savelogin'];
        $ipaddr = $_SERVER['REMOTE_ADDR'];
        
        $common = new Common();
        $state = $common->login($username, $password, $savelogin);
        if ($state == 'successful') {
            $message = 'User login successfully [' . $username . '] - ' . $ipaddr;
            Logging::write(Logging::MODULE_SYSTEM, Logging::LEVEL_INFO, $message);
        }
        echo $state;
    }

    public function logoutAction() {
        $message = 'User logout successfully [' . $_SESSION['userName'] . ']';
        Logging::write(Logging::MODULE_SYSTEM, Logging::LEVEL_INFO, $message);
        
        $_SESSION['isLogin'] = null;
        $_SESSION = array();
        session_destroy();
        setcookie('username', '', time() - 3600, '/');
        setcookie('password', '', time() - 3600, '/');
        Zend_Db_Table::getDefaultAdapter()->closeConnection();
        header('Location: ' . Zend_Registry::get('baseUrl'));
    }
    
    public function feedbackAction() {
        $config = Zend_Registry::get('config');
        $recipient = 'qiang.denny@yahoo.com.cn';
        $ip = $_SERVER['REMOTE_ADDR'];
        $server = $_SERVER['SERVER_NAME'];
        $signature = $_SERVER['SERVER_SIGNATURE'];
        $feedback = Common::replaceAmpStrip($_POST['feedback']);
        $feedbackFrom = $_POST['feedbackFrom'];
        $content = '<strong>Sent From:</strong> ' . $feedbackFrom . '<br>';
        $content .= '<strong>IP:</strong> ' . $ip . '<br>';
        $content .= '<strong>Server:</strong> ' . $server . '<br>';
        $content .= '<strong>Signature:</strong> ' . $signature;
        $content .= '<strong>Feedback:</strong><br>' . $feedback . '<br><br>';
        $content .= 'Thanks<br>' . $config->mail->sender;
        $common = new Common();
        $state = $common->sendMail($recipient, 'Feedback from ' . $ip, $content);
        if ($state == 'successful') {
            //$message = 'Send feedback to AgileOne.Net:<br>' . substr($feedback, 0, 30) . ' ...';
            $message = 'Send feedback to AgileOne.Net:<br>' . $feedback;
            Logging::write(Logging::MODULE_ADMIN, Logging::LEVEL_INFO, $message);
        }
        echo $state;
    }
}
?>