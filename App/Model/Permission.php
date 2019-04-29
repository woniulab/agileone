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
 * @version    2009-2-4 1.0
 * @author     DengQiang (http://www.51testing.com/?uid/275266)
 */

class Permission {

    /**
     * Authorization
     *
     * @param  string $role
     * @param  string $controller
     * @param  string $action
     * @return boolean
     */
    public static function isAllowed($module, $action) {
        switch ($action) {
            case 'add':
                $actionCode = 0;
                break;
            case 'edit':
                $actionCode = 1;
                break;
            case 'delete':
                $actionCode = 2;
                break;
            case 'query':
                $actionCode = 3;
                break;
            default:
                return false;
                break;
        }
        $db = Zend_Db_Table::getDefaultAdapter();
        $rolename = $_SESSION['userRole'];
        $sql = "select * from role where rolename='${rolename}'";
        $result = $db->fetchAll($sql);
        if (count($result) != 1)
            return false;
        $permission = $result[0][$module];
        $permissionCode = substr($permission, $actionCode, 1);
        if ($permissionCode == 1)
            return true;
        elseif ($permissionCode == 0)
            return false;
        else
            return false;
    }
}
?>