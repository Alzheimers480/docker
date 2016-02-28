<?php
require "index.php";


function predict($file,$user) {
	 return exec("/var/www/facerec/faces predict ".$file." ".$user);
}
$filep = $_FILES['pic']['tmp_name'];
$userid = $_POST['USERNAME'];
echo predict($filep, $userid);
?>
