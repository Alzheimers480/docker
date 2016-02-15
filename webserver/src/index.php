<?php
echo "Hello frog34234234234";
$host = getenv("DB_PORT_3306_TCP_ADDR");
echo $host;
$mysqli = new mysqli($host, "root", "my-secret", "morty");
if ($mysqli->connect_errno) {
    echo "Failed to connect to MySQL: (" . $mysqli->connect_errno . ") " . $mysqli->connect_error;
}
echo $mysqli->host_info . "\n";
$res = $mysqli->query("SHOW TABLES;");
echo $res->num_rows;
?>