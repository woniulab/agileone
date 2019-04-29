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
 * @version    2009-5-18 1.0
 * @author     DengQiang (http://www.51testing.com/?uid/275266)
 */

class ProjectController extends Zend_Controller_Action {

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
        $sql1 = 'select customerid, custname from customer order by customerid';
        $customer = $this->db->fetchAll($sql1);
        $this->view->customer = $customer;
        
        $sql2 = 'select * from project where projectid=' . $_SESSION['currentProjectId'];
        $project = $this->db->fetchAll($sql2);
        $this->view->project = $project[0];
        
        $sql3 = 'select userid, username from user';
        $user = $this->db->fetchAll($sql3);
        $this->view->user = $user;
        
        echo $this->view->render('Project.phtml');
    }

    public function editAction() {
        if (! Permission::isAllowed('project', 'edit')) {
            echo 'no_permission';
            return;
        }
        
        $project = new Project();
        $projectid = $_POST['projectid'];
        
        $where = $this->db->quoteInto('projname = ?', $_POST['projname'])
                . $this->db->quoteInto(' AND projectid <> ?', $projectid);
        $countExist = $project->fetchAll($where)->count();
        if ($countExist > 0) {
            echo 'project_exist';
            return;
        }
        
        $data = array(
        	'projname' => $_POST['projname'],
        	'startdate' => $_POST['startdate'],
        	'finishdate' => $_POST['finishdate'],
        	'status' => $_POST['status'],
        	'customerid' => $_POST['customerid'],
        	'overview' => Common::replaceAmpStrip($_POST['overview']),
            'updatedtime' => date('Y-m-d H:i:s')
        );
        
        $where = $this->db->quoteInto('projectid = ?', $projectid);
        $row = $project->update($data, $where);
        if ($row == 1) {
            $message = 'Update project successfully [ID=' . $projectid . ']';
            Logging::write(Logging::MODULE_PROJECT, Logging::LEVEL_INFO, $message);
            echo $row;
        } else {
            $message = 'Update project unsuccessfully [ID=' . $projectid . ']';
            Logging::write(Logging::MODULE_PROJECT, Logging::LEVEL_ERROR, $message);
            echo 'error';
        }
    }

    public function deleteAction() {
        if (! Permission::isAllowed('project', 'delete')) {
            echo 'no_permission';
            return;
        }
        
        $project = new Project();
        $projectid = $_POST['projectid'];
        $projectRow = $project->find($projectid)->current();
        
        $userRowCount = $projectRow->findDependentRowset('UserProject')->count();
        if ($userRowCount > 0) {
            echo $this->translate->_('message.common.table.referenced') , 'User';
            return;
        }
        
        $knowledgeRowCount = $projectRow->findDependentRowset('Knowledge')->count();
        if ($knowledgeRowCount > 0) {
            echo $this->translate->_('message.common.table.referenced') , 'Knowledge';
            return;
        }
        
        $versionRowCount = $projectRow->findDependentRowset('Version')->count();
        if ($versionRowCount > 0) {
            echo $this->translate->_('message.common.table.referenced') , 'Version';
            return;
        }
        
        $moduleRowCount = $projectRow->findDependentRowset('Module')->count();
        if ($moduleRowCount > 0) {
            echo $this->translate->_('message.common.table.referenced') , 'Module';
            return;
        }
        
        $platformRowCount = $projectRow->findDependentRowset('Platform')->count();
        if ($platformRowCount > 0) {
            echo $this->translate->_('message.common.table.referenced') , 'Platform';
            return;
        }
        
        $minutesRowCount = $projectRow->findDependentRowset('Minutes')->count();
        if ($minutesRowCount > 0) {
            echo $this->translate->_('message.common.table.referenced') , 'Minutes';
            return;
        }
        
        $proposalRowCount = $projectRow->findDependentRowset('Proposal')->count();
        if ($proposalRowCount > 0) {
            echo $this->translate->_('message.common.table.referenced') , 'Proposal';
            return;
        }
        
        $row = $projectRow->delete();
        if ($row == 1) {
            $message = 'Delete project successfully [ID=' . $projectid . ']';
            Logging::write(Logging::MODULE_PROJECT, Logging::LEVEL_INFO, $message);
            echo $row;
        } else {
            $message = 'Delete project unsuccessfully [ID=' . $projectid . ']';
            Logging::write(Logging::MODULE_PROJECT, Logging::LEVEL_ERROR, $message);
            echo 'error';
        }
    }
}
?>