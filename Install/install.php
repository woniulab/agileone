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
 * @version    2010-4-15 1.0
 * @author     DengQiang (http://www.51testing.com/?uid/275266)
 */

@header("content-Type: text/html; charset=UTF-8");
include_once '../App/Model/File.php';
error_reporting(0);
$adapter = $_POST['adapter'];
$host = $_POST['host'];
$username = $_POST['username'];
$password = $_POST['password'];
$dbname = $_POST['dbname'];
$dbcharset = 'UTF8';
$sqlfile = 'agileone.sql';
$lang = $_POST['lang'];

$config = parse_ini_file('../Common/Config/Global.conf');
if ($config['db.dbname'] != '') {
	if ($lang == 'zh') {
		echo 'AgileOne已经成功安装, 为确保数据安全, 请勿两次安装 ...';
	}
	else {
		echo "AgileOne is already installed, don't install again ...";
	}
	return;
}

$file = new File();
if ($lang == 'zh') {
	if (!$file->isWritable('../Attachment'))
		die('目录/Attachment不可写, 安装前请先设置其权限 ...');
	if (!$file->isWritable('../Cache'))
		die('目录/Cache不可写, 安装前请先设置其权限 ...');
	if (!$file->isWritable('../Common/Config/Global.conf'))
		die('文件/Common/Config/Global.conf不可写, 安装前请先设置其权限 ...');
}
else {
	if (!$file->isWritable('../Attachment'))
		die("Folder [/Attachment] doesn't have [Write] permission, Set it first ...");
	if (!$file->isWritable('../Cache'))
		die("Folder [/Cache] doesn't have [Write] permission, Set it first ...");
	if (!$file->isWritable('../Common/Config/Global.conf'))
		die("File [/Common/Config/Global.conf] doesn't have [Write] permission, Set it first ...");
}

$conn=mysql_connect($host, $username, $password);
if (!$conn) {
	if ($lang == 'zh') {
		die('不能连接到数据库: ' . mysql_error());
	}
	else {
		die("Can't connect to DB: " . mysql_error());
	}
}

mysql_query('SET NAMES UTF8');
mysql_query("DROP DATABASE if exists $dbname");
mysql_query("CREATE DATABASE $dbname DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci");

mysql_select_db($dbname);

if (!is_readable($sqlfile)) {
	if ($lang == 'zh') {
		echo '数据库文件agileone.sql不存在或者读取失败';
	}
	else {
		echo 'Database file [agileone.sql] can not be readable';
	}
	return;
}
$fp = fopen($sqlfile, 'rb');
$sql = fread($fp, 2048000);
fclose($fp);

foreach(explode(';', trim($sql)) as $query) {
	mysql_query(trim($query));
} 

mysql_close($conn);

$data = array(
    'db.adapter' => $adapter,
    'db.host' => $host,
    'db.username' => $username,
    'db.password' => $password,
    'db.dbname' => $dbname
);
$file->updateConfig($data, '../Common/Config/Global.conf');

if ($lang == 'zh') {
	echo '已成功创建数据库及表. <a href="../index.php">点此访问首页</a> (默认登录: admin/admin)';
}
else {
	echo 'Created DB & Tables successfully. <a href="../index.php">Go to Homepage</a> (Default Login: admin/admin)';
}
?>