<?php
require "index.php";

function modAcqu($userId, $acquId) {
	if(empty($userId)|empty($acquId)) {
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

	// get the number of acquaintances for the user	
	$rel_id = 0;
	$sql = "SELECT REL_ID FROM RELATIONSHIP WHERE ACQUAINTANCE_UID = '".$acquId."' AND USER_UID = '".$userId."';";
	$result=$conn->query($sql);
	if ($row = $result->fetch_assoc()) {$rel_id = $row["REL_ID"];}

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

	$user_dir = "/var/www/html/facePics/".$userId;
	exec("/var/www/facerec/faces train ".$user_dir."/csv ".$userId);
	$conn->close();
	return true;
}
$fail = false;
session_start();
if(modAcqu($_POST["USERNAME"], $_POST["ACQUNAME"])){
	echo "True";
}
else{
	echo "False";
}
?>
