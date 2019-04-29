<?php

$conf = parse_ini_file('../../../Common/Config/Global.conf');
// Where to save the image
$save_path = '../../../Attachment/' . $conf['curproj.folder'] . '/';
// What the image's URL is
if ($conf['module.rewrite'] == 'disabled')
	$save_url = '../Attachment/' . $conf['curproj.folder'] . '/';
else 
	$save_url = './Attachment/' . $conf['curproj.folder'] . '/';

// Allowed extention name
$ext_arr = array('gif', 'jpg', 'jpeg', 'png', 'bmp');

$max_size = $conf['upload.size'] * 1024;	// The allowed maximium size
@mkdir($save_path, 0777);	// Change the permission

// If there is uploaded file
if (empty($_FILES) === false) {
    $file_name = $_FILES['imgFile']['name'];	// Original file name
    
    // Temporary file name on server
    $tmp_name = $_FILES['imgFile']['tmp_name'];
    $file_size = $_FILES['imgFile']['size'];

    if (!$file_name) {
        alert("Please choose a image file first.");
    }
    // Check folder
    if (@is_dir($save_path) === false) {
        alert("The destination folder is not existent.");
    }
    // Check permission
    if (@is_writable($save_path) === false) {
        alert("The destination folder doesn't have Write permission.");
    }
    // Check if it is already uploaded
    if (@is_uploaded_file($tmp_name) === false) {
        alert("The temp file may be not a uploaded file.");
    }
    // Check file size
    if ($file_size > $max_size) {
        alert("The uploaded file is too large, the limitation is: " . $conf['attachment.maxsize'] . ' KB.');
    }
    // Get the file's extention name
    $temp_arr = explode(".", $file_name);
    $file_ext = array_pop($temp_arr);
    $file_ext = trim($file_ext);
    $file_ext = strtolower($file_ext);

    // Check the extention name
    if (in_array($file_ext, $ext_arr) === false) {
        alert("Only accept [gif jpg jpeg png bmp] as the extention name.");
    }
    if ($file_ext == 'bmp')
    	$file_ext = 'jpg';
    // Move to the destination folder
    $file_name = date('YmdHis') . '.' . $file_ext;		// New file name to save to server
    $file_path = $save_path . $file_name;
    if (move_uploaded_file($tmp_name, $file_path) === false) {
        alert("Failed to upload this file.");
    }
    $file_url = $save_url . $file_name;
    // Insert the image into the editor
    echo '<html>';
    echo '<head>';
    echo '<title>Insert Image</title>';
    echo '<meta http-equiv="content-type" content="text/html; charset=utf-8">';
    echo '</head>';
    echo '<body>';
    echo '<script type="text/javascript">parent.KE.plugin["image"].insert("' . $_POST['id'] . '", "' . $file_url . '","' . $_POST['imgTitle'] . '","' . $_POST['imgWidth'] . '","' . $_POST['imgHeight'] . '","' . $_POST['imgBorder'] . '");</script>';
    echo '</body>';
    echo '</html>';
}

function alert($msg)
{
    echo '<html>';
    echo '<head>';
    echo '<title>error</title>';
    echo '<meta http-equiv="content-type" content="text/html; charset=utf-8">';
    echo '</head>';
    echo '<body>';
    echo '<script type="text/javascript">alert("'.$msg.'");history.back();</script>';
    echo '</body>';
    echo '</html>';
    exit;
}
?>