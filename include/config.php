<?php
$con=mysqli_connect("4.tcp.eu.ngrok.io","kali-server","Kali User 407","myhmsdb", "10876");
// Check connection
if (mysqli_connect_errno())
{
 echo "Failed to connect to MySQL: " . mysqli_connect_error();
}
?>