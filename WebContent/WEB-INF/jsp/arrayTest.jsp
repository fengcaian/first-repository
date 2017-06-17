<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script src="js/jquery-1.9.1.js"></script>
<title>数组</title>
<script type="text/javascript">
	$(document).ready(function(){
		$("#btn1").click(function(){
			var arr = [1,2,3];
			arr.push(4);//从尾巴上添加   1，2，3，4   返回值为数组长度为4
			arr.pop();//从尾巴上删除1，2，3   返回值为数组被删除的元素
			arr.unshift(4);//从头部添加4，1，2，3   返回值为数组长度为4
			arr.shift();//从头部删除1，2，3   返回值为数组被删除的元素
			/* alert(arr); */
			var arr2 = ["a","b","c","d","e","f","i"];
			var slice = arr2.slice(2, 5);//包含start,不包含end元素   c,d,e
			/* alert(slice+"----"+arr2); */
			/* arr2.splice(2,2,"kkk");//三个参数的意义是：从indexd的位置开始算起howmany个元素用element1来替换 */
			arr2.splice(2,1);//这相当于第三个参数为空，从第二个位置开始，将下一个元素用空替换（相当于删除下一个位置上的那个元素）
			/* alert(window.outerHeight+"------"+window.outerWidth); */
			/* document.write($("#btn1").parent()[0].tagName); */
			/* var ss = Math.floor(1.1); */
			var ss = "\ua341";
			var i=3;
			switch (i){
			case 2:
				alert(2);
				break;
			case 3:
				alert(4);
				break;
			}
			for(ss in $("#btn1")){
			}
			/* alert(ss); */
		});
		
		var first_name = "sf";
	});
	
	$().ready(function(){
		var arr = function(a,b){
			
		}
		$("#btn2").click(function(){
			alert(arr2.key(3333)+"---"+arr2.value);
		});
		
		var arr2 = {
				value:2,
				key:function(a){//现在function是一个方法
					return this.value+a;//this指向的是arr2
				}
		}
		$("#btn3").click(function(){
			var a1 = function(){
				var that = this;
				var h = function(){
					alert("that="+that+"--this="+this);
				};
				h();
			};
			a1();
			alert("ssss="+ssss);
		});
		$("#btn4").click(function(){
			alert(this.tagName);
		});
		
		
		var dd = function(name){
			this.name=name;
			alert(this.name+"--"+window.name);//二者相同
			alert("dd.this="+this);
		}
		dd(112);//这种函数的用法，this指向的是window
		var ddd = new dd(11111111);//这是当作构造函数使用，这种用法this指向的是ddd
		dd.method(1,2);
		/* alert(ddd.name); */
	});
	
	
	
	
	Function.prototype.method = function(name,func){
		this.prototype[name] = func;
		this.prototype[func] = 11;
		alert("prototype");
		alert("this.prototype[name]="+this.prototype[name]+"--"+this);
		return this;
	};
	Number.method('integer',function(){
		return Math[this < 0 ? 'ceil' : 'floor'](this);//this就是调用integer()的对象，即（-10/3）
	});//Math['ceil'](1.1) == Math.ceil(1)
	document.write((-10/3).integer());
	
	Function.prototype.method2 = function(name1,func1){
		alert("name1="+name1);
	}
	
	
	var a=4;
	$(function(){
		var a=1111;
		alert(a);//1111
	});
	var a=2;
	var a=66;
	function tt(){
		this.ssss=333333;
		alert(this);//object Window
		alert(this.a);//66
		this.ab=ssss;//创建了一个全局变量ab
		alert("this.ab="+this.ab);
	}
	$().ready(function(){
		/* var t = new tt();
		alert("t.ab="+t.ab); */
	});
	$().ready(function(){//声明在函数体内部的函数，其里面的this指向的是全局对象
		var point = { //如果想在moveX和moveY中使用指向point的this对象，可以在moveTo里面获得this，再在moveX和moveY中使用，例子见例1
		 x : 0, 
		 y : 0,
		 moveTo : function(x, y) { 
		     // 内部函数
		    var moveX = function(x) { 
		    	this.x = x;//this 绑定到了哪里？  指向全局对象
		    }; 
		    // 内部函数
		    var moveY = function(y) { 
		    	this.y = y;//this 绑定到了哪里？
		    }; 
		    moveX(x); 
		    moveY(y); 
		    },
		 }; 
		 point.moveTo(1, 1); 
		 console.log("point.x="+point.x); //==>0 
		 console.log("point.y="+point.y); //==>0 
		 console.log("x="+x); //==>1 
		 console.log("y="+y); //==>1
	});
	$().ready(function(){//例1
		var point = { 
				 x : 0, 
				 y : 0, 
				 moveTo : function(x, y) { 
				      var that = this; //这个this指向的是point对象，即that就是point对象
				     // 内部函数
				     var moveX = function(x) { 
				     that.x = x; 
				     }; 
				     // 内部函数
				     var moveY = function(y) { 
				     that.y = y; 
				     };
				     moveX(x); 
				     moveY(y); 
				     }
				 }; 
				 point.moveTo(1, 1); 
				 point.x; //==>1 
				 point.y; //==>1
	});
	function ttt(){
		this.asasasass=1;//会创建一个全局对象asasasass
		alert(this);
		var l=0;
		this.fun = function(){//(如果是别的方法直接调用，但是如果是ttt作为对象被作为构造函数使用，则不是这样)这个fun不是ttt对象的方法，是window的方法，如果用ttt.fun()会提示未定义，用this.fun则没问题
			this.asasasass = 0000;
			alert("l="+this.l+"----this="+this);//(如果是别的方法直接调用，但是如果是ttt作为对象被作为构造函数使用，则不是这样)l=undefined,this=window
		}
	}
	function tttt(){
		/* this.fun();
		alert(this.asasasass); */
		
		var t1 = new ttt();//这样使用的话ttt里面的this就指的是t1
		t1.fun();
		alert("t1.l="+t1.l);
		
	}
	$().ready(function(){
		$("#btn7").click(function(){
			alert(this.tagName);
		});
		$("#btn8").click(function(){
			argumentTest(1,2,3,4,5,6);
		});
	});
	function argumentTest(){
		var sum = 0;
		for(var i=0;i<arguments.length;i++){
			sum += arguments[i];
		}
		alert(sum+"---length="+arguments.length);
	}
</script>
</head>
<body>
<div>
	<input id="btn1" type="button" value="数组的方法">
	<input id="btn2" type="button" value="函数">
	<input id="btn3" type="button" value="函数3">
	<input id="btn4" type="button" value="thisss" onclick="tt()">
	<input id="btn5" type="button" value="thissss" onclick="ttt()">
	<input id="btn6" type="button" value="ceshi" onclick="tttt()">
	<input id="btn7" type="button" value="ceshii">
	<input id="btn8" type="button" value="arguments">
	
</div>


</body>
</html>