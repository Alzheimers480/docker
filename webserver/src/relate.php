<?php
require "index.php";

function newRelation($userId, $acquId, $relation, $message){
	if(empty($userId)|empty($acquId)|empty($relation)|empty($message)){
		echo "one of the fields was blank ";
		return false;
	}
	$conn = connectToDB();
	if(!$conn){
		echo "conn failure ";
		return false;
	}
	$stmnt=$conn->prepare("SELECT * FROM USERS2 WHERE USER_UID = ?;");
	$stmnt->bind_param('s',$userId);
	$stmnt->execute();
	$stmnt->store_result();
	$amount = $stmnt->num_rows;
	if($amount==0){
		echo "user does not exists ";
		return false;
	}
	$stmnt->close();
	$stmnt2=$conn->prepare("SELECT * FROM ACQUAINTANCE WHERE ACQUAINTANCE_UID = ?;");
        $stmnt2->bind_param('s',$acquId);
        $stmnt2->execute();
        $stmnt2->store_result();
        $amount = $stmnt2->num_rows;
	if($amount==0){
                echo "Acuqintance ID does not exists ";
                return false;
        }
	$stmnt2->close();
	
	$rel_id = 0;
	$sql = "SELECT NUM_ACQ FROM USERS2 WHERE USER_UID = '".$userId."';";
	$result=$conn->query($sql);
	if ($row = $result->fetch_assoc()) {$rel_id = $row["NUM_ACQ"];}

	$sql = "update USERS2 set NUM_ACQ = NUM_ACQ + 1 where USER_UID = '".$userId."';";
	$conn->query($sql);

	$uploads_dir = "/var/www/html/facePics/".$acquId;
	//add uploaded file to uploads_dir
	foreach ($_FILES["pics"]["error"] as $key => $error) {
	    if ($error == UPLOAD_ERR_OK) {
	            $tmp_name = $_FILES["pics"]["tmp_name"][$key];
		    $name = $_FILES["pics"]["name"][$key];
		    move_uploaded_file($tmp_name, "$uploads_dir/$name");
	    }
	}

	$acq_dir = scandir("/var/www/html/facePics/".$acquId);
	//print_r($acq_dir);
	if (count($acq_dir) > 2) {
	   $acq_dir = array_slice($acq_dir,2,count($acq_dir)-2);
	   foreach ($acq_dir as $files) {
		$contents = "/var/www/html/facePics/".$acquId."/".$files.";".$rel_id."\n";
		$csv = "/var/www/html/facePics/".$userId."/csv";
		file_put_contents($csv,$contents,FILE_APPEND|LOCK_EX);
	   }
	}
	
	$stmnt3=$conn->prepare("INSERT INTO RELATIONSHIP(USER_UID, ACQUAINTANCE_UID, REL_ID, RELATION, DESCRIPTION) VALUES(?,?,?,?,?);");
	$stmnt3->bind_param('sssss', $userId, $acquId, $rel_id, $relation, $message);
	$stmnt3->execute();
	$stmnt3->close();

	$user_dir = "/var/www/html/facePics/".$userId;
	exec("/var/www/facerec/faces train ".$user_dir."/csv ".$userId);

	$conn->close();
	return true;
}
$fail = false;
session_start();
if(newRelation($_POST["USERNAME"], $_POST["ACQUNAME"], $_POST["RELATION"], $_POST["MESSAGE"])){
	echo "True";
}
else{
	echo "False";
}
?>
