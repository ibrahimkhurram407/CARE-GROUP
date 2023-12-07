<?php
$con=mysqli_connect("5.tcp.eu.ngrok.io","kali-server","Kali User 407","myhmsdb", "16820");
// Check connection
if (mysqli_connect_errno())
{
 echo "Failed to connect to MySQL: " . mysqli_connect_error();
}
?>