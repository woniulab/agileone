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

class Common {

    /**
     * Username and Password authentication
     *
     * @param  string $username
     * @param  string $password
     * @param  string $savelogin
     * @return int
     */
    public function login($username, $password, $savelogin) {
        $config = Zend_Registry::get('config');
        $cookieLife = $config->cookie->lifetime * 24 * 3600;
        $db = Zend_Db_Table::getDefaultAdapter();
        $sql = "select username, password, status from user where username='${username}'";
        $user = $db->fetchAll($sql);
        if (count($user) != 1) {
            return 'user_invalid'; // Invalid Username
        }
        else {
            if ($user[0]['status'] != 1) {
                return 'user_locked';
            }
            else {
                if (md5($password) == $user[0]['password']) {
                    if ($savelogin == 'true') {
                        setcookie('username', $username, time() + $cookieLife, '/');
                        setcookie('password', $password, time() + $cookieLife, '/');
                    } else {
                        setcookie('username', '', time() - 3600, '/');
                        setcookie('password', '', time() - 3600, '/');
                    }
                    
                    $sql = "select user.*, role.rolename
                        from user join role on role.roleid = user.roleid
                        where username='${username}'";
                    $result1 = $db->fetchAll($sql);
                    
                    $_SESSION['userId'] = $result1[0]['userid'];
                    $_SESSION['userName'] = $result1[0]['username'];
                    $_SESSION['userRole'] = $result1[0]['rolename'];
                    $_SESSION['userEmail'] = $result1[0]['email'];
                    
                    $userid = $result1[0]['userid'];
                    $sql = "select project.projectid, project.projname
                        from project,userproject where userproject.projectid=project.projectid
                        and userproject.userid=$userid";
                    $result2 = $db->fetchAll($sql);
                    
                    $defaultProjectName = 'None';
                    $defaultProjectId = 0;
                    foreach ($result2 as $value) {
                        if ($value['projectid'] == $result1[0]['defaultproject']) {
                            $defaultProjectName = $value['projname'];
                            $defaultProjectId = $value['projectid'];
                            break;
                        }
                    }
                    
                    $_SESSION['currentProjectId'] = $defaultProjectId;
                    $_SESSION['currentProjectName'] = $defaultProjectName;
                    $_SESSION['defaultProjectId'] = $defaultProjectId;
                    $_SESSION['myProject'] = $result2;
                    $_SESSION['isLogin'] = 'true';
                    
                    $curprojFolder = str_replace(' ', '', $defaultProjectName);
                    $file = new File();
                    $file->updateConfig(array('curproj.folder'=>$curprojFolder), 'Common/Config/Global.conf');
                    
                    return 'successful'; // Authentication is Successful 
                } else {
                    return 'password_invalid';  // Invalid Password
                }
            }
        }
    }

    public function parseNavigator($type) {
        $config = new Zend_Config_Ini('Common/Config/Navigator.conf');
        $content = $config->$type->toArray();
        $nav = array();
        foreach ($content as $value) {
            $temp = explode('::', $value);
            $nav[$temp[0]] = $temp[1];
        }
        return $nav;
    }
    
    public function parseDefinition($key) {
        $config = new Zend_Config_Ini('Common/Config/Definition.conf');
        $content = $config->$key;
        $value = explode(',', $content);
        return $value;
    }
    
    public function sendMail($recipients, $subject, $content) {
        $content = '<div style="font-family: arial; font-size: 12px;">' . $content . '</div>';
        $config = Zend_Registry::get('config');
        $method = $config->mail->method;
        $recipient = explode(',', $recipients);
        if ($method == 'phpmail') {
            $mail = new Zend_Mail('UTF-8');
            $mail->setBodyHtml($content);
            $mail->setFrom($config->mail->sender, $config->mail->signature);
            foreach ($recipient as $recipientAddr) {
            	$mail->addTo($recipientAddr);
            }
            $mail->setSubject($subject);
            $mail->send();
        }
        else {
            $mailAuth = array(
             	'auth' => 'login',
                'username' => $config->smtp->username,
                'password' => $config->smtp->password);
            
            $transport = new Zend_Mail_Transport_Smtp($config->smtp->server, $mailAuth);
            
            $mail = new Zend_Mail('UTF-8');
            $mail->setBodyHtml($content);
            $mail->setFrom($config->mail->sender, $config->mail->signature);
            foreach ($recipient as $recipientAddr) {
            	$mail->addTo($recipientAddr);
            }
            $mail->setSubject($subject);
            $mail->send($transport);
        }
        return 'successful';
    }
    
    public static function replaceAmpStrip($string) {
        return stripslashes(str_replace('AGILE14U', '\&', $string));
    }
    
    public function subString($str,$len)
	{
		for($i=0;$i<$len;$i++)
		{
			$temp_str=substr($str,0,1);
			if(ord($temp_str) > 127)
			{
				$i++;
				if($i<$len)
				{
				$new_str[]=substr($str,0,3);
				$str=substr($str,3);
				}
			}
			else
			{
			$new_str[]=substr($str,0,1);
			$str=substr($str,1);
			}
		}
		return join($new_str) . '...';
	}
}
?>