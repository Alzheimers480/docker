<?php
require "index.php"; 

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
	$stmnt3=$conn->prepare("SELECT * FROM ACQUAINTANCE WHERE ACQUAINTANCE_UID = ?;");
        $stmnt3->bind_param('s', $aacquId);
        $stmnt3->execute();
        $stmnt3->store_result();
        $amount = $stmnt3->num_rows;
        if($amount==0){
                echo "Acquaintance does not exist ";
                return false;
        }
        $stmnt3->close();
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
	exec("rm -r $dir");
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
