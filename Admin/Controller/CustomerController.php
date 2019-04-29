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

class Admin_CustomerController extends Zend_Controller_Action {

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
        echo $this->view->render('Customer.phtml');
    }
    
    public function queryAction() {
        $select = $this->db->select();
        $select->from('customer', '*');
        if ($_POST['customerid'] != '')
            $select->where('customerid = ?', $_POST['customerid']);
        if ($_POST['custname'] != '')
            $select->where("custname like '%" . $_POST['custname'] . "%'");
        if ($_POST['contact'] != '')
            $select->where("contact like '%" . $_POST['contact'] . "%'");
        if ($_POST['email'] != '')
            $select->where("email like '%" . $_POST['email'] . "%'");
        if ($_POST['phone'] != '')
            $select->where("phone like '%" . $_POST['phone'] . "%'");
        if ($_POST['website'] != '')
            $select->where("website like '%" . $_POST['website'] . "%'");
        if ($_POST['address'] != '')
            $select->where("address like '%" . $_POST['address'] . "%'");
        if ($_POST['intro'] != '')
            $select->where("intro like '%" . Common::replaceAmpStrip($_POST['intro']) . "%'");
        $select->order('customerid DESC');
        
        $totalRecord = count($this->db->fetchAll($select));
        $pagerSize = Zend_Registry::get('config')->pager->size;
        $currentPage = $_POST['currentpage'];
        $select->limitPage($currentPage,$pagerSize);
        $result = $this->db->fetchAll($select);
        $result[]['totalRecord'] = $totalRecord;
        
        echo json_encode($result);
    }

    public function addAction() {
        $customer = new Customer();
        
        $where = $this->db->quoteInto('custname = ?', $_POST['custname']);
        $countExist = $customer->fetchAll($where)->count();
        if ($countExist > 0) {
            echo 'customer_exist';
            return;
        }

        $data = array(
        	'custname' => $_POST['custname'],
        	'contact' => $_POST['contact'],
        	'email' => $_POST['email'],
        	'phone' => $_POST['phone'],
        	'website' => $_POST['website'],
        	'address' => $_POST['address'],
        	'intro' => Common::replaceAmpStrip($_POST['intro']),
            'createdtime' => date('Y-m-d H:i:s'),
            'updatedtime' => date('Y-m-d H:i:s')
        );
        $id = $customer->insert($data);
        if ($id > 0) {
            $message = 'Add customer successfully [ID=' . $id . ']';
            Logging::write(Logging::MODULE_ADMIN, Logging::LEVEL_INFO, $message);
            echo $id;
        } else {
            $message = 'Add customer unsuccessfully [ID=null]';
            Logging::write(Logging::MODULE_ADMIN, Logging::LEVEL_ERROR, $message);
            echo 'error';
        }
    }

    public function editAction() {
        $customer = new Customer();
        $customerid = $_POST['customerid'];
        
        $where = $this->db->quoteInto('custname = ?', $_POST['custname'])
                . $this->db->quoteInto(' AND customerid <> ?', $customerid);
        $countExist = $customer->fetchAll($where)->count();
        if ($countExist > 0) {
            echo 'customer_exist';
            return;
        }
        
        $data = array(
        	'custname' => $_POST['custname'],
        	'contact' => $_POST['contact'],
        	'email' => $_POST['email'],
        	'phone' => $_POST['phone'],
        	'website' => $_POST['website'],
        	'address' => $_POST['address'],
        	'intro' => Common::replaceAmpStrip($_POST['intro']),
            'updatedtime' => date('Y-m-d H:i:s')
        );
        $where = $this->db->quoteInto('customerid = ?', $customerid);
        $row = $customer->update($data, $where);
        if ($row == 1) {
            $message = 'Update customer successfully [ID=' . $customerid . ']';
            Logging::write(Logging::MODULE_ADMIN, Logging::LEVEL_INFO, $message);
            echo $row;
        } else {
            $message = 'Update customer unsuccessfully [ID=' . $customerid . ']';
            Logging::write(Logging::MODULE_ADMIN, Logging::LEVEL_ERROR, $message);
            echo 'error';
        }
    }

    public function deleteAction() {
        $customer = new Customer();
        $customerid = $_POST['customerid'];
        $customerRow = $customer->find($customerid)->current();
        
        $userRowCount = $customerRow->findDependentRowset('User')->count();
        if ($userRowCount > 0) {
            echo $this->translate->_('message.common.table.referenced') , 'User';
            return;
        }
        
        $projectRowCount = $customerRow->findDependentRowset('Project')->count();
        if ($projectRowCount > 0) {
            echo $this->translate->_('message.common.table.referenced') , 'Project';
            return;
        }
        
        $row = $customerRow->delete();
        if ($row == 1) {
            $message = 'Delete customer successfully [ID=' . $customerid . ']';
            Logging::write(Logging::MODULE_ADMIN, Logging::LEVEL_INFO, $message);
            echo $row;
        } else {
            $message = 'Delete customer unsuccessfully [ID=' . $customerid . ']';
            Logging::write(Logging::MODULE_ADMIN, Logging::LEVEL_ERROR, $message);
            echo 'error';
        }
    }
}
?>