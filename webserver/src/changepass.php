<!DOCTYPE HTML> 
<html>
<body>

<?php

require "index.php";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
	$userId = $_POST["id"];
	$pass = $_POST["password"];
	$pass2 = $_POST["password2"];
	if(empty($userId)){
                echo "ERROR User not selected";
        }
        elseif(empty($pass)|empty($pass2)){
                echo "one of the fields was blank";
        }
        elseif($pass!=$pass2){
                echo "password1 must match password 2";
        }
	//need to add pass length check
	else{
		$conn = connectToDB();
        	if(!$conn){
                	 echo "conn failure ";
        	}
		else{
			$stmnt2=$conn->prepare("SELECT * FROM USERS2 WHERE USER_UID = ?;");
        		$stmnt2->bind_param('s', $userId);
        		$stmnt2->execute();
        		$stmnt2->store_result();
        		$amount = $stmnt2->num_rows;
        		if($amount==0){
                		echo "user does not exists ";
				$stmnt2->close();
       			}
			else{
				$stmnt2->close();
				$stmnt=$conn->prepare("UPDATE USERS2 SET USER_PWDHSH = ?, USER_PWDSALT = ?  WHERE USER_UID = ?;");
        			$salt = file_get_contents('/dev/urandom', false, null, 0, 64);
        			$options = array(
               				'salt' => $salt
      				);
        			$phash=crypt($pass,$salt);
        			$stmnt->bind_param('sss',$phash,$salt,$userId);
        			$stmnt->execute();
        			$stmnt->close();
        			$conn->close();
				echo "your password has been changed";
			}

        	}
	
	}

}

?>


<h2>Enter your new password twice here.</h2>
<form method="post" action="changepass.php?USERNAME=<?php echo htmlspecialchars($_GET['USERNAME'], ENT_QUOTES); ?>">
<input name="id" type="hidden" value="<?php echo htmlspecialchars($_GET['USERNAME'], ENT_QUOTES); ?>">
Password: <input type="text" name="password"><br>
Repeat Password: <input type="text" name="password2"><br>
<input type="submit" name="submit" value="Submit">
</body>
</html>	



