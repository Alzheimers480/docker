<?php
require "index.php";


function predict($file,$user) {
	 $guess = exec("/var/www/facerec/faces predict ".$file." ".$user);
	 //echo $guess;
	 $conn = connectToDB();
	 $sql = "SELECT ACQUAINTANCE_FNAME, ACQUAINTANCE_LNAME, RELATION, DESCRIPTION FROM RELATIONSHIP NATURAL JOIN ACQUAINTANCE WHERE USER_UID = '".$user."' AND REL_ID=".$guess.";";
	 //echo "\n".$sql;
	 $result=$conn->query($sql);
	 $row = $result->fetch_assoc();
	 print_r($row);
}
$filep = $_FILES['pic']['tmp_name'];
$userid = $_POST['USERNAME'];
echo predict($filep, $userid);
?>