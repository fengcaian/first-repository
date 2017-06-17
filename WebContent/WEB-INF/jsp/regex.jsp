<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script src="js/jquery-1.9.1.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
	$(document).ready(function(){
		
		$("#btn1").click(function(){
			/* var regex = /^[0-9]*$/; */
			var regex = /^\d*$/;//  '/^[0-9]*$/'等价于'/^\d*$/'
			var regex1 = $("#regex1").val();
			
			if(regex.test(regex1)){
				alert("匹配成功");
			}else{
				alert("验证失败");
			}
		});
		
		$("#btn2").click(function(){
			var canvas = $("#canvas")[0];
			var ctx = canvas.getContext('2d');
			ctx.fillStyle="#ff0000";
			ctx.fillRect(100,100,100,100);
		});
		
		$("#btn3").click(function(){
			extendClass.prototype = new baseClass();
			var instance = new extendClass();
			instance.showMsg();
			var baseinstance = new baseClass();
			baseinstance.showMsg().call(instance);
		});
		
		$("#btn4").click(function(){
			var regex = /[0]+/;//  /[0]+/匹配0至少1次  /[0]*/匹配0任意次，可以是0次，也会返回true(任意位置的0)
			var value = $("#regex1").val();
			if(regex.test(value)){
				alert("匹配成功");
			}else{
				alert("匹配失败");
			}
		});
		$("#btn5").click(function(){
			var regex = /ab?c/;//b?作为一个整体，b不是必须被匹配到才返回true,比如ac和abc都返回true
			var value = $("#regex1").val();
			if(regex.test(value)){
				alert("匹配成功");
			}else{
				alert("匹配失败");
			}
		});
		$("#btn6").click(function(){
			var text = $("#p1").html();
			var word="七夕";
			//text = text.replace(new RegExp("[在这个中括号里面写正则表达式]","ig"),"<span style='font-size: 20px;color: pink'>"+word+"</span>");
			text = text.replace(new RegExp("("+word+")","ig"),"<span style='font-size: 20px;color: pink'>"+word+"</span>");
			$("#p1")[0].innerHTML = text;
		});
		$("#btn7").click(function(){
			var text = $("#p2").html();
			var regex = /\d*/g;
			var regexWord = /[a-z]*/g;
			var word="七夕";
			var match = text.match(regexWord);
			text = text.replace(new RegExp("[a(?=s)]","g"),"<span style='font-size: 20px;color: pink'>"+word+"</span>");
			alert(match);
			$("#p2")[0].innerHTML = text;
		});
		$("#btn8").click(function(){
			var orderSettings = {
					ValAttr: false, //排序列的取值属性,默认为：innerText
		            DataType: "string", //排序列的值类型(可取值：int|float|date|string)
		            OnClick: null, //(点击)排序时触发的方法
		            Desc: true, //(是否是降序)排序方式，默认为：降序
		            Toggle: true, //切换排序方式
		            DefaultOrder: false //是否是默认的排序方式
			};
			var options = {
					a:"abcd",
			};
			
			$.extend(orderSettings, options);//jquery.extends()方法将二者合二为一，相当于在前者的里面将后者的参数/属性添加进去
			$.extend(orderSettings, {a:"qq"});//同名的话。后者覆盖前者
			alert(orderSettings.a);
			var i = 123;
			alert(i || 0);//结果为123
		});
		$("#btn9").click(function(){
			var s = null;
			alert(s*1);
			
		});
		
	});
	
	function baseClass(){
		this.showMsg = function(){
			alert("baseClass::showMsg");
		}
	}
	
	function extendClass(){
		this.showMsg = function(){
			alert("extendClass::showMsg");
		}
	}
	
	
</script>
</head>
<body>
<div>
	<input type="text" id="regex1" name="regex1" value=""/>
</div>
<div>
	<input type="button" id="btn1" value="验证"/>
</div>
<canvas id="canvas"></canvas>
<div>
	<input type="button" id="btn2" value="画图"/>
</div>
<div>
	<input type="button" id="btn3" value="原型"/>
</div>
<div>
	<input type="button" id="btn4" value="正则2"/>
</div>
<div>
	<input type="button" id="btn5" value="正则3"/>
</div>
<div>
	<p id="p1">昨天是七夕节，今天是巴西节，come on!七夕</p>
</div>
<div>
	<input type="button" id="btn6" value="改变特定字的样式"/>
</div>
<div>
	<p id="p2">asdfasdASFSDFASAasdfasdf234kjh1341AADNFDS1231231sdfasfa</p>
</div>
<div>
	<input type="button" id="btn7" value="字母数字匹配"/>
</div>
<div>
	<input type="button" id="btn8" value="jquery.extend()"/>
</div>
<div>
	<input type="button" id="btn9" value="js验证"/>
</div>
</body>
</html>