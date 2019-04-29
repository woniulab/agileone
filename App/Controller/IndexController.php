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
 * @version    2009-2-8 1.0
 * @author     DengQiang (http://www.51testing.com/?uid/275266)
 */

class IndexController extends Zend_Controller_Action {

    /**
     * Initialize the controller for common usage
     */
    public function init() {
        $this->view = Zend_Registry::get('view');
    	$this->translate = Zend_Registry::get('Zend_Translate');
    	$this->db = Zend_Db_Table::getDefaultAdapter();
    }

    public function indexAction() {
        $sql1 = "select * from notice where expireddate>='" . date('Y-m-d') . "'"
                . ' and (scope=0 or scope=' . $_SESSION['currentProjectId'] . ')
                 order by noticeid desc';
        $notice = $this->db->fetchAll($sql1);
        $this->view->notice = $notice;
        
        $sql2 = "select * from task where userid=" . $_SESSION['userId'] . " and status <> 'finished' order by taskid desc";
        $task = $this->db->fetchAll($sql2);
        $this->view->task = $task;
        
        $user = new User();
    	$userRow = $user->find($_SESSION['userId'])->current();
    	$projectRowset = $userRow->findManyToManyRowset('Project', 'UserProject')->toArray();
    	$this->view->project = $projectRowset;
        
        echo $this->view->render('Index.phtml');
    }
}
?>