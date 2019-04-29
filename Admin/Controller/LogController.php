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
 * @version    2009-3-5 1.0
 * @author     DengQiang (http://www.51testing.com/?uid/275266)
 */

class Admin_LogController extends Zend_Controller_Action {

	/**
	 * Initialize the controller for common usage
	 */
    public function init() {
    	$this->view = Zend_Registry::get('view');
    	$this->translate = Zend_Registry::get('Zend_Translate');
    	$this->db = Zend_Db_Table::getDefaultAdapter();
    	$this->_helper->layout->disableLayout();
    }
    
    public function indexAction() {
    	$this->_helper->layout->enableLayout();
    	$sql = "select projname from project order by projectid";
    	$project = $this->db->fetchAll($sql);
    	$this->view->project = $project;
        echo $this->view->render('Log.phtml');
    }
    
    public function queryAction() {
        $select = $this->db->select();
        $select->from('logging', '*');
        if ($_POST['starttime'] != '')
            $select->where('time >= ?', $_POST['starttime']);
        if ($_POST['endtime'] != '')
            $select->where('time <= ?', $_POST['endtime']);
        if ($_POST['username'] != '')
            $select->where("username like '%" . $_POST['username'] . "%'");
        if ($_POST['module'] != '')
            $select->where('module = ?', $_POST['module']);
        if ($_POST['project'] != '')
            $select->where('project = ?', $_POST['project']);
        if ($_POST['level'] != '')
            $select->where('level = ?', $_POST['level']);
        if ($_POST['message'] != '')
            $select->where("message like '%" . $_POST['message'] . "%'");
        $select->order('loggingid DESC');
        
        $totalRecord = count($this->db->fetchAll($select));
        $pagerSize = Zend_Registry::get('config')->pager->size;
        $currentPage = $_POST['currentpage'];
        $select->limitPage($currentPage,$pagerSize);
        $result = $this->db->fetchAll($select);
        $result[]['totalRecord'] = $totalRecord;
        
        echo json_encode($result);
    }
}
?>