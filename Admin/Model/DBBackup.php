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
 * @version    2009-3-20 1.0
 * @author     DengQiang (http://www.51testing.com/?uid/275266)
 */

class DBBackup {
    /* Only backup the table schema */
	public function schemaToSql($tables) {
        $db = Zend_Db_Table::getDefaultAdapter();
        $tableDump = '';
        foreach ($tables as $tableName) {
            $tableDump .= "DROP TABLE IF EXISTS $tableName; \r\n";
            $createTable = $db->query("SHOW CREATE TABLE $tableName")->fetchAll();
            $tableDump .= $createTable[0]['Create Table'] . ";\r\n\r\n";
        }
        $fileName = $this->writeToFile($tableDump);
        return $fileName;
    }
    
    /* Backup structure and data */
    public function dataToSql($tables)
    {
        $db = Zend_Db_Table::getDefaultAdapter();
        $tableDump = '';
        foreach ($tables as $tableName) {
            $tableDump .= "DROP TABLE IF EXISTS $tableName;\r\n";
            $createTable = $db->query("SHOW CREATE TABLE $tableName")->fetchAll();
            $tableDump .= $createTable[0]['Create Table'] . ";\r\n\r\n";
            $rows = $db->fetchAll("SELECT * FROM $tableName");
            $rowCount = count($rows);       
            for ($i = 0; $i < $rowCount; $i++) {
                $comma = '';
                $tableDump .= "INSERT INTO $tableName VALUES(";
                foreach ($rows[$i] as $value) {
                    $tableDump .= $comma . "'" . $value . "'";
                    $comma = ',';
                }
                $tableDump .= ");\r\n";
            }
            $tableDump .= "\r\n";
        }
        $fileName = $this->writeToFile($tableDump);
        return $fileName;
    }
    
    /* Write the backup SQL to file */
    public function writeToFile($content) {
        $comment = "# ----------------------------------------------------------- \r\n";
        $comment .=	"# AgileOne - Power to Agile Development \r\n";
        $comment .=	"# Database Backup Utility \r\n";
        $comment .=	"# Copyright (c) 2010 AgileOne Team (http://code.google.com/p/agileone/) \r\n";
 		$comment .=	"# License GPL V3 (http://www.gnu.org/licenses) \r\n";
		$comment .=	"# Date: " . date('Y-m-d H:i:s') . "\r\n";
		$comment .=	"# -----------------------------------------------------------\r\n\r\n";
        $content = $comment . $content;
        $fileName = 'Agileone_Backup_' . date('Ymd_His') . '.sql';
        $file = fopen('Attachment/DBBackup/' . $fileName, "w");
        fwrite($file, $content);
        fclose($file);
        return $fileName;
    }
}
?>