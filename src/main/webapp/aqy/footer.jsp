<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String pushUrl = "http://192.168.16.211:6677";
%>
<!DOCTYPE html>
<html>
<head>
    <title>netty-socketio-case</title>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8"/>
	<script src="socket.io.js"></script>
	<script src="angular-1.0.1.min.js"></script>
    <script src="jquery-1.7.2.min.js"></script>
	<link href="common.css" rel='stylesheet' type='text/css' />
</head>
<body>
<center><font size=20 color=blue> ȫ��vip,��ѹۿ���</font><font size=20 color=blue> ���λ���⣬��ӭ���磡</font></center>
</body>
</html>
