<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String pushUrl = "http://192.168.16.211:6677";
%>
<!DOCTYPE html>
<html ng-app="app">
<head>
    <title></title>
	<meta http-equiv="Content-Type" content="text/html;charset=gbk"/>
	<script src="socket.io.js"></script>
    <script src="jquery-1.7.2.min.js"></script>
    <script src="angular-1.0.1.min.js"></script>
	<link href="common.css" rel='stylesheet' type='text/css' />
</head>
<body ng-controller="list">
<div id="container"> 
  <!--<div class="search bar2"> 
 <form>
 <input type="text" id='url' placeholder="请输入您要搜索的内容...">
 <button type="button" value="播放" name="播放" onclick="lookup()">
 </button> </form> 
 </div>
<div class="search bar3"> <form> <input type="text" placeholder="请输入您要搜索的内容...">
 <button type="submit"></button> </form> </div>
 <div class="search bar4"> <form> <input type="text" placeholder="请输入您要搜索的内容...">
 <button type="submit"></button> </form> </div>
 <div class="search bar5"> <form> <input type="text" placeholder="请输入您要搜索的内容...">
 <button type="submit"></button> </form> </div>-->
 <div class="search bar6"> <form> <input type="text" id='url' placeholder="请输入您要搜索的内容(视频地址)...">
 <button type="button" onclick="lookup()"></button> </form> </div>
 <!--<div class="search bar7"> <form> <input type="text" placeholder="请输入您要搜索的内容...">
 <button type="submit"></button> </form> </div>
 <div class="search bar8"> <form> <input type="text" placeholder="请输入您要搜索的内容..."> 
 <button type="submit"></button> </form> </div>-->
 </div>
	<!--<center><input type="text" id='url' style="width:50%;height:10rem;" /></input><input type='button'  style="width:5%;height:10rem;" value="播放" name="播放" onclick="lookup()"/></center>-->
<script>
function lookup(){
   url ='https://api.47ks.com/webcloud/?v='+document.getElementById('url').value;
  document.getElementById('page9090').href=url;
  document.getElementById('page9090').click();
}
</script>
<a target='center' id='page9090'></a>
</body>
</html>
