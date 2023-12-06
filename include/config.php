<?php
define('DB_SERVER','172.31.50.253');
define('DB_USER','kali-server');
define('DB_PASS' ,'Kali User 407');
define('DB_NAME', 'hms');
$con = mysqli_connect(DB_SERVER,DB_USER,DB_PASS,DB_NAME);
// Check connection
if (mysqli_connect_errno())
{
 echo "Failed to connect to MySQL: " . mysqli_connect_error();
}
?>