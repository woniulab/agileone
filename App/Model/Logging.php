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
 * @version    2009-2-6 1.0
 * @author     DengQiang (http://www.51testing.com/?uid/275266)
 */

class Logging {
    const LEVEL_INFO = 'INFO';
    const LEVEL_WARN = 'WARN';
    const LEVEL_ERROR = 'ERROR';
    
    const MODULE_SYSTEM = 'System';
    const MODULE_ADMIN = 'Admin';
    const MODULE_DASHBOARD = 'Dashboard';
    const MODULE_NOTICE = 'Notice';
    const MODULE_MINUTES = 'Minutes';
    const MODULE_KNOWLEDGE = 'Knowledge';
    const MODULE_PROJECT = 'Project';
    const MODULE_TASK	= "Task";
    const MODULE_PROPOSAL = 'Proposal';
    const MODULE_USERSTORY = 'UserStory';
    const MODULE_SPEC = 'Spec';
    //const MODULE_UNITTEST = 'UnitTest';
    const MODULE_TESTCASE = 'TestCase';
    const MODULE_EXECUTION = 'Execution';
    const MODULE_DEFECT = 'Defect';

    public static function write($module, $level, $message) {
        $db = Zend_Db_Table::getDefaultAdapter();
        $project = $_SESSION['currentProjectName'];
        if ($_SESSION['goAdmin'] == 'true')
            $project = 'System';
        $data = array(
        	'time' => date('Y-m-d H:i:s'),
        	'username' => $_SESSION['userName'],
            'project' => $project,
            'module' => $module,
            'level' => $level,
        	'message' => $message
        );
        $db->insert('logging', $data);
    }
}
?>