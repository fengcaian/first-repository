<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="js/jquery-1.9.1.js"></script>
<title>表头画斜线的第二种方法</title>
<script type="text/javascript">
$(function(){
	var tX = $("#table1").offset().left;
	var tY = $("#table1").offset().top;
	var slantX = $("#td1").offset().left;
	var slantY = $("#td1").offset().top;
	alert("slantX="+slantX+",slantY="+slantY+","+tX+","+tY);
	var x = $("#td1").width();
	var y = $("#td1").height();
	alert("x="+x+",y="+y);
	drawQLine(slantX,slantX,300,300,"red");
	/* drawQLine(10,10,110,150,"green"); */
	/* drawQLine(100,100,200,300,"red"); */
});
//画线段
function drawQLine(x1,y1,x2,y2,color){
    
    //如果有相等的情况，应用画直接的方法
    if(x1==x2 || y1==y2){
       drawLine(x1,y1,x2,y2,color,1);
       return;
    }
    //计算宽度和高度
    var wh=x2-x1; //10
    var hg=Math.abs(y2-y1); //5
    //如果up>0,向上画,up<0 向上画
    var up=((y1-y2)>0?-1:1);
    //alert(up);
    //计算主动方向为1个像素时被动方向的像素数，既wh和hg中小的
    var rate;
    var wm;
    if(wh>=hg){ 
       wm="x";
       rate=wh/hg;
    }
    else{
       wm="y";
       rate=hg/wh;
    }
    //累积微量
    var srate=rate-Math.floor(rate);
    //累积微量之和
    var sumSrate=0;
    //当前的X偏移
    var xOffer=x1;
    //当前的y偏移
    var yoffer=y1;
    //开始画线
    if(wm=="x"){
       var ss = "";
       for(var i=0;i<hg;i++){
          sumSrate+=srate;
          
          ss += "<span style='display:block; margin-left:0px;margin-top:"+(yoffer)+"px;float:left; width:"+Math.floor(rate)+"px;height:1px;line-height:1px;background:"+color+";overflow:hidden;'></span>";
          /* $("#div1").append(ss); */
          xOffer+=Math.floor(rate);
          yoffer+=up;
          if(sumSrate>=1){
            /* document.write("<span style='position:absolute; display:block; margin-left:"+(xOffer)+";margin-top:"+(yoffer)+";float:left;width:1;height:1;line-height:1;background:"+color+";overflow:hidden;'></span>");
             */
            sumSrate-=1;
            xOffer+=1;
            yoffer+=up;
          }
       }
       /* var sss = "<div style='margin:0px'>"+ss+"</div>"; */
       $("#td1").append(ss);
       console.log(ss);
    }
    /* if(wm=="y"){
       for(var i=0;i<wh;i++){
          sumSrate+=srate;
          
          document.write("<span style='position:absolute; display:block; margin-left:"+(xOffer)+";margin-top:"+(yoffer)+";float:left; width:1;height:"+Math.floor(rate)+";line-height:"+Math.floor(rate)+";background:"+color+";overflow:hidden;'></span>");
          xOffer+=1;
          yoffer+=Math.floor(rate)*up;
          if(sumSrate>=1){
             document.write("<span style='position:absolute; display:block; margin-left:"+(xOffer)+";margin-top:"+(yoffer)+";float:left;width:1;height:1;line-height:1;background:"+color+";overflow:hidden;'></span>");
             sumSrate-=1;
             xOffer+=1;
             yoffer+=up;
          }
      
       }    
    }
     */
 }

</script>
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
<table id="table1" style="border: 1px;border-style: solid;width:706px;height: 302px" cellpadding="0" cellspacing="0">
	<tr>
		<td rowspan="2" colspan="2" id="td1">
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
<div id="div1" style="width: 1000px;height: 500px;padding: 0px">
ddd

</div>
<div style="border: solid 1px;border-color: blue;background-color: grey">
<span style='display:block;border:solid 1px;border-color:green;padding:20px; margin-left:10px;margin-top:10px;float:left; width:100px;height:100px;line-height:1px;background:red;overflow:hidden;'></span>
</div>
</body>
</html>