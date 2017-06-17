<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="zh-cn" lang="zh-cn">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script src="js/jquery-1.9.1.js"></script>
<title>springMVC</title>
</head>
<script type="text/javascript">
	function submit(){
		$("#dataForm").submit();
		alert("这是index.jsp");
	}
	$(document).ready(function(){
		$("#cBtn").click(function (){
			var td1 = '<td>'+11+'</td>';
			var td2 = '<td>'+22+'</td>';
			var td3 = '<td>'+33+'</td>';
			var td4 = '<td>'+44+'</td>';
			var td5 = '<td>'+55+'</td>';
			$("#tab1").append("<tr>"+ td1 + td2 + td3 + td4 + td5 +"</tr>");
		});
		
		$("#cBtn11").click(function (){
			var n=2;
			function b(x){
				n=x;
				return n;
			}
			b(3);
			alert(n);
		});
		
		$("#btnSubmit").click(function (){
			//获取当前网址，如： http://localhost:8083/uimcardprj/share/meun.jsp
			var curWwwPath=window.document.location.href;
			//获取主机地址之后的目录，如： uimcardprj/share/meun.jsp
		    var pathName=window.document.location.pathname;
		    var pos=curWwwPath.indexOf(pathName);
		    //获取主机地址，如： http://localhost:8083
		    var localhostPath=curWwwPath.substring(0,pos);
		    //获取带"/"的项目名，如：/uimcardprj
		    var projectName=pathName.substring(0,pathName.substr(1).indexOf('/')+1);
		    var path = localhostPath+projectName;
		    
			var url=path+"/index.do";
			alert(url);
			location.href=url;
		});
		
		
		
	});
</script>
<body>
	<table id="tab1" style="height:200px;width: 85%;border: 1px;border-color: blue;">
		<tr>
			<td style="border: 1px;border-color: blue;">1</td>
			<td>2</td>
			<td>3</td>
			<td>4</td>
			<td>5</td>
		</tr>
		<tr>
			<td style="border: 1px;border-color: blue;">1</td>
			<td>2</td>
			<td>3</td>
			<td>4</td>
			<td>5</td>
		</tr>
	</table>
	<div style="background-color: blue;width: 400px;height: 300px">
		<button style="height: 50px;width: 80px" onclick="submit()">按钮</button>
		<input type="file">
	</div>
	<form id="dataForm" action="saveFormOk.do" method="post">
		<table>
			<tr>
				<td>名字：</td>
				<td>
					<input type="text" name="user.userName">
				</td>
				<td>性别：</td>
				<td>
					<input type="text" name="student.userName">
				</td>
			</tr>
			<tr>
				<td>年龄：</td>
				<td>
					<input type="text" name="user.password">
				</td>
				<td>地址：</td>
				<td>
					<input type="text" name="user.address">
				</td>
			</tr>
		</table>
	</form>
	<!-- <div style="background:linear-gradient(top, #fdbc01 0%, #f19c11 100%);width:400px;height:600px">
		你好
		<span style="background: -moz-linear-gradient( top,#ccc,#000)">wohao</span>
	</div> -->
	<div>
		<button id="cBtn" name="cBtn" value="click">点击</button>
	</div>
	
	<div>
		<button id="cBtn11" name="cBtn" value="click">点击11</button>
	</div>
	<div>
		<button id="btnSubmit" name="cBtn" value="click">提交表单</button>
	</div>
</body>
</html>