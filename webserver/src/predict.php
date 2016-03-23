<?php
require "index.php";


function predict($file,$user) {
	 $guess = exec("/var/www/facerec/faces predict ".$file." ".$user, $output);
	 $guess = $output[0];
	 $conn = connectToDB();
	 $sql = "SELECT ACQUAINTANCE_FNAME, ACQUAINTANCE_LNAME, RELATION, DESCRIPTION FROM RELATIONSHIP NATURAL JOIN ACQUAINTANCE WHERE USER_UID = '".$user."' AND REL_ID=".$guess.";";
	 $result=$conn->query($sql);
	 $row = $result->fetch_assoc();
	 $row["DISTANCE"] = $output[1];
	 echo json_encode($row);
}
$filep = $_FILES['pic']['tmp_name'];
$userid = $_POST['USERNAME'];
predict($filep, $userid);
?>