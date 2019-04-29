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
 * @version    2010-1-26 1.0
 * @author     DengQiang (http://www.51testing.com/?uid/275266)
 */

class ReplyController extends Zend_Controller_Action {

    /**
     * Initialize the controller for common usage
     */
    public function init() {
        $this->view = Zend_Registry::get('view');
        $this->translate = Zend_Registry::get('Zend_Translate');
        $this->db = Zend_Db_Table::getDefaultAdapter();
        $this->_helper->layout->disableLayout();
    }

    public function queryAction() {
    	$select = $this->db->select();
    	$select->from('reply', '*');
        $select->where('refertype = ?', $_POST['refertype']);
        $select->where('referid = ?', $_POST['referid']);
        $select->order('replyid DESC');
                
        $result = $this->db->fetchAll($select);
        echo json_encode($result);
    }
    
    public function addAction() {
    	if (! Permission::isAllowed('defect', 'edit')) {
            echo 'no_permission';
            return;
        }
        
        $reply = new Reply();
        $data = array(
            'refertype' => $_POST['refertype'],
            'referid' => $_POST['referid'],
            'replier' => $_SESSION['userName'],
            'content' => Common::replaceAmpStrip($_POST['content']),
        	'extraone' => $_POST['extraone'],
        	'extratwo' => $_POST['extratwo'],
            'createdtime' => date('Y-m-d H:i:s')
        );
        $id = $reply->insert($data);
        if ($id > 0) {
        	if ($_POST['refertype'] == 'defect') {
        		$defect = new Defect();        
        		$defectid = $_POST['referid'];
        		$defectRow = $defect->find($defectid)->current();
    			$defectRow->status = $_POST['extraone'];
    			$defectRow->save();
        	}
        	
        	// Check if need to add new task to the assignee
        	$user = new User();
        	$task = new Task();
        	$where = $this->db->quoteInto('username = ?', $_POST['extratwo']);
        	$userid = $user->fetchRow($where)->userid;
        	$where = $this->db->quoteInto('refertype = ?', $_POST['refertype'])
                . $this->db->quoteInto(' AND referid = ?', $_POST['referid'])
                . $this->db->quoteInto(' AND userid = ?', $userid);
		    $countExist = $task->fetchAll($where)->count();
		    if ($countExist < 1) {
		    	$data = array(
                    'userid' => $userid,
                    'refertype' => $_POST['refertype'],
                	'referid' => $_POST['referid'],
                	'content' => 'Assinged to work for ' . $_POST['refertype'] . ' ' . $_POST['referid'],
                	'createdtime' => date('Y-m-d H:i:s'),
            		'updatedtime' => date('Y-m-d H:i:s')
	            );
	            $task->insert($data);
		    }
		    
            $message = 'Add defect reply successfully [ID=' . $id . ']';
            Logging::write(Logging::MODULE_DEFECT, Logging::LEVEL_INFO, $message);
            echo $id;
        } else {
            $message = 'Add defect reply unsuccessfully [ID=null]';
            Logging::write(Logging::MODULE_DEFECT, Logging::LEVEL_ERROR, $message);
            echo 'error';
        }
    }
}
?>