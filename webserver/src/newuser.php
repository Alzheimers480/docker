<?php

require "index.php";


function newUser($username, $password, $password2, $fname, $lname, $email){
	if(empty($username) || empty($password) || empty($password2) || empty($fname) || empty($lname) || empty($email)){
		echo "one of the fields was blank ";
		return false;
	}
	if($password != $password2){
		echo "The 2 passwords didn't match ";
		return false;
	}
	$conn = connectToDB();
 	if(!$conn){
        	 echo "conn failure ";
               	 return false;
       	}
	$stmnt2=$conn->prepare("SELECT * FROM USERS2 WHERE USER_UID = ?;");
	$stmnt2->bind_param('s', $username);
	$stmnt2->execute();
	$stmnt2->store_result();
	$amount = $stmnt2->num_rows;
	if($amount>=1){
		echo "user already exists ";
		return false;
	}
	$stmnt2->close();
	$stmnt=$conn->prepare("INSERT INTO USERS2(USER_UID,USER_PWDHSH,USER_PWDSALT,USER_FNAME,USER_LNAME, USER_EMAIL, VERIFYED) VALUES(?,?,?,?,?,?,1)");
	$salt = file_get_contents('/dev/urandom', false, null, 0, 64);
	$options = array(
               'salt' => $salt
       );
        $phash=crypt($password,$salt);
	$stmnt->bind_param('ssssss',$username,$phash,$salt,$fname,$lname,$email);
        $stmnt->execute();
        $stmnt->close();
        $conn->close();
	return true;
}

$fail=false;
session_start();
if(newUser($_POST["USERNAME"], $_POST["PASSWORD"], $_POST["PASSWORD2"], $_POST["FNAME"], $_POST["LNAME"], $_POST["EMAIL"])) {
	echo "True";
	//make folder for every new user
	$dir = "/var/www/html/facePics/".$_POST["USERNAME"];
	mkdir($dir);
	//make csv file
	$file = $dir."/csv";
	touch($file);
	$mail = $_POST["EMAIL"];
	$name = $_POST["USERNAME"];
	$subject = "Welcome to the Who R U";	
	$message = "141.210.25.46/email.php?USERNAME=$name";
	$headers = "";
	$from = "-f your@email.here";
	if(mail($mail, $subject, $message)){
//		echo "Mail worked";	
	}
	else{
//		echo "mail failed";
	}
//	exec("mail -s \"Welcome\" \"scnolton@oakland.edu\" <<EOF TEsting  EOF");
//	echo exec('whoami');
}
else{
	echo "False";
}
?>
