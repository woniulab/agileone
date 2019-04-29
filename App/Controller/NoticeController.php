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
 * @version    2009-3-22 1.0
 * @author     DengQiang (http://www.51testing.com/?uid/275266)
 */

class NoticeController extends Zend_Controller_Action {

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
    	echo $this->view->render('Notice.phtml');
    }
    
    public function queryAction() {
        $select = $this->db->select();
        $select->from('notice', '*');
        if ($_POST['noticeid'] != '')
            $select->where('noticeid = ?', $_POST['noticeid']);
        if ($_POST['headline'] != '')
            $select->where("headline like '%" . $_POST['headline'] . "%'");
        if ($_POST['content'] != '')
            $select->where("content like '%" . Common::replaceAmpStrip($_POST['content']) . "%'");
        if ($_POST['creator'] != '')
            $select->where("creator like '%" . $_POST['creator'] . "%'");
        if ($_POST['expireddate'] != '')
            $select->where("expireddate >= '" . $_POST['expireddate'] . "'");
        if ($_POST['scope'] != '')
            $select->where('scope = ?', $_POST['scope']);
        //$select->where("expireddate >= '" . date('Y-m-d') . "'");
        $select->order('noticeid DESC');
        
     	$totalRecord = count($this->db->fetchAll($select));
        $pagerSize = Zend_Registry::get('config')->pager->size;
        $currentPage = $_POST['currentpage'];
        $select->limitPage($currentPage,$pagerSize);
        $result = $this->db->fetchAll($select);
        $result[]['totalRecord'] = $totalRecord;
        
        echo json_encode($result);
    }
    
    public function addAction() {
        if (! Permission::isAllowed('notice', 'add')) {
            echo 'no_permission';
            return;
        }
        
        $notice = new Notice();
        $data = array(
            'headline' => $_POST['headline'],
            'content' => Common::replaceAmpStrip($_POST['content']),
            'creator' => $_SESSION['userName'],
            'expireddate' => $_POST['expireddate'],
            'scope' => $_POST['scope'],
            'createdtime' => date('Y-m-d H:i:s'),
            'updatedtime' => date('Y-m-d H:i:s')
        );
        $id = $notice->insert($data);
        if ($id > 0) {
            $message = 'Add notice successfully [ID=' . $id . ']';
            Logging::write(Logging::MODULE_NOTICE, Logging::LEVEL_INFO, $message);
            echo $id;
        } else {
            $message = 'Add notice unsuccessfully [ID=null]';
            Logging::write(Logging::MODULE_NOTICE, Logging::LEVEL_ERROR, $message);
            echo 'error';
        }
    }
    
    public function editAction() {
        if (! Permission::isAllowed('notice', 'edit')) {
            echo 'no_permission';
            return;
        }
        $notice = new Notice();
        $noticeid = $_POST['noticeid'];
        $data = array(
            'headline' => $_POST['headline'],
            'content' => Common::replaceAmpStrip($_POST['content']),
            'expireddate' => $_POST['expireddate'],
        	'scope' => $_POST['scope'],
            'updatedtime' => date('Y-m-d H:i:s')
        );
        $where = $this->db->quoteInto('noticeid = ?', $noticeid);
        $row = $notice->update($data, $where);
        if ($row == 1) {
            $message = 'Update notice successfully [ID=' . $noticeid . ']';
            Logging::write(Logging::MODULE_NOTICE, Logging::LEVEL_INFO, $message);
            echo $row;
        } else {
            $message = 'Update notice unsuccessfully [ID=' . $noticeid . ']';
            Logging::write(Logging::MODULE_NOTICE, Logging::LEVEL_ERROR, $message);
            echo 'error';
        }
    }
    
    public function deleteAction() {
        if (! Permission::isAllowed('notice', 'delete')) {
            echo 'no_permission';
            return;
        }
        
        $notice = new Notice();
        $noticeid = $_POST['noticeid'];
        
        $noticeRow = $notice->find($noticeid)->current();
        $row = $noticeRow->delete();
        if ($row == 1) {
            $message = 'Delete notice successfully [ID=' . $noticeid . ']';
            Logging::write(Logging::MODULE_NOTICE, Logging::LEVEL_INFO, $message);
            echo $row;
        } else {
            $message = 'Delete notice unsuccessfully [ID=' . $noticeid . ']';
            Logging::write(Logging::MODULE_NOTICE, Logging::LEVEL_ERROR, $message);
            echo 'error';
        }
    }
}
?>