<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
	String path = application.getRealPath(request.getRequestURI());
	String basePath = "http://" + request.getServerName() + ":" + request.getServerPort()
			+ request.getContextPath() + "/";
%>
<!DOCTYPE html>
<html lang="en" ng-app="app">
<head>
<meta charset="UTF-8">
<title>美金娱乐在线计划</title>
<script src="cdn/angular.min.js"></script>
<link rel="stylesheet" href="cdn/amazeui.min.css" />
<link rel="shortcut icon" href="img/favicon.ico" />
<style type="text/css">
.article-column1 {
    width: 360px;
    float: left;
    padding-bottom: 0px;
    font-size: 18px;
    color: #FFF;
    border-bottom: 1px solid #F5F2F2;
    margin-bottom: 0px;
    text-align:left;
}
ul[name='wt'] li{
list-style:none;
}
</style>
</head>
<body ng-controller="controller">
	<div class="am-g"
		style="height: 60px; border: 0px solid red; background: #21263C;">
		<div class="am-u-sm-1">&nbsp;</div>
		<div class="am-u-sm-2">
			<a href="index.jsp"><img src="img/logo.jpg" width="60px"
				height="60px"></img></a>
		</div>
		<div class="am-u-sm-9">&nbsp;</div>
	</div>
	<div class="am-g" style="height: 280px; border: 0px solid red;margin-top:2px;">
		<div class="am-u-sm-12">
			<div class="am-slider am-slider-default" data-am-flexslider
				id="demo-slider-0">
				<ul class="am-slides">
					<li><img src="img/gg-1.jpg"
						height="280px" width="120%" /></li>
					<li><img src="img/gg-2.jpg"
						height="280px" width="120%" /></li>
				</ul>
			</div>
		</div>
	</div>
	<hr>
	<div class="am-g" style="height: 300px; border: 0x solid red;">
		<div class="am-u-sm-3">&nbsp;</div>
		<div class="am-u-sm-3">
			<a href="mjjh.jsp"><img src="img/cqjh.jpg" /></a>
		</div>
		<div class="am-u-sm-3">
			<img src="img/more.jpg" />
		</div>
		<div class="am-u-sm-3">&nbsp;</div>
	</div>
	<hr>
	<div class="am-g" style="height: 200px; border: 0px solid red;">
		<div class="am-u-sm-4">
			<img src="img/1.jpg" width=600px height=200px />
		</div>
		<div class="am-u-sm-4">
			<img src="img/2.jpg" width=600px height=200px />
		</div>
		<div class="am-u-sm-4">
			<img src="img/3.jpg" width=600px height=200px />
		</div>
	</div>
	<div class="am-g"
		style="height: 200px; border: 0px solid red; text-align: left;">
		<div class="am-u-sm-1">&nbsp;</div>
		<div class="am-u-sm-3">
			<ul name='wt'>关于如何使用
				<li><a href="#">【使用软件】软件如何设置？</a></li>
				<li><a href="#">【使用网页】网页如何观看计划？</a></li>
				<li><a href="#">【综合使用】如何找到自己适合自己的使用途径和方法？</a></li>
			</ul>
		</div>
		<div class="am-u-sm-3">
			<ul name="wt">技术文章阅读
				<li><a href="#">【技术文章】与.NET有关的几个技术名词</a></li>
				<li><a href="#">【技术文章】如何用C#控制服务组的停止与启动？</a></li>
				<li><a href="#">【技术文章】微软重拳出击开源技术！</a></li>
			</ul>
		</div>
		<div class="am-u-sm-3">
			<ul name="wt">初用问题思考
				<li><a href="#">【学习选择】我是否适合学习软件开发技术？</a></li>
				<li><a href="#">【语言选择】初学者如何选择第一门开发语言？</a></li>
				<li><a href="#">【常见问题】初学者要分清楚这几个问题再学习</a></li>
			</ul>
		</div>
		<div class="am-u-sm-1">&nbsp;</div>
	</div>
	<script src="cdn/jquery.min.js"></script>
	<script>
		var app = angular.module('app', []);
		app.controller('controller', main);
		function main($scope, $q, $http) {
			$scope.CodeNumber = 1;
			$scope.path = $("#basePath").val();
			$scope.loadData = function() {
				var form = new FormData($('#dataForm')[0]);
				$.ajax({
					url : $scope.path + "getData.php",
					processData : false,
					contentType : false,
					async : true,
					type : "post",
					data : form,
					dataType : 'json',
					success : function(data) {
						$('#content').html(data.rs);
					},
					complete : function(data) {

					}
				});
			}
			$scope.map = {
				0 : '台湾5分计划',
				1 : '官方重庆计划',
				2 : '河内5分计划',
				3 : '泰国5分计划',
				4 : '西贡5分计划'
			};
			$scope.mkey = 2;
			$
					.ajax({
						url : $scope.path + "condition.php",
						contentType : "application/json",
						async : false,
						data : '',
						dataType : 'json',
						success : function(data) {
							$scope.code = data.code;
							$scope.planType = data.planType;
							$scope.plans = data.plans;
							$("#dmgs").find("option[value='1']").attr(
									"selected", true);
						},
						complete : function(data) {

						}
					});

		}
	</script>
	<script type="text/javascript"
		src="http://cdn.amazeui.org/amazeui/2.7.2/js/amazeui.min.js"></script>
</body>
</html>
