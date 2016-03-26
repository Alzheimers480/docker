<?php
require "index.php";
$fail=false;
session_start();
$id = $_POST["USERNAME"];
$fname = $_POST["FNAME"];
$lname = $_POST["LNAME"];
$gender = $_POST["GENDER"];

function newAcqua($username, $fname, $lname, $gender){
	if(empty($username) | empty($fname) | empty($lname)){
		echo "one or more paramters missing ";
		return false;
	}
	$conn = connectToDB();
	if(!$conn){
                echo "conn failure ";
                return false;
        }
	$stmnt2=$conn->prepare("SELECT * FROM ACQUAINTANCE WHERE ACQUAINTANCE_UID = ?;");
        $stmnt2->bind_param('s', $username);
        $stmnt2->execute();
        $stmnt2->store_result();
        $amount = $stmnt2->num_rows;
	if($amount>=1){
                echo "Acquaintance already exists ";
                return false;
        }
        $stmnt2->close();
	$stmnt = $conn->prepare("INSERT INTO ACQUAINTANCE(ACQUAINTANCE_UID, ACQUAINTANCE_FNAME, ACQUAINTANCE_LNAME, GENDER, PICTURE_SET) VALUES(?,?,?,?,'/SECS/home/s/scnolton/facePics/$username')");
	$stmnt->bind_param('ssss', $username, $fname, $lname, $gender);
	$stmnt->execute();
	$stmnt->close();
	$conn->close();
	return true;
}



$fail = false;
session_start();
if(newAcqua($id, $fname, $lname, $gender)){
	echo "True";
	$dir = "/var/www/html/facePics/".$id;
	mkdir($dir);
}
else{
	echo "False";
}


?>
