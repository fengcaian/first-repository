<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="js/jquery-1.9.1.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
	/* $().ready(function(){
		Func1();
		var f1 = new Func1();
		var Func2 = Object.create(f1);
		Func1.prototype.move = function(){//Func3没有move()这个方法
			alert("sdfs");
		};
		f1.move();
		var Func3 = function(){
			var x = 1;
			this.y = 2;
			console.log(x);
		};
		
		Function.prototype.move2 = function(){
			alert("asdasda");
		};
		
		var f3 = new Func3();//构造函数生成对象，Func3中的this指的是Func3[object object]
		alert(f3.y);
		Func3.move2();
		Func3();//作为方法辈调用，this指的是window[object window]
		
		
	}); */
	/* function Func1(){
		alert("func1");
	}	
	
	$().ready(function(){
		
	});
	function Circle(r){
		this.r = r;
	}
	Circle.PI = 3.14159;
	Circle.prototype.area = function(){
		return Circle.PI * this.r * this.r;
	};
	var c = new Circle(1.0); */
	/* alert(c.area()); */
	
	
	 /* var dom = function(){
		var name = "default";
		this.sex = "boy";
		this.success = function(){
			alert("success");
		};
	};
	alert(dom.name+"name");//null
	alert(dom.sex);//undefined
	
	var person = function(){
		var name = "xiaoming";
		var sex = "boy";
		return {
			getName:function(){
				return name;
			},
			setName:function(newName){
				name = newName;
			},
			getSex:function(){
				return sex;
			},
			setSex:function(newSex){
				sex = newSex;
			}
		};
	}();//不加括号不执行
	console.log(person.name);
	console.log(person.getName());
	console.log(person.setName("xiaohong"));
	console.log(person.getName());
	
	console.log("--------分割线---------"); */
	
	
	/*
	* 变量提升的例子
	*/
	var scope = "global";
	function scopeTest(){
		console.log(scope);
		var scope = "local";
		
		console.log(scope);
	}
	scopeTest();
	
	/* var foo = 1;
	function hoist(){
		alert(!foo);//true
		if(!foo){
			alert(!foo+"--!!!!");//true
			var foo = 10;	
		}
		alert(foo);//10
	};
	hoist(); */
	
	/* var a = 1;
	function hoist1(){
		a = 10;
		return;
		function hoist2(){}
	}
	hoist1();
	alert("a="+a);//10 */
	
	/* var a = 1; 
	function b() {       	//变量提升机制：如这个例子所示，执行b()的时候，将a作为变量提到最前面的位置（位置1），并且赋值为一个函数，
		//位置1	         	//变量a的声明（注意是声明，不是赋值【这是没有函数的情况下】），然后a=10相当于是给局部变量a进行赋值，这里
		console.log(a);  	//的a=10不再是声明一个全局变量a了，只是对局部变量进行赋值
		a = 10; 			//所以第一个console.log(a)，这里的a指的是a()方法，只有对a进行赋值完成，我们才能拿到
		console.log(a);		//局部变量a
		var a = 11;
		console.log(a);
		return; 
		function a(){
			alert("abc");
		} */
		/* var a = function (){		//这是一个匿名函数，效果和上面的直接声明一个函数不一样，这里的a相当于变量
			alert("abc");
		}; */
	/* } 
	b(); 
	alert(a);  */ 
	
	////////上面的代码等价如下
	/* var aa = 1;
	function bb(){
		var aa = function aa(){
			alert("abc");
		};
		console.log(aa);
		aa = 10;
		console.log(aa);
		aa = 11;
		console.log(aa);
		return;
	}
	bb();
	alert(aa); */
	
	
	/* var c = 2;
	function c(){
		c = 22;
		console.log("c="+c);
	}
	c();//会报错，变量提升机制导致的（c is not a function） */ 
	 
	/* var c = 2;
	var c = function(){
		c = 22;
		console.log(c);
	};
	c(); */
	
	
	/* function d(){
		alert("1");
	} */
	
	/* var d = function d(){
		alert("1");
	};
	d(); */
	
	
	/* d();
	var d = function(){
		alert("1");
	}; */
	console.log("-------");
	/* var a = 1; 
	function b() {
		console.log(a);
		a = 10; 
		function a() {} 
	} 
	b();//function a(){}
	console.log(a);// 1 */
	
	aa = 10;
	(function aa(){
		aa = 1;
		console.log(aa);// function a(){}
	})();
	console.log(aa);//10
	
	/* var sss;
	function ss() {
	  console.log("sss="+sss);
	}
	ss();
	sss = 1; */
	
	/* var sMessage = "hello world";
	function sayHelloWorld() {
	  alert(sMessage);
	}
	sayHelloWorld(); */
	
	var sayHelloWorld = function sayHelloWorld(){
		console.log(sMessage);
	};
	var sMessage;
	sMessage = "Hello World";
	sayHelloWorld();
	
	 
	/* function aa(i) { 
		console.log(i);// 10
		var i = 1; 
		console.log(i);// 1
	}; 
	aa(10); */
	
	
	
	/* var foo = function foo2(){//foo2()不是一个函数，不能这么调用，在哪个位置都不可以
		console.log("ss");
	};
	console.log("ssss");
	foo(); */
	
	
	/* function f(){
		n = 99;
		function f1(){
			alert(n);
		}
		return f1;
	}
	var result = f();
	result(); */
	
	
	/* $().ready(function(){
		for(var i=1;i<4;i++){ 
			(function(j){
				$("#button"+j)[0].addEventListener("click",function(){
					alert("button"+j);
				});
			})(i);
		}
	}); */
	
	$().ready(function(){
		for(var i=1;i<4;i++){
			$("#button"+i)[0].addEventListener("click",function(){
				alert(i);
			});
		}
	});
	
	function clickss(){
		alert("button"+1);
	}
	
	/* function a(){
		b = 1;
		console.log(b);
		
		var d = function(){
			c = 2;
			console.log('cc='+c);
		};
		console.log(c);
		d();
		var c = 11;
	}
	a();
	console.log("b="+b);
	console.log('c='+c);//没有全局变量c */
	
	/* function a(){
		b = 1;
		console.log(b);
		
		var d= function (){
			n += 2;
			console.log('n='+n);
		};
		var n = 3;
		d();
		console.log('dsf');
	}
	a(); */
	
	/* function a(){
		b = 1;
		console.log("wqwqw");
		function v(){
			c =b;
			console.log('cc='+c);
		}
		v();
		console.log('c='+c);
	}
	console.log("sss");
	a(); */
	
	/* function f1(){
		var n=999;
		nAdd=function(){n+=1;};
		function f2(){
			alert(n);
		}
		return f2;
	}
	var result=f1();
	result();
	nAdd();
	result(); */
	
	/* function a(){
		var num = 1;
		setTimeout(function(){
		  num = 2;
		  console.log('num='+num);
		},1000);
		console.log(num);
	}
	a(); */
	
	/* function createFun(){
		var result = new Array();
		var i=0;
		for(i;i<5;i++){
			result[i] = function(){
				return i;
			};
		}
		console.log(result);
		return result;
	}
	var s = createFun();
	console.log(s); */
	
	/* function fn(a){
		console.log('a='+a);//1 local
		var a = 2;
		console.log('aa='+a);//2 local
	}
	fn(1); */
	
	var A = {
		  add:function(x,y,z){
		    return x+y+z;
		  },
		  multiply:function(x,y,z){
		    return x*y*z;
		  }
		}
		var ad = A.add(1,2,3);
	
	
</script>
</head>
<body>
<input id="input1" value="asdf">
<button id="button1">button1</button>
<button id="button2">button2</button>
<button id="button3">button3</button>
<div>
	<img alt="ss" src="file:///D:/uploads/20161027150520790001.jpg">
</div>
</body>
</html>