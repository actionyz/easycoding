<?
# Mainly devided into two aspects, one is the normal functions,another is self functions
?>
<?php
# @length
strlen($str) # string len
count() or sizeof() # array len

# @substr

echo substr("123456",0,2),substr("123456",0,-1);# parameters (strings,start,length) is length is minus it mines that start t end 

# @glob
glob('*.php');#param (pattern) function which is to list all files pattern matched

# @strpos
strpos('asd','sd')#param(str,needle) the 'sd' first came out 

# @preg
preg_match('/^fg/', 'asdasdfg' , $matches, PREG_OFFSET_CAPTURE);

# @php://

# @array_map

# @array
$arry = [] 
$arrayName = array('' => , );#init
$arry[] = 1 #add
array_keys()#return all the keys or a subset of the keys of an array

# @path
$path_parts = pathinfo('/www/htdocs/inc/lib.inc.php');
echo $path_parts['dirname'], "\n";#/www/htdocs/inc
echo $path_parts['basename'], "\n";#lib.inc.php
echo $path_parts['extension'], "\n";#php
echo $path_parts['filename'], "\n"; #lib.inc
# @server
#test url:     http://localhost/blog/testurl.php?id=5
echo $_SERVER['HTTP_HOST']."<br>"; #localhost
echo $_SERVER['PHP_SELF']."<br>"; #/blog/testurl.php 
echo $_SERVER["QUERY_STRING"]."<br>"; #id=5
echo $_SERVER['REQUEST_URI']# /blog/testurl.php?id=5
echo $_SERVER["SERVER_PORT"]#80 port 
# @json
json_encode($arr) # change array to json strings
# @filter
file=php://filter/read=convert.base64-encode/resource=index.php 
# @file
file_put_contents("test.txt", "This is another something.", FILE_APPEND);# file append
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