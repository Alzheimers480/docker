<?php
session_start();

$uploads_dir = "/var/www/html/facePics/".$_POST['USERNAME']."/".$_POST['ACQ_NAME'];
foreach ($_FILES["pics"]["error"] as $key => $error) {
    if ($error == UPLOAD_ERR_OK) {
        $tmp_name = $_FILES["pics"]["tmp_name"][$key];
        $name = $_FILES["pics"]["name"][$key];
        move_uploaded_file($tmp_name, "$uploads_dir/$name");
    }
}
?>