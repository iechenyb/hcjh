<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String pushUrl = "http://101.200.63.13:6677";
%>
<!DOCTYPE html>
<html ng-app="app">
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
	background-color: green;
}
a{
text-decoration:none;
display:block;
position:'';
left:12px;
}
a:hover{
color:#4828C7;
font-weight:bold;
background:#DBD5F7;
 border: 2px solid #4D2BD5;
 -moz-border-radius: 15px; 
 -webkit-border-radius: 15px; 
}
</style>
</head>
<body ng-controller="list">
<font size=5><b>最新电影</b></font>
	<div ng-repeat="x in movies|filter">
		<a href="https://api.47ks.com/webcloud/?v={{x.url}}" target='center'><b>{{$index+1}} {{x.name}}<b></a>
	</div>
</body>
<script>
		var app = angular.module('app',[]);
		app.controller('list',main);
		function main($scope,$q,$http){
			var socket =  io.connect('<%=pushUrl%>');
			socket.on("getVipMovies", function(data){
				$scope.$apply(function(){
					$scope.movies=data;
				});
			}); 
			socket.emit("getmsg","{'cmd':'getVipMovies'}", function(data){
				$scope.movies=data;
			}); 
			/* socket.on("getVipVideos", function(data){
				  $scope.$apply(function(){
					  $scope.vedios=data;
				}); 
			}); 
			socket.emit("getmsg","{'cmd':'getVipVideos'}", function(data){
				$scope.vedios=data;
			});   */
		}
		document.onkeydown=function(e){
			var currKey=0,evt = e||window.event;
			curKey=evt.keyCode||evt.which||evt.charCode;
			if(currKey==123){
				window.event.cancelBubble=true;
				window.event.returnValue=false;
			}
		}
	</script>
</html>
