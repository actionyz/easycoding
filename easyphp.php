<?
# Mainly devided into two aspects, one is the normal functions,another is self functions
?>



<?php 
	# [mysql]
	
?>

<?php 
	# [mysqli]
	error_reporting(1);
	$conn=mysqli_connect('127.0.0.1','root','111111','bas_db');
	if (!$conn) {   
	die('Could not connect to MySQL: ' . mysqli_error());   
	} 
	$conn->query("SET NAMES 'utf8'");
	// mysql_query("set character set 'utf8'");//读库 
	// mysql_query("set names 'utf8'");//写库 
	$result = mysqli_query($conn,$sql);
	$result = $conn->query("SELECT * FROM `user` WHERE username = '$username'");
	$row = $result->fetch_assoc();
	$row = @mysqli_fetch_assoc($result);
	
?>