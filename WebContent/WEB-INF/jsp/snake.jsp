<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script src="js/jquery-1.9.1.js"></script>
<title>snake</title>
<script type="text/javascript">
	$(document).ready(function(){
		var trList = $("table").find("tr");//获得所有的tr
		var xNum;//横坐标方向格子数目
		var yNum = trList.length;//纵坐标方向格子数目
		var id = "id";
		var array = new Array();//蛇体
		var arrayPass = new Array();//经过的格子
		var randomX;
		var randomY;
		var flag = 0;//点击一次开始按钮置为1；
		var m = 3;
		var direction;//运动方向
		for(var i=0;i<trList.length;i++){
			var tdList = $(trList[i]).find("td");//获得每一行的所有td
			xNum = tdList.length;
			for(var j=0;j<tdList.length;j++){
				$(tdList[j]).attr("id",id+i+j);
				tdList[j].innerHTML = id+i+j;
				if(i==2){
					if(j==3){
						$(tdList[j]).attr("bgcolor","yellow");
						array.push(id+i+j+"head");//将头部放入list
						arrayPass.push(id+i+j+"head");
						$(tdList[j]).attr("id",id+i+j+"head");
					}
				}
			}
		}
		
		
		$("#btnStart").click(function(){
			if(flag == 0){
				randomX = parseInt(Math.random()*10%yNum);
				randomY = parseInt(Math.random()*10%xNum);
				var randomId = "id"+randomX+randomY;
				if($("#"+randomId).attr("bgcolor") == "red"){//保证随机出现的位置不和head重合
					randomX = parseInt(Math.random()*10%yNum);
					randomY = parseInt(Math.random()*10%xNum);
				}else{
					$("#"+randomId).attr("bgcolor","red");
				}
			}
			flag = 1;
			direction = "right";
			var time = setInterval(function(){//点击开始按钮后，蛇每秒向右移动一格
				m++;
				if(m<=xNum*yNum && direction == "right"){//初始方向为右边
					var head = "id"+2+m;
					array.splice(0,1,head);
					for(var i=0;i<array.length;i++){
						$("#"+array[i]).attr("bgcolor","green");
					}
					var oldhead = "id"+2+(m-1);
					arrayPass.splice(0,1,oldhead);
					for(var i=0;i<arrayPass.length;i++){
						$("#"+arrayPass[i]).removeAttr("bgcolor");
					}
					
					document.onkeydown = function(event){
						var e = event || window.event || arguments.callee.caller.arguments[0];
						if(e && e.keyCode==38){ // 按 up 
							head = array[0];
							var i = head.substring(head.length-2,head.length-1);
							var up = head.substring(head.length-1,head.length);
							up--;
							direction = "up";
							head = "id"+i+up;
							if(up<=0){
								alert(head);
								alert("哎呀，撞墙了！");
							}
						}
						if(e && e.keyCode==37){ // 按 left
							alert("e.keyCode="+e.keyCode);
							direction = "left";
						}
						if(e && e.keyCode==40){ // 按 down
							alert("e.keyCode="+e.keyCode);
							direction = "down";
						}
						if(e && e.keyCode==39){ // 按 right
							alert("e.keyCode="+e.keyCode);
							direction = "right";
						}
					}
					
				}else{
					if(m>xNum){
						alert("哎呀，撞墙了！");
						clearInterval(time);
					}
				}
			},1000);
			
			
			
		});
	});
	
	function draw(array){
		for(var i=0;i<array.length;i++){
			$(array[i]).attr("bgcolor","red");
		}
	}
	
	function randomFun(){
		
	}
	
</script>
<style type="text/css">
	.div1{
		width:700px;
		height:500px;
		border:1px solid grey;
	}
	td{
		border:1px solid grey;
	}
</style>
</head>
<body>
	<table class="div1" cellspacing="0" cellpadding="0">
		<tr>
			<td></td><td></td><td></td><td></td>
			<td></td><td></td><td></td>
		</tr>
		<tr>
			<td></td><td></td><td></td><td></td>
			<td></td><td></td><td></td>
		</tr>
		<tr>
			<td></td><td></td><td></td><td></td>
			<td></td><td></td><td></td>
		</tr>
		<tr>
			<td></td><td></td><td></td><td></td>
			<td></td><td></td><td></td>
		</tr>
		<tr>
			<td></td><td></td><td></td><td></td>
			<td></td><td></td><td></td>
		</tr>
		<tr>
			<td></td><td></td><td></td><td></td>
			<td></td><td></td><td></td>
		</tr>
	</table>
	<input type="button" value="开始" id="btnStart">

</body>
</html>