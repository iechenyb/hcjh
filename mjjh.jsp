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
</head>
<body ng-controller="controller">
	
	<div class="am-g"
		style="height: 60px; border: 0px solid red; background: #21263C">
		<div class="am-u-sm-1">&nbsp;</div>
		<div class="am-u-sm-10">
			<a href="index.jsp" target="_self"><img src="img/logo.jpg"
				width="60px" height="60px"></img></a>
		</div>
		<div class="am-u-sm-1">&nbsp;</div>
	</div>
<hr>
 <div class="am-g" style="height: 280px; border: 0px solid red;">
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

	<form id="dataForm">
		<input type="hidden" value="<%=basePath%>" id='basePath'></input>
		<table class="am-table-bordered am-table am-accordion-bd am-tab-panel">
			<!-- <tr>
            <td colspan="4">
               <span ng-repeat="x in  planType" >
               <span ng-show="x.idx==2">
            	<div class="am-radio"><label><input type="radio" name="Color"  class="am-radio am-radio-inline" value="{{x.idx}}" ng-checked="x.idx==2" />{{x.val}}</div></label></span>
             </span> 
             <input type="radio" name="Color"  class="am-radio am-radio-inline" value="官方重庆计划" ng-checked="true" />官方重庆计划
            </td>
        </tr> -->
			<tr>
				<td colspan="4">
					<div class="am-g">
						<div class="am-u-sm-2" ng-repeat="y in  code">
							<div class="am-radio"><label><input type="radio" name="Radio" class="am-radio am-radio-inline"
								value="{{y.idx}}" ng-checked="y.idx==1" />{{y.val}}&nbsp;&nbsp;&nbsp;&nbsp;</label></div>
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td align="center" colspan=4>
						<input type="radio" name="Color"
							class="am-radio am-radio-inline" value="2"
							ng-checked="true" />官方重庆计划
				 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 定码个数 <select
					name="CodeNumber" style="width: 30%;">
						<option value="1" selected="true">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
						<option value="6">6</option>
						<option value="7">7</option>
						<option value="8">8</option>
						<option value="9">9</option>
				</select> <!--  <select id="dmgs" ng-model="CodeNumber" name="CodeNumber"  style="width:30%;">
                 <option ng-repeat="x in [1,2,3,4,5,6,7,8,9]" value="{{x}}" ng-selected="CodeNumber==x">{{x}}</option>
                </select>   --> <!--   <select ng-model="CodeNumber=1" name="CodeNumber"  style="width:30%;" ng-options="x for x in [1,2,3,4,5,6,7,8,9]"></select> -->
					计划周期 <select name="PlanCycle" style="width: 30%;">
						<option value="1" selected="true">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
						<option value="6">6</option>
						<option value="7">7</option>
						<option value="8">8</option>
						<option value="9">9</option>
				</select>
					<button class="am-btn am-btn-primary" ng-click="loadData();">获取</button><br>
					<button class="am-btn am-btn-primary" id="start" ng-click="startTimer();">开启自动刷新</button>
					<button class="am-btn am-btn-primary" id="stop" ng-click="stopTimer();">停止自动刷新</button>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<div class="am-g">
						<div class="am-u-sm-2" ng-repeat="z in  plans">
							<div class="am-radio"><label><input type="radio" name="MethodId"
								class="am-radio am-radio-inline" value="{{z.idx}}"
								ng-checked="z.idx==1" />{{z.val}}&nbsp;&nbsp;&nbsp;&nbsp;</label></div>
						</div>
					</div>
				</td>
				<td colspan=2><textarea id="content" rows="60" cols="50"></textarea></td>
			</tr>
		</table>
	</form>
	</div>
	<script src="cdn/jquery.min.js"></script>
	<script>
		var app = angular.module('app', []);
		app.controller('controller', main);
		var page ;
		var t1;
		function main($scope, $q, $http) {
			$scope.CodeNumber = 1;
			page = $scope;
			$scope.startTimer=function(){
				t1 = window.setInterval(load,10000); 
				$("#start").attr("disabled",true);
				$("#stop").attr("disabled",false);
				$('#stop').removeAttr("disabled"); 
			}
			$scope.stopTimer=function(){
				window.clearInterval(t1); 
				$("#start").attr("disabled",false);
				$('#start').removeAttr("disabled"); 
				$("#stop").attr("disabled",true);
			}
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
		function load(){
			   var form = new FormData($('#dataForm')[0]);
				$.ajax({
					url : page.path + "getData.php",
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
	</script>
	<script type="text/javascript"
		src="http://cdn.amazeui.org/amazeui/2.7.2/js/amazeui.min.js"></script>
</body>
</html>
