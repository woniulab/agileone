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
 * @version    2009-5-20 1.0
 * @author     DengQiang (http://www.51testing.com/?uid/275266)
 */

class MinutesController extends Zend_Controller_Action {

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
        echo $this->view->render('Minutes.phtml');
    }
    
    public function queryAction() {
        $select = $this->db->select();
        $select->from('minutes', '*');
        if ($_POST['minutesid'] != '')
            $select->where('minutesid = ?', $_POST['minutesid']);
        if ($_POST['topic'] != '')
            $select->where("topic like '%" . $_POST['topic'] . "%'");
        if ($_POST['holdtime'] != '')
            $select->where("holdtime like '%" . $_POST['holdtime'] . "%'");
        if ($_POST['organizer'] != '')
            $select->where("organizer like '%" . $_POST['organizer'] . "%'");
        if ($_POST['venue'] != '')
            $select->where("venue like '%" . $_POST['venue'] . "%'");
        if ($_POST['attendee'] != '')
            $select->where("attendee like '%" . $_POST['attendee'] . "%'");
        if ($_POST['resolution'] != '')
            $select->where("resolution like '%" . Common::replaceAmpStrip($_POST['resolution']) . "%'");
        $select->where('projectid = ?', $_SESSION['currentProjectId']);
        $select->order('minutesid DESC');
        
        $totalRecord = count($this->db->fetchAll($select));
        $pagerSize = Zend_Registry::get('config')->pager->size;
        $currentPage = $_POST['currentpage'];
        $select->limitPage($currentPage,$pagerSize);
        $result = $this->db->fetchAll($select);
        $result[]['totalRecord'] = $totalRecord;
        
        echo json_encode($result);
    }

    public function addAction() {
        if (! Permission::isAllowed('minutes', 'add')) {
            echo 'no_permission';
            return;
        }
        
        $minutes = new Minutes();

        $data = array(
        	'projectid' => $_SESSION['currentProjectId'],
        	'topic' => $_POST['topic'],
        	'holdtime' => $_POST['holdtime'],
        	'organizer' => $_POST['organizer'],
        	'venue' => $_POST['venue'],
        	'attendee' => $_POST['attendee'],
            'resolution' => Common::replaceAmpStrip($_POST['resolution']),
            'createdtime' => date('Y-m-d H:i:s'),
            'updatedtime' => date('Y-m-d H:i:s')
        );
        $id = $minutes->insert($data);
        if ($id > 0) {
            $message = 'Add minutes successfully [ID=' . $id . ']';
            Logging::write(Logging::MODULE_MINUTES, Logging::LEVEL_INFO, $message);
            echo $id;
        } else {
            $message = 'Add minutes unsuccessfully [ID=null]';
            Logging::write(Logging::MODULE_MINUTES, Logging::LEVEL_ERROR, $message);
            echo 'error';
        }
    }

    public function editAction() {
        if (! Permission::isAllowed('minutes', 'edit')) {
            echo 'no_permission';
            return;
        }
        
        $minutes = new Minutes();
        $minutesid = $_POST['minutesid'];

        $data = array(
        	'topic' => $_POST['topic'],
        	'holdtime' => $_POST['holdtime'],
        	'organizer' => $_POST['organizer'],
        	'venue' => $_POST['venue'],
        	'attendee' => $_POST['attendee'],
            'resolution' => Common::replaceAmpStrip($_POST['resolution']),
            'updatedtime' => date('Y-m-d H:i:s')
        );
        
        $where = $this->db->quoteInto('minutesid = ?', $minutesid);
        $row = $minutes->update($data, $where);
        if ($row == 1) {
            $message = 'Update minutes successfully [ID=' . $minutesid . ']';
            Logging::write(Logging::MODULE_MINUTES, Logging::LEVEL_INFO, $message);
            echo $row;
        } else {
            $message = 'Update minutes unsuccessfully [ID=' . $minutesid . ']';
            Logging::write(Logging::MODULE_MINUTES, Logging::LEVEL_ERROR, $message);
            echo 'error';
        }
    }

    public function deleteAction() {
        if (! Permission::isAllowed('minutes', 'delete')) {
            echo 'no_permission';
            return;
        }
        
        $minutes = new Minutes();
        $minutesid = $_POST['minutesid'];
        $minutesRow = $minutes->find($minutesid)->current();

        $row = $minutesRow->delete();
        if ($row == 1) {
            $message = 'Delete minutes successfully [ID=' . $minutesid . ']';
            Logging::write(Logging::MODULE_MINUTES, Logging::LEVEL_INFO, $message);
            echo $row;
        } else {
            $message = 'Delete minutes unsuccessfully [ID=' . $minutesid . ']';
            Logging::write(Logging::MODULE_MINUTES, Logging::LEVEL_ERROR, $message);
            echo 'error';
        }
    }
}
?>