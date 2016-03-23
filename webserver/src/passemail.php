<?php
$fail=false;
session_start();

require "index.php";

function sendPass($userId){
	if(empty($userId)){
		echo "no user ID specified ";
		return false;
	}
	$conn = connectToDB();
        if(!$conn){
                 echo "conn failure ";
                 return false;
        }
        $stmnt2=$conn->prepare("SELECT USER_EMAIL FROM USERS2 WHERE USER_UID = ?;");
        $stmnt2->bind_param('s', $userId);
        $stmnt2->execute();
	$stmnt2->store_result();
	$amount = $stmnt2->num_rows;
        if($amount==0){
                echo "user does not exists ";
                return false;
        }
	$stmnt2->close();
	$stmnt=$conn->prepare("SELECT USER_EMAIL FROM USERS2 WHERE USER_UID = ?;");
        $stmnt->bind_param('s', $userId);
        $stmnt->execute();
        $stmnt->bind_result($email);
	$stmnt->fetch();
        $subject = "Change Password From Who R U";
        $message = "fill out the form at this link to create a new passord for your account\n141.210.25.46/changepass.php?USERNAME=$userId";
        $from = "-f your@email.here";
        if(mail($email, $subject, $message)){
		$stmnt->close();
        	return true;
        }
	else{
		echo "unable to send mail ";
		$stmnt->close();
		return false;
	}
}
if(sendPass($_POST["USERNAME"])){
	echo "True";
}
else{
	echo "False";
}
?>
