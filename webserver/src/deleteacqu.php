<?php
require "index.php"

public static function delTree($dir) { 
   $files = array_diff(scandir($dir), array('.','..')); 
    foreach ($files as $file) { 
      (is_dir("$dir/$file")) ? delTree("$dir/$file") : unlink("$dir/$file"); 
    } 
    return rmdir($dir); 
  } 

function deleteAcqu($acquId){
	if(empty($acquId)){
                //empty username and password
		echo "Acquaintance Not Found ";
                return false;
        }
        $conn = connectToDB();
        if(!$conn){
                echo "conn failure ";
                return false;
        }
	$stmnt=$conn->prepare("DELETE FROM RELATIONSHIP WHERE ACQUAINTANCE_UID = ?;");
        $stmnt->bind_param('s', $acquId);
        $stmnt->execute();
        $stmnt->close();
        $stmnt2=$conn->prepare("DELETE FROM ACQUAINTANCE WHERE ACQUAINTANCE_UID = ?;");
        $stmnt2->bind_param('s', $acquId);
        $stmnt2->execute();
        $stmnt2->close();
        $conn->close();
	$dir = "/var/www/html/facePics/".$acquId;
	delTree($dir);
        return true;
}

$fail=false;
session_start();
if(deleteAcqu($_POST["ACQUID"])){
        echo "True";
}
else{
        echo "False";
}
?>
