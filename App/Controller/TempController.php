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
 * @package    AgileOne_App_Controller
 * @copyright  Copyright (c) 2010 AgileOne Team (http://code.google.com/p/agileone/)
 * @license    GNU General Public License V3 (http://www.gnu.org/licenses)
 * @version    2009-2-2 1.0
 * @author     DengQiang (http://www.51testing.com/?uid/275266)
 */

/**
 * Usage
 */
class TempController extends Zend_Controller_Action
{

	/**
	 * Initialize the controller
	 */
    public function init() 
    {
    	$this->view = Zend_Registry::get('view');
    	$this->translate = Zend_Registry::get('Zend_Translate');
    	$this->db = Zend_Db_Table::getDefaultAdapter();
    	$this->_helper->layout->disableLayout();
    }
    
    /**
	 * Usage
	 *
	 * @param  boolean $param
	 * @return integer
	 */
    public function test0Action()
    {
        setcookie('username','rubby2',time() + 200,'/');
        setcookie('password','rubby3',time() + 200,'/');
    }
    
    public function test1Action()
    {
//        $user = new User();
//        $db = $user->getAdapter();
//        $select = $db->select();
//        $select->from('user', 'roleid');
//        $select->where('username= ?', 'rubby');
//        $select->join('permission', 'permission.id = user.roleid', 'role');
//        echo $select->__toString();
//        $result = $db->fetchAll($select);
//        print_r($result);
//            
    	echo $_SESSION['isLogin'];
    	echo $_COOKIE['username'];
    	echo $_COOKIE['password'];
    	echo $_SESSION['userrole'];
    }
    
    public function permissionAction()
    {
        if (Permission::isAllowed('defect','query'))
            echo 'YES';
        else 
            echo 'NO';
    }
    
    public function test3Action()
    {
        $config = new Zend_Config_Ini('Common/Config/Config.ini','GlobalSetting');
	    $loggingLang = $config->logging->lang;
	    echo $loggingLang;
    }
    
    public function test4Action()
    {
        $user = new User();
        $db = $user->getAdapter();
        $select = $db->select();
        $select->from('user', array('userid', 'username', 'roleid', 'defaultprojectid'));
        $select->where('username= ?', 'rubby');
        $select->join('permission', 'permission.permissionid = user.roleid', 'rolename');
        $select->join('project', 'user.defaultprojectid = project.projectid', 'projectname');
        echo $select->__toString();
      
//        $select = $db->select();
//        $select->from('user', array('userid', 'username'));
//        $select->where('username= ?', 'admin');
//        $select->join('permission', 'permission.permissionid = user.roleid', 'role');
//        $result = $db->fetchAll($select);
//        
//        print_r($result);
//        echo '<br>';
//        
//        $select2 = $db->select();
//        $select2->from('userproject', array('userid', 'projectid'));
//        $select2->where('userid= ?', $result[0]['userid']);
//        $select2->join('project', 'project.projectid = userproject.projectid', 'projectname');
//        $result = $db->fetchAll($select2);
//        
//        $_SESSION['myProject'] = $result;
//        print_r($_SESSION['myProject']);
    }
    
    public function md5Action()
    {
        echo md5('guest') , '<br>';
    }
    
    public function baseurlAction()
    {
        $baseDir = dirname(__FILE__);
        echo $baseDir , '<br>';
        echo getenv('SCRIPT_NAME') , '<br>';
        echo dirname(getenv('SCRIPT_NAME')) , '<br>';
        echo getenv('PATH_INFO') , '<br>';
        echo $_SERVER['REQUEST_URI'] , '<br>';
        
        echo $this->_request->getBaseUrl() , '<br>';
        echo $this->getFrontController()->getBaseUrl() , '<br>';
        echo Zend_Registry::get('baseUrl');
    }
    
    public function iniAction()
    {
        $common = new Common();
        $common->writeConfig(array(
        	'db.host'=>'mycontroller',
        	'db.pass'=>'myaction',
            'db.user'=>'root'
            ), 'test.ini');
        print_r(parse_ini_file('Common/Config/test.ini'));
    }
    
    public function iniupdateAction()
    {
        $common = new Common();
        $common->updateConfig(array(
        	'db.host'=>'mycont  roller222 ',
        	'db.pass'=>'myaction  222  ',
            ), 'test.ini');
        print_r(parse_ini_file('Common/Config/test.ini'));
    }
    
    public function navAction()
    {   
        $common = new Common();
        $content = $common->parseNavigator('menu');
        foreach ($content as $key=>$value)
        {
            echo $key , '----' , $value , '<br>';
        }
    }
    
    public function test5Action()
    {
        $db = Zend_Db_Table::getDefaultAdapter();
        $userid = '2';
            $sql = "select userproject.*, project.projectname
                from userproject join project on project.projectid = userproject.projectid
                where userid=${userid}";
        print_r($db->fetchAll($sql));
    }
    
    public function test6Action()
    {
        $db = Zend_Db_Table::getDefaultAdapter();
        $sql = "select user.*, role.rolename
                from user join role on role.roleid = user.roleid
                where username='admin'";
            $result1 = $db->fetchAll($sql);
            
            $projectList = $result1[0]['projectlist'];
            $sql = "select projectid, projectname
                from project where projectid in ($projectList)";
                echo $sql;
               echo $_SESSION['currentProjectId'];
            echo $_SESSION['currentProjectName'];
    }
    
    public function test7Action()
    {
//        $str = 'edit,delete,execute';
//        echo strstr($str, 'execute');
        echo $_SERVER['SERVER_SIGNATURE'] , '<br>' , $_SERVER['SERVER_NAME'];
    }
    
    public function setcacheAction()
    {
        $cacheData = Zend_Registry::get('cacheData');
        $result = Zend_Db_Table::getDefaultAdapter()->fetchAll('select * from user');
        $cacheData->save($result, 'cache_user');
    }
    
    public function getcacheAction()
    {
        if (!$data = Zend_Registry::get('cacheData')->load('cache_user'))
            echo 'No data cached';
        else
            echo count($data);
    }
    
    public function clearcacheAction() {
        $cacheData = Zend_Registry::get('cacheData');
        $cacheData->clean(Zend_Cache::CLEANING_MODE_OLD);
    }
    
    public function dbAction()
    {
        $db = Zend_Db_Table::getDefaultAdapter();
        print_r($db->describeTable('user'));
        echo '<br>';
        print_r($db->getConfig());
        echo '<br>' , $db->getServerVersion() , '<br>';
        echo $db->getStatementClass() , '<br>';
        echo $db->getQuoteIdentifierSymbol() , '<br>';
        print_r($db->listTables());
    }
    
    public function typeAction()
    {
        $config = new Zend_Config_Ini('Common/Config/Global.conf');
        $lifetime = $config->cache->lifetime * 3600 * 24;
        echo $lifetime , '   ' , 1/3600 * 3600 * 24;
    }
    
    public function mailAction()
    {
        $mail = new Zend_Mail();
        $mail->setBodyHtml('<strong>FFFFFFFFF<br>FFFFFFFFFF</strong>');
        $mail->setFrom('ddd@amaxgs.com');
        $mail->addTo('rubby_deng@amaxgs.com');
        $mail->setSubject('TestSubject');
        $mail->send(); 
    
    }
    
    public function smtpAction()
    {
        $mailAuth = array(
         	'auth' => 'login',
            'username' => 'rubby_deng@amaxgs.com',
            'password' => '142536');
        
        $transport = new Zend_Mail_Transport_Smtp('mail.amaxgs.com', $mailAuth);
        
        $mail = new Zend_Mail();
        $mail->setBodyHtml('<strong>This is the text<br> of the mail.</strong>');
        $mail->setFrom('admin@agileone.net', 'AgileOne');
        $mail->addTo('rubby_deng@amaxgs.com');
        $mail->addTo('agsfamily@amaxgs.com');
        $mail->setSubject('TestSubject');
        $mail->send($transport);
    }
    
    public function reverseAction() {
        $data = array(
            'name' => 'Rubby',
            'email' => 'rubby_deng',
            'phone' => '12345678'
        );
        print_r($data);
        echo '<br>';
        print_r(array_reverse($data));
        echo '<br>';
        print_r(array_flip($data));
    }
    
    public function addarrAction() {
        $this->db = Zend_Db_Table::getDefaultAdapter();
        $select = $this->db->select();
        $select->from('user', '*');
        $select->where('username != ?', 'admin');
        $select->order('userid');
        $select->join('role', 'role.roleid = user.roleid', 'rolename');
        $result = $this->db->fetchAll($select);
        $count = count($result);
        for ($i=0; $i<$count; $i++) {
            $userid = $result[$i]['userid'];
            $sql = "select project.projectid, projectname from project, userproject
                where userproject.userid=$userid and userproject.projectid=project.projectid";
            $result2 = $this->db->fetchAll($sql);
            $count2 = count($result2);
            for ($j=0; $j<$count2; $j++) {
                $result[$i]['projectname'] .= $result2[0]['projectname'] . '####';
            }
        }
        
        for ($i=0; $i<count($result); $i++) {
//            for ($j=0; $j<count($result[$i]); $j++) {
//                echo $result[$i][$j] , '    ';
//            }
            print_r($result[$i]);
            echo '<p>';
        }
    }
    
    public function deleteAction() {
        $role = new Role();
        $row = $role->find(37);
        $user = $row->current();
        $select = $user->select()->order('userid DESC')->limit(3);
        $user37 = $user->findDependentRowset('User', 'RoleID', $select);
        print_r($user37->toArray());
//        echo $user37->getRow(0)->username , '<br>';
//        echo $user37->getRow(1)->username;
    }
    
    public function mtomAction() {
//        $user = new User();
//        $userRow = $user->find(86);
//        $user86 = $userRow->current();
//        $project = $user86->findManyToManyRowset('Project', 'UserProject');
//        echo $project->count();

        $projectTable = new Project();
        $projectRowset = $projectTable->find(2);
        $projectRow = $projectRowset->current();
        echo $projectRow->findDependentRowset('UserProject')->count();
//        $userRowset = $projectRow->findManyToManyRowset('User', 'UserProject');
//        echo $userRowset->getRow(0)->username;

        $projectTable = new Project();
        $dt = $projectTable->getDependentTables();
        echo $dt[0];
    }
    
    public function whereAction() 
    {
        $this->db = Zend_Db_Table::getDefaultAdapter();
        $where = $this->db->quoteInto('custname = ?', 'custname')
                . $this->db->quoteInto(' AND customerid <> ?', 'customerid');
        echo $where;
    }
    
    public function defiAction()
    {
        $project = new Project();
        $projectid = 4;
        $projectRow = $project->find($projectid)->current();
        
        $userRowCount = $projectRow->findDependentRowset('UserProject')->count();
        echo $userRowCount;
    }
    
    public function upAction()
    {
        $username = 'test1';
        $this->db = Zend_Db_Table::getDefaultAdapter();
        $sql = "select userid from user where username = '$username'";
        $result = $this->db->fetchAll($sql);
        echo count($result) , '<br>' , $result[0]['userid'];
    }
    
    public function backupAction() {
        $dbBackup = new DBBackup();
        $db = Zend_Db_Table::getDefaultAdapter();
        $tables = $db->listTables();
        foreach ($tables as $tableName)
            echo $tableName , '<br>';
        echo $dbBackup->tableToSql($tables);
        
//        $db = Zend_Db_Table::getDefaultAdapter();
//        $rows = $db->fetchAll("SELECT * FROM user");
//        for ($i = 0; $i < count($rows); $i++) {
//            foreach ($rows[$i] as $key=>$value) {
//                echo $value , '<br>';
//            }
//        }
//        $dbBackup->writeFile($dbBackup->tableToSql('user'));
//        $db = Zend_Db_Table::getDefaultAdapter();
//        foreach ($db->listTables() as $table) {
//            echo $table , '<br>';
//        }
//        echo '<br>';
//        
//        $schema = $db->describeTable('user');
//        print_r($schema);
//        echo '<p>';
//        echo count($schema) , '<p>';
//        foreach ($schema as $key => $value) {
//        	echo $value['COLUMN_NAME'] , '<br>';
//        }
    }
    
    public function writeAction() {
        $file = new File();
        if ($file->isWritable('Common')) echo 'YES';
    }
    
    public function uploadeditAction() {
        echo $this->view->render('UploadEdit.phtml');
    }
    
    public function htmlAction() {
        $str='<a href=\"test.html">测\\&试页面</a>';
        echo htmlentities($str) , '<br>';
        echo htmlspecialchars($str) , '<br>';
        echo str_replace('uu', 'yyyy', 'uuIamuRsfsdljuusdfsyysdfuusdfsduu');
    }
    
    public function substrAction() 
    {
    	echo  $this->utf_substr('中国人民是什么意常用命令自动化测试', 20) . '...';
    }
    
    function utf_substr($str,$len)
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
		return join($new_str);
	}
	
	function mkdirAction() {
		echo Zend_Registry::get('baseDir');
		mkdir('Attachment/test3');
	}
	
	function msecAction() {
		echo microtime();
		echo '<br>';
		echo rand(100,999);
	}
	
	function getsAction() {
		echo $_SESSION['userName'];
	}
	
	function div() {
		echo '';
	}
	
	function mergeAction() {
		$array1 = array(array("A","B","C","D"),array("a","b","c","d"));
		//$array2 = array(array("Q", "W", "E", "R"), array("q", "w", "e", "r"));   
		$array2 = array(array(), array());
		$arrayX = array_merge($array1, $array2);
		//$arrayX = $array1 + $array2;
		print_r($arrayX);
	}
	
	function spliceAction() {
		$data1 = array("A","C","E","G","H", "J"); //C,G,H
		$data2 = array("A","B","D","E", "J"); //BD
		foreach ($data1 as $d1) {
			if (in_array($d1, $data2)) {
				foreach ($data2 as $key => $value) {
					if ($d1 == $value)
						array_splice($data2, $key, 1);
				}
			}
			else {
				echo "Not<br>";
			}
		}
		print_r($data1);
		echo '<br>';
		print_r($data2);
	}
	
	function wwAction() {
		$where = $this->db->quoteInto('userid = ?', 'denng');
		$where .= $this->db->quoteInto(' AND name = ?', 'qiang');
		echo $where;
	}
	
	function explodeAction() {
		$dd = null;
		$da = explode(",", $dd);
		echo count($da);
		
	}
	
	function postAction() {
		if ($_POST['d']==' ')
			echo "Null Value";
		else
			echo "Good";
	}
}
?>