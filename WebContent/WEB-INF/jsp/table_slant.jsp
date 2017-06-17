<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="js/jquery-1.9.1.js"></script>
<script type="text/javascript">
$(function(){
	line('header',2,'black',2); 
});
function line(header,line_width,line_color,line_number){  
    var table = document.getElementById(header);   
    /* var xpos = table.clientWidth;  
    var ypos = table.clientHeight; */
    var xpos = $(table).width();
    var ypos = $(table).height();
    /* alert("xpos="+xpos+",ypos="+ypos); */
    var canvas = document.getElementById('line');  
    if(canvas.getContext){  
        var ctx = canvas.getContext('2d');  
        ctx.clearRect(0,0,xpos,ypos); //清空画布，多个表格时使用  
        ctx.fill();  
        ctx.lineWidth = line_width;  
        ctx.strokeStyle = line_color;  
        ctx.beginPath();  
        switch(line_number){  
            case 1:  
                ctx.moveTo(0,0);  
                ctx.lineTo(xpos,ypos);  
                break;  
            case 2:  
                ctx.moveTo(10,10);  
                ctx.lineTo(xpos/2+10,ypos+10);  
                ctx.moveTo(10,10);  
                ctx.lineTo(xpos+10,ypos/2+10);  
                break;  
            case 3:  
                ctx.moveTo(0,0);  
                ctx.lineTo(xpos,ypos);  
                ctx.moveTo(0,0);  
                ctx.lineTo(xpos/2,ypos);  
                ctx.moveTo(0,0);  
                ctx.lineTo(xpos,ypos/2);  
                break;  
            default:  
        }  
                  
        ctx.stroke();  
        ctx.closePath();  
        document.getElementById(header).style.backgroundImage = 'url("' + ctx.canvas.toDataURL() + '")';  
        /* document.getElementById(header).style.background-attachment = 'fixed'; 
        $("#"+header)[0].style.background-attachment='fixed'; */
        $("#"+header).css("background-attachment","fixed");
    }  
}  
/* window.onload = function (){  
    line('header',2,'black',2);  
    //目标单元格，线的宽度，线的颜色，线的条数，1~3，  
    //line('two',2,'black',2);  
}  */
window.onresize = function(){       //当窗口改变时，也随之改变  
//可以加上检测 宽度高度是否变化在执行函数  
    line('header',2,'black',2);  
}   
</script>
<title>表格斜线</title>
<style type="text/css">
table tr th{
	border: 1px;
	border-style: solid;
}
table tr td{
	border: 1px;
	border-style: solid;
	text-align: center
}
</style>
</head>
<body>
<canvas id="line" style="display:none;" width="2000px" height="1000px"></canvas>  
<table style="border: 1px;border-style: solid;width:706px;height: 302px" cellpadding="0" cellspacing="0">
	<tr>
		<td rowspan="2" colspan="2" id="header">
			<!-- <div style="margin: 5 10 100 50">标题1</div>
			<div>标题2</div>
			<div>标题3</div> -->
		</td>
		<th>格子1</th>
		<th>格子2</th>
		<th>格子3</th>
		<th>格子4</th>
		<th>格子5</th>
	</tr>
	<tr>
		<th id="ss">格子1</th>
		<th>格子2</th>
		<th>格子3</th>
		<th>格子4</th>
		<th>格子5</th>
	</tr>
	<tr>
		<td id="sss">格子1</td>
		<td>格子1</td>
		<td>格子1</td>
		<td>格子1</td>
		<td>格子1</td>
		<td>格子1</td>
		<td>格子1</td>
	</tr>
</table>
<span style='position:absolute; display:block; margin-left:"10px";margin-top:"10px";float:left; width:"100px";height:"110px";line-height:1px;background:"red";overflow:hidden;'>

sdfasdfasd
</span>
</body>
</html>