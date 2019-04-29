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
 * @version    2009-12-09 1.0
 * @author     DengQiang (http://www.51testing.com/?uid/275266)
 */

class AttachController extends Zend_Controller_Action {

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
    	$select->from('attach', '*');
        $select->where('refertype = ?', $_POST['refertype']);
        $select->where('referid = ?', $_POST['referid']);
                
        $result = $this->db->fetchAll($select);
        echo json_encode($result);
    }
    
    public function uploadAction() {
		$msg = "";
		$fileElementName = 'fileToUpload';
		$tmpName = $_FILES[$fileElementName]['tmp_name'];
		if (!empty($_FILES[$fileElementName]['error'])) {
			switch($_FILES[$fileElementName]['error']) {
				case '1':
					$msg = 'The uploaded file exceeds the upload_max_filesize directive in php.ini';
					break;
				case '2':
					$msg = 'The uploaded file exceeds the MAX_FILE_SIZE directive that was specified in the HTML form';
					break;
				case '3':
					$msg = 'The uploaded file was only partially uploaded';
					break;
				case '4':
					$msg = 'No file was uploaded.';
					break;
				default:
					$msg = 'No error code avaiable';
			}
		}
		elseif (empty($tmpName) || $tmpName == 'none') {
			$msg = 'No file was uploaded..';
		}
		else {
			$fileName = $_FILES[$fileElementName]['name'];
			$tempArr = explode(".", $fileName);
		    $fileExt = array_pop($tempArr);
		    $fileExt = strtolower(trim($fileExt));
		    //$storeName = date('Ymd_His') . '_' . rand(1000, 9999) . '.' . $fileExt;
		    $storeName = date('YmdHis') . '.' . $fileExt;
		    $size = $_FILES[$fileElementName]['size'];
		    $savePath = 'Attachment/' . Zend_Registry::get('config')->curproj->folder . '/';
			if (move_uploaded_file($tmpName, $savePath . $storeName)) {
				$attach = new Attach();
        		$data = array(
							'refertype' => $this->getRequest()->getParam('refertype'),
        					'referid' => $this->getRequest()->getParam('referid'),
        					'filename' => $fileName,
        					'storename' => $storeName,
        					'folder' => Zend_Registry::get('config')->curproj->folder,
        					'size' => $size,
        					'creator' => $_SESSION['userName'],
        					'createdtime' => date('Y-m-d H:i:s')
        				);
        		$id = $attach->insert($data);
        		
        		$data['attachid'] = $id;
        		echo json_encode($data);
        		return;
    		}
    		else {
    			$msg = "Failed to upload this file.";
    		}
		}
		echo $msg;
    }
    
    public function deleteAction() {
    	$referType = $_POST['refertype'];
    	$attachid = $_POST['attachid'];
    	
    	if (! Permission::isAllowed($referType, 'delete')) {
            echo 'no_permission';
            return;
        }
        
        $attach = new Attach();
        $attachRow = $attach->find($attachid)->current();
        
        $row = $attachRow->delete();
        if ($row == 1) 
            echo $row;
        else
            echo 'error';
    }
}
?>