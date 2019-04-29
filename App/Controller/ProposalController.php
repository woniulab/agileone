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
 * @version    2009-5-24 1.0
 * @author     DengQiang (http://www.51testing.com/?uid/275266)
 */

class ProposalController extends Zend_Controller_Action {

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
    	echo $this->view->render('Proposal.phtml');
    }
    
    public function queryAction() {
        $select = $this->db->select();
        $select->from('proposal', '*');
        if ($_POST['proposalid'] != '')
            $select->where('proposalid = ?', $_POST['proposalid']);
        if ($_POST['creator'] != '')
            $select->where("creator like '%" . $_POST['creator'] . "%'");
        if ($_POST['type'] != '')
            $select->where('type = ?', $_POST['type']);
        if ($_POST['importance'] != '')
            $select->where('importance = ?', $_POST['importance']);
        if ($_POST['headline'] != '')
            $select->where("headline like '%" . $_POST['headline'] . "%'");
        if ($_POST['content'] != '')
            $select->where("content like '%" . Common::replaceAmpStrip($_POST['content']) . "%'");
        if ($_POST['processresult'] != '')
            $select->where("processresult like '%" . $_POST['processresult'] . "%'");
        $select->where('proposal.projectid = ?', $_SESSION['currentProjectId']);
        $select->order('proposalid DESC');
        
        $totalRecord = count($this->db->fetchAll($select));
        $pagerSize = Zend_Registry::get('config')->pager->size;
        $currentPage = $_POST['currentpage'];
        $select->limitPage($currentPage,$pagerSize);
        $result = $this->db->fetchAll($select);
        $result[]['totalRecord'] = $totalRecord;
        
        echo json_encode($result);
    }
    
    public function addAction() {
        if (! Permission::isAllowed('proposal', 'add')) {
            echo 'no_permission';
            return;
        }
        
        $proposal = new Proposal();
        
        $where = $this->db->quoteInto('headline = ?', $_POST['headline']);
        $countExist = $proposal->fetchAll($where)->count();
        if ($countExist > 0) {
            echo 'proposal_exist';
            return;
        }
        
        if ($_POST['processresult'] != "")
            $processed = 1;
        else 
            $processed = 0;
        
        $data = array(
            'projectid' => $_SESSION['currentProjectId'],
            'creator' => $_SESSION['userName'],
            'type' => $_POST['type'],
        	'importance' => $_POST['importance'],
            'headline' => $_POST['headline'],
            'content' => Common::replaceAmpStrip($_POST['content']),
            'processed' => $processed,
            'processresult' => $_POST['processresult'],
            'createdtime' => date('Y-m-d H:i:s'),
            'updatedtime' => date('Y-m-d H:i:s')
        );
        $id = $proposal->insert($data);
        if ($id > 0) {
            $message = 'Add proposal successfully [ID=' . $id . ']';
            Logging::write(Logging::MODULE_PROPOSAL, Logging::LEVEL_INFO, $message);
            echo $id;
        } else {
            $message = 'Add proposal unsuccessfully [ID=null]';
            Logging::write(Logging::MODULE_PROPOSAL, Logging::LEVEL_ERROR, $message);
            echo 'error';
        }
    }
    
    public function editAction() {
        if (! Permission::isAllowed('proposal', 'edit')) {
            echo 'no_permission';
            return;
        }
        
        $proposal = new Proposal();        
        $proposalid = $_POST['proposalid'];
        $proposalRow = $proposal->find($proposalid)->current();
        
        if ($_SESSION['userName'] != $proposalRow->creator && $_SESSION['userRole'] != 'Administrator') {
            echo 'no_permission';
            return;
        }
        
        $where = $this->db->quoteInto('headline = ?', $_POST['headline'])
                . $this->db->quoteInto(' AND proposalid <> ?', $proposalid);
        $countExist = $proposal->fetchAll($where)->count();
        if ($countExist > 0) {
            echo 'proposal_exist';
            return;
        }
        
        if ($_POST['processresult'] != "")
            $processed = 1;
        else 
            $processed = 0;
            
        $data = array(
            'type' => $_POST['type'],
        	'importance' => $_POST['importance'],
            'headline' => $_POST['headline'],
            'content' => Common::replaceAmpStrip($_POST['content']),
            'processed' => $processed,
            'processresult' => $_POST['processresult'],
            'updatedtime' => date('Y-m-d H:i:s')
        );
        $where = $this->db->quoteInto('proposalid = ?', $proposalid);
        $row = $proposal->update($data, $where);
        if ($row == 1) {
            $message = 'Update proposal successfully [ID=' . $proposalid . ']';
            Logging::write(Logging::MODULE_PROPOSAL, Logging::LEVEL_INFO, $message);
            echo $row;
        } else {
            $message = 'Update proposal unsuccessfully [ID=' . $proposalid . ']';
            Logging::write(Logging::MODULE_PROPOSAL, Logging::LEVEL_ERROR, $message);
            echo 'error';
        }
    }
    
    public function deleteAction() {
        if (! Permission::isAllowed('proposal', 'delete')) {
            echo 'no_permission';
            return;
        }
        
        $proposal = new Proposal();
        $proposalid = $_POST['proposalid'];       
        $proposalRow = $proposal->find($proposalid)->current();
        
        if ($_SESSION['userName'] != $proposalRow->creator && $_SESSION['userRole'] != 'Administrator') {
            echo 'no_permission';
            return;
        }
        
        $row = $proposalRow->delete();
        if ($row == 1) {
            $message = 'Delete proposal successfully [ID=' . $proposalid . ']';
            Logging::write(Logging::MODULE_PROPOSAL, Logging::LEVEL_INFO, $message);
            echo $row;
        } else {
            $message = 'Delete proposal unsuccessfully [ID=' . $proposalid . ']';
            Logging::write(Logging::MODULE_PROPOSAL, Logging::LEVEL_ERROR, $message);
            echo 'error';
        }
    }
}
?>