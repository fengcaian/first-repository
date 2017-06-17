<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>表单验证</title>
<script src="js/jquery-1.9.1.js"></script>
<script src="js/jquery.validate.js"></script>
<script type="text/javascript">
	$(document).ready(function (){
		
		$("#dataForm").validate({
			rules:{
				name:{
					required:true,
					maxlength:16,
					minlength:4
				},
				sex:{
					required:true,
					maxlength:2,
					minlength:2
				},
				idCard:{
					required:true,
					maxlength:18,
					minlength:18,
					idIdCardNo:"#idCard"
				},
				password:{
					required:true,
					maxlength:18,
					minlength:8,
					equalTo:"#password"
				},
				diqu:{
					required:true
				}
			},
			messages:{
				name:{
					required:"用户名不能为空！",
					maxlength:"最长16位！",
					minlength:"最短4位！",
					remote:"该用户名已被占用！"
				},
				sex:{
					required:"性别不能为空！",
				},
				idCard:{
					required:"身份证号不能为空！",
					maxlength:"身份证为18位！",
					minlength:"身份证为18位！"
				},
				password:{
					required:"密码不能为空！",
					maxlength:"密码最长为18位！",
					minlength:"密码最短为8位",
					notEqualTo:"用户名和密码不能相同！"
				},
				diqu:{
					required:"地区不能为空"
				}
			},
			errorPlacement: function (error, element) {  
	            error.appendTo(element.parent());  
	        },   
	        submitHandler:function(form){  
	            $("#dataForm").submit();
	        	alert("1111");
	        },  
	        errorClass: "error",  
	        focusCleanup: true, //被验证的元素获得焦点时移除错误信息  
	        success: function (label) { 
	            label.html("<span style=\"color:green\">填写正确！</span>").addClass("success");  
	        }   
		});
		
		 /* var str = 'rain-man';
		    setTimeout(
		        function(){ alert(str); } //这是一个匿名函数
		    , 2000); */
		
	});
	
	// 身份证号码验证（加强验证）  
	jQuery.validator.addMethod("isIdCardNo", function (value, element) {  
		alert("开始校验");
	    return this.optional(element) || /^[1-9]\d{7}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}$/.test(value) || /^[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])((\d{4})|\d{3}[A-Z])$/.test(value);  
	}, "请正确输入您的身份证号码");  
	// 判断两个值是否相等  
	jQuery.validator.addMethod("notEqualTo", function (value, element, param) {  
	    return value != $(param).val();  
	}, $.validator.format("两次输入不能相同!"));
	
	function ceshi(){
		var a = "123asfd;asdfa;asdf;asd";
		var ss = a.replace(";", ":");
		var index = a.indexOf(";");
		var test = a.match(";");
		var cc = ceshi2(2,1);
		/* alert("ss="+ss+"--index="+index+"--cc="+cc); */
		alert("test="+test);
	}
	
	function ceshi2(a,b){
		if(a>b){
			return a;
		}else{
			return b;
		}
	}
	
	function box(){
		var arr = [];
		for(var i=0;i<5;i++){
			arr[i] = function(){
				return i;
			}
		}
		alert("arr="+arr[1]);
	}
	
	var name2 = function(){
		alert("we");
	}
	
	var name3 = function(){
		var arr = [];
		for(var i=0;i<4;i++){
			arr[i] = (function (num){//自执行匿名函数
				return num;
			})(i);
		}
		return arr;
	}
	
	function ceshi3(){
		/* name2(); */
		var va = name3();
		var va2 = (function(){
			return 3;
		})();
		alert("va2="+va2); 
		/* alert(ceshi4()); */
	}
	function ceshi4(){
		/* setTimeout("alert('1')",1000);
		return (function(){
			return 2;
		})(); */
		checkClosure();
	}
	
	function checkClosure(){
	    var str = 'rain-man';
	    setTimeout(
	        function(){ alert(str); } //这是一个匿名函数
	    , 2000);
	}
	
	function ceshi5(){
		var a = {pr:1000};
		/* a.pro = 11; */
		/* a.pro = { a:100 };
		alert(a.pro.a); */
	}
	
	function ceshi6(){
	    var obj = {};
	    function inner(){ 
	        return 9;
	    }
	    obj.inner = inner();
	}
	
	function ceshi8(){
		var oEvent = {};
		(function(){ 
		    var addEvent = function(){
		    	alert("add");
		    };
		    function removeEvent(){
		    	alert("remove");
		    }
		    oEvent.addEvent = addEvent();
		    /* oEvent.removeEvent = removeEvent(); */
		})();
		oEvent.addEvent();
		/* oEvent.removeEvent(); */
	}
	function ceshi9(){
		var outer = null;
		(function(){
		    var one = 1;
		    function inner (){
		        one += 1;
		        alert(one);
		    }
		    outer = inner;
		})();
		outer();    //2
		outer();    //3
		outer();    //4
	}
	
	function ceshi10(){
		var lists = document.getElementsByTagName("li");
		for(var i=0;i<lists.length;i++){
			lists[i].onmouseover = function(){
				alert(i);
			};
		}
	}
	
	function ceshi11(){
		var lists = document.getElementsByTagName("li");
		for(var i=0;i<lists.length;i++){
			/* lists[i].onmouseover = (function(index){
				alert(index);
			})(i); */
			
			
			(function(index){
		        lists[ index ].onmouseover = function(){
		            alert(index);    
		        };                    
		    })(i);
			
		}
	}
	function ceshi13(){
		ceshi12(111);
	}
	function ceshi12(a,b){
		alert(a+":"+b);
	}
	function ceshi12(a){
		alert("一个参数");
		alert("a="+a);
	}
	function ceshi12(){
		alert("无参");
	}
	
	function ceshi14(){
		var date = new Date();
		/* alert(date.getFullYear()+"-"+date.getMonth()+"-"+date.getDate()+" "+date.getHours()+":"+date.getMinutes()+" "+date.getSeconds());
		*/
		var str = new String();
		str = "123sqwersdd1dd13fg3";
		var v = str.match("ss");
		var vs = str.slice("2", "s");
		var st = str.substr(2,5);
		var sts = str.substring(2,5);
		var number = str.replace(/[^0-9]+/g, '');
		var letter = str.replace(/[^a-z]+/g,'');
		var bl = str.toUpperCase();//变成大写
		bl = bl.toLowerCase();//变成小写/
		alert(bl);
		var array = new Array();
		for(var i=0;i<10;i++){
			array[i] = (function(index){
				return index;
			})(i);
		}
		/* alert("before="+array); */
		array.splice(3, 0,"i,j,j,f,d");//可以用于删除，替换，添加元素
		/* alert("behind="+array+"--"+array[3]);//array[3]=i,j,j,f,d */
	}
	
	function snake(){
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
	    
		var url=path+"/snake.do";
		alert(url);
		location.href=url;
	}
	function regex(){
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
	    
		var url=path+"/regex.do";
		alert(url);
		location.href=url;
	}
	
	function getPath(){
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
	    return path;
	}
	function tableSort(){
		var path = getPath();
		var url=path+"/tableSort.do";
		alert(url);
		location.href=url;
	}
	
	function arrayTest(){
		var path = getPath();
		var url = path+"/arrayTest.do";
		location.href = url;
	}
	
	function fun(){
		var path = getPath();
		var url = path+"/funcTest.do";
		location.href = url;
	}
	
	function cube(){
		var path = getPath();
		var url = path+"/drawCube.do";
		location.href=url;
	}
	
	function tableSlant(){
		var path = getPath();
		var url = path+"/draw_table_slant.do";
		location.href=url;
	}
	
	function tableSlantFun2(){
		var path = getPath();
		var url = path+"/draw_table_slant_fun2.do";
		location.href=url;
	}
	
	function jsonpTest(){
		var path = getPath();
		var url = path+"/jsonp.do";
		location.href=url;
	}
	
	function ceshi15(index){
		var i = index;
		alert(i);
		i++;
		if(i<4){
			setTimeout(function(){
				ceshi15(1);
			},1000);
		}
		
	}

	(function(index){
		function c(index){
			alert(index);
			if(index++<4){
				setTimeout(function (){
					c(1);
				},(1000));
			}
		}
		
	})(0);
	 
	function ceshi16(){
		var i=0;
			setInterval(function(){
				if(i<2){
					alert(i);
					i++;
				}
			},1000);
		
		/* for(var i=0;i<4;i++){
			setTimeout(ceshi16(),1000);
		} */
	}
	

</script>
</head>
<body>
	<div>
		<form id="dataForm" action="saveFormOk.do" method="post">
		<table>
			<tr>
				<th>姓名：</th>
				<td>
					<input id="name" name="name">
				</td>
				<th>性别：</th>
				<td>
					<input id="sex" name="sex">
				</td>
			</tr>
			<tr>
				<th>年龄：</th>
				<td>
					<input id="age" name="age">
				</td>
				<th>地址：</th>
				<td>
					<input id="address" name="address">
				</td>
			</tr>
			<tr>
				<th>身份证号：</th>
				<td>
					<input id="idCard" name="idCard">
				</td>
				<th>职业：</th>
				<td>
					<input id="career" name="career">
				</td>
			</tr>
			<tr>
				<th>密码：</th>
				<td>
					<input type="password" id="password" name="password">
				</td>
				<th>地区：</th>
				<td>
					<select id="diqu" name="diqu">
						<option selected="selected" value='' >请选择</option>
				        <option value="00">上海</option>
				        <option value="01">江苏</option>
					</select>
				</td>
			</tr>
			<tr>
				
			</tr>
		</table>
		<input id="btnSubmit" type="submit" value="提交按钮"/>
		</form>
		
		<input id="btn1" type="button" value="ceshi" onclick="ceshi()"/>
		<input id="btn2" type="button" value="box" onclick="box()"/>
		<input id="btn3" type="button" value="ceshi3" onclick="ceshi15()"/>
		<input id="btn4" type="button" value="贪吃蛇" onclick="snake()"/>
		<input id="btn5" type="button" value="正则表达式" onclick="regex()"/>
		<input id="btn6" type="button" value="表格排序" onclick="tableSort()"/>
		<input id="btn7" type="button" value="数组" onclick="arrayTest()"/>
		<input id="btn8" type="button" value="方法" onclick="fun()"/>
		<input id="btn9" type="button" value="立方体" onclick="cube()"/>
		<input id="btn10" type="button" value="table斜线" onclick="tableSlant()"/>
		<input id="btn11" type="button" value="table斜线的第二种方法" onclick="tableSlantFun2()"/>
		<input id="btn11" type="button" value="JSONP" onclick="jsonpTest()"/>
	</div>
	<div>
		<table>
			<tr>
				<td>1</td>
				<td>2</td>
				<td>3</td>
				<td>4</td>
			</tr>
			<tr>
				<td>1</td>
				<td>2</td>
				<td>3</td>
				<td>4</td>
			</tr>
			<tr>
				<td>1</td>
				<td>2</td>
				<td>3</td>
				<td>4</td>
			</tr>
			<tr>
				<td>1</td>
				<td>2</td>
				<td>3</td>
				<td>4</td>
			</tr>
		</table>
		<ul>
			<li style="background-color: red">one</li>
			<li style="background-color: green">two</li>
			<li style="background-color: blue">three</li>
			<li style="background-color: grey">four</li>
		</ul>
	</div>
</body>
</html>