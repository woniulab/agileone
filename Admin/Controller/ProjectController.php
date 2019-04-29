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
 * @version    2009-3-10 1.0
 * @author     DengQiang (http://www.51testing.com/?uid/275266)
 */

class Admin_ProjectController extends Zend_Controller_Action {

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
        
        $sql2 = 'select userid, username from user';
        $user = $this->db->fetchAll($sql2);
        $this->view->user = $user;
        
        echo $this->view->render('Project.phtml');
    }
    
    public function queryAction() {
        $select = $this->db->select();
        $select->from('project', '*');
        if ($_POST['projectid'] != '')
            $select->where('projectid = ?', $_POST['projectid']);
        if ($_POST['projname'] != '')
            $select->where("projname like '%" . $_POST['projname'] . "%'");
        if ($_POST['startdate'] != '')
            $select->where('startdate >= ?', $_POST['startdate']);
        if ($_POST['finishdate'] != '')
            $select->where('finishdate >= ?', $_POST['finishdate']);
        if ($_POST['status'] != '')
            $select->where('status = ?', $_POST['status']);
        if ($_POST['customerid'] != '')
            $select->where('customerid = ?', $_POST['customerid']);
        if ($_POST['overview'] != '')
            $select->where("overview like '%" . Common::replaceAmpStrip($_POST['overview']) . "%'");
//        if ($_POST['module'] != '')
//            $select->where("module like '%" . $_POST['module'] . "%'");
        $select->order('projectid DESC');

        $totalRecord = count($this->db->fetchAll($select));
        $pagerSize = Zend_Registry::get('config')->pager->size;
        $currentPage = $_POST['currentpage'];
        $select->limitPage($currentPage,$pagerSize);
        
        $result = $this->db->fetchAll($select);
        $count = count($result);
        for ($i = 0; $i < $count; $i++) {
            $customerid = $result[$i]['customerid'];
            $sql = "select customerid, custname from customer where customerid=$customerid";
            $resultCustomer = $this->db->fetchAll($sql);
            $result[$i]['customer'] = $resultCustomer[0]['custname'];
        }
        
        $result[]['totalRecord'] = $totalRecord;
        echo json_encode($result);
    }

    public function addAction() {
        $project = new Project();
        
        $where = $this->db->quoteInto('projname = ?', $_POST['projname']);
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
            'createdtime' => date('Y-m-d H:i:s'),
            'updatedtime' => date('Y-m-d H:i:s')
        );
        $id = $project->insert($data);
        if ($id > 0) {
            $message = 'Add project successfully [ID=' . $id . ']';
            Logging::write(Logging::MODULE_ADMIN, Logging::LEVEL_INFO, $message);
            // Add 3 milestones for this project
            for ($i=1; $i<=3; $i++) {
                $milestone = new Milestone();
                $data = array(
                    'projectid' => $id,
                	'msname' => 'Milestone' . $i,
                	'msusage' => 'Default milestone after project created.',
                    'createdtime' => date('Y-m-d H:i:s')
                );
                $milestone->insert($data);
            }
            // Create a folder under Attachment for this project
            $projectFolder = str_replace(' ', '', $_POST['projname']);
            if (!file_exists('Attachment/' . $projectFolder)) {
	            if (mkdir('Attachment/' . $projectFolder, 0777)) {
	            	$message = 'Create folder ' . $projectFolder . ' successfully';
	            	Logging::write(Logging::MODULE_ADMIN, Logging::LEVEL_INFO, $message);
	            }
	            else {
	            	$message = 'Create folder ' . $projectFolder . ' unsuccessfully';
	            	Logging::write(Logging::MODULE_ADMIN, Logging::LEVEL_ERROR, $message);
	            }
            }
            ////////////////////////////////////////////////////
            echo $id;
        } else {
            $message = 'Add project unsuccessfully [ID=null]';
            Logging::write(Logging::MODULE_ADMIN, Logging::LEVEL_ERROR, $message);
            echo 'error';
        }
    }

    public function editAction() {
        $project = new Project();
        $projectid = $_POST['projectid'];
        
        $where = $this->db->quoteInto('projname = ?', $_POST['projname'])
                . $this->db->quoteInto(' AND projectid <> ?', $projectid);
        $countExist = $project->fetchAll($where)->count();
        if ($countExist > 0) {
            echo 'project_exist';
            return;
        }
        
        $projectRow = $project->find($projectid)->current();
        
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
            Logging::write(Logging::MODULE_ADMIN, Logging::LEVEL_INFO, $message);
            // Rename the folder under Attachment for this project
            $projectFolder = str_replace(' ', '', $_POST['projname']);
            if ($projectRow->projname != $projectFolder) {
	            if (!file_exists('Attachment/' . $projectFolder)) {
		            if (rename('Attachment/' . $projectRow->projname, 'Attachment/' . $projectFolder)) {
		            	$message = 'Update folder ' . $projectFolder . ' successfully';
		            	Logging::write(Logging::MODULE_ADMIN, Logging::LEVEL_INFO, $message);
		            }
		            else {
		            	$message = 'Update folder ' . $projectFolder . ' unsuccessfully';
		            	Logging::write(Logging::MODULE_ADMIN, Logging::LEVEL_ERROR, $message);
		            }
            	}
            }
            ////////////////////////////////////////////////////
            echo $row;
        } else {
            $message = 'Update project unsuccessfully [ID=' . $projectid . ']';
            Logging::write(Logging::MODULE_ADMIN, Logging::LEVEL_ERROR, $message);
            echo 'error';
        }
    }

    public function deleteAction() {
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
        
//        $iterationRowCount = $projectRow->findDependentRowset('Iteration')->count();
//        if ($iterationRowCount > 0) {
//            echo $this->translate->_('message.common.table.referenced') , 'Iteration';
//            return;
//        }
        
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
        
        $userstoryRowCount = $projectRow->findDependentRowset('Userstory')->count();
        if ($userstoryRowCount > 0) {
            echo $this->translate->_('message.common.table.referenced') , 'Userstory';
            return;
        }
        
        $row = $projectRow->delete();
        if ($row == 1) {
            $message = 'Delete project successfully [ID=' . $projectid . ']';
            Logging::write(Logging::MODULE_ADMIN, Logging::LEVEL_INFO, $message);
            echo $row;
        } else {
            $message = 'Delete project unsuccessfully [ID=' . $projectid . ']';
            Logging::write(Logging::MODULE_ADMIN, Logging::LEVEL_ERROR, $message);
            echo 'error';
        }
    }
}
?>