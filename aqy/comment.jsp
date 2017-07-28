<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String pushUrl = "http://101.200.63.13:6677";
%>
<!DOCTYPE html>
<html ng-app="app1">
<head>
    <title></title>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8"/>
	<script src="socket.io.js"></script>
    <script src="jquery-1.7.2.min.js"></script>
    <script src="angular-1.0.1.min.js"></script>
	<link href="common.css" rel='stylesheet' type='text/css' />
		<style>
frame
{
	border-width:thin medium thick;
}
a{
text-decoration:none;
display:block;
position:'';
left:12px;
}
a:hover{
color:red;
font-weight:bold;
background:#DBD5F7;
 border: 2px solid green;
 -moz-border-radius: 15px; 
 -webkit-border-radius: 15px; 
}
</style>
</head>
<body ng-controller="list1">
<font size=5><b>最新电视剧</b></font><a href="comment.jsp">刷新电视剧列表</a>
	<div ng-repeat="x in movies|filter">
		<span ng-click="getInfo(x)"><font color=green> <b>{{$index+1}} {{x.name}}</b></font></span>
	</div>
	<div ng-repeat="x in infors|filter">
		 <a href="https://api.47ks.com/webcloud/?v={{x.url}}" target='center'><b>{{$index+1}} {{x.name}}</b></a>
	</div>
</body>
<script>
		var app = angular.module('app1',[]);
		app.controller('list1',main);
		function main($scope,$q,$http){
			 var socket =  io.connect('<%=pushUrl%>');
			  socket.on("getVipVideos", function(data){
				  $scope.$apply(function(){
					$scope.movies=data;
				}); 
			}); 
			 socket.emit("getmsg","{'cmd':'getVipVideos'}", function(data){
				$scope.movies=data;
			});  
			 socket.on("getVipVideosInfo", function(data){
				  $scope.$apply(function(){
					$scope.infors=data;
				}); 
			}); 
			 $scope.getInfo=function(x){
			   socket.emit("getmsg","{'cmd':'getVipVideosInfo','url':'"+x.url+"'}", function(data){
						$scope.infors=data;
				});  
			 }
		}
		/* document.onkeydown=function(e){
			var currKey=0,evt = e||window.event;
			curKey=evt.keyCode||evt.which||evt.charCode;
			if(currKey==123){
				window.event.cancelBubble=true;
				window.event.returnValue=false;
			}
		} */
	</script>
</html>
