<?php
session_start();
$fileName = $_FILES['PIC1']['name'];
$acqu = substr(0, strlen($fileName)-3);
echo $acqu;
if(move_uploaded_file($_FILES['PIC1']['tmp_name'], "/var/www/html/facePics/$acqu/pic1")){
	echo "Yay";
}
else{
	echo "No";
}
?>