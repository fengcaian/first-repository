<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<style type="text/css">
    *{padding: 0; margin: 0}
    img{border: 0}
    ul li{list-style: none}
    ul{width: 200px; height: 200px; margin: 100px auto;
    position: relative; -webkit-transform-style: preserve-3d ;
      /* perspective: 100px;*/
    }
    /*绕中心旋转，坐标轴会随旋转而旋转*/
    li{width:200px;height:200px;position:absolute;text-align:center;line-height:200px;font-size:80px;font-weight:bold;color:#fff;}
    /*构造六个面*/
    li:nth-child(1){background:rgba(255,0,0,1);-webkit-transform:rotateX(90deg)  translateZ(100px);}
    li:nth-child(2){background:rgba(0,255,255,1);-webkit-transform:rotateX(270deg) translateZ(100px);}
    li:nth-child(3){background:rgba(255,0,255,1);-webkit-transform:rotateY(90deg) translateZ(100px);}
    li:nth-child(4){background:rgba(0,255,0,1);-webkit-transform:rotateY(270deg) translateZ(100px);}
    li:nth-child(5){background:rgba(200,200,0,1);-webkit-transform:translateZ(-100px);}
    li:nth-child(6){background:rgba(0,0,255,1);-webkit-transform: translateZ(100px) ;}
    .button{
      width: 200px; margin: 20px auto;
      position: relative;
      cursor: pointer;
    }
    input{
      width: 50px; height: 30px;
      position: absolute;
      cursor: pointer;
    }
    /*按钮的绝对定位*/
    input:nth-child(1){left: 100px; top: 0}
    input:nth-child(2){left:200px;top:50px;}
    input:nth-child(3){left:0px;top:50px;}
    input:nth-child(4){left:100px;top:100px;}
    input:nth-child(5){left:100px;top:50px;}
  </style>
  <script type="text/javascript">
    window.onload = function () {
      var x = 0, y = 0;
      var ul = document.getElementById('ul');
      var inputs = document.getElementsByTagName('input');
      for (var i = 0; i<inputs.length; i++){
        inputs[i].onclick = run;
      }
      function run() {
        /*渐变*/
        ul.style.webkitTransition = '-webkit-transform 3s linear';
        ul.style.oTransition = '-o-transform 3s linear';
        ul.style.transition = 'transform 3s linear';
        /*旋转的规则，就是x，y方向的deg改变*/
        if(inputs[0]==this){x+=90;}
        if(inputs[1]==this){y+=90;}
        if(inputs[2]==this){y-=90;}
        if(inputs[3]==this){x-=90;}
        if (inputs[4] == this){
          x = 0; y = 0;
          ul.style.webkitTransition = '-webkit-transform .1s linear';
          ul.style.oTransition = '-o-transform .1s linear';
          ul.style.transition = 'transform .1s linear';
        }
        ul.style.webkitTransform = 'rotateX(' + x + 'deg) rotateY(' + y + 'deg)';
        ul.style.oTransform = 'rotateX(' + x + 'deg) rotateY(' + y + 'deg)';
        ul.style.transform = 'rotateX(' + x + 'deg) rotateY(' + y + 'deg)';
      }
      document.addEventListener('keydown', function(e){
        ul.style.webkitTransition='-webkit-transform 3s linear';
        switch(e.keyCode){
          case 37:  y -= 90;  //左箭头
            break;
          case 38:  x += 90;  //上箭头
            break;
          case 39:  y += 90;  //下箭头
            break;
          case 40:  x -= 90;  //右箭头
            break;
          case 13:  x=0; y=0;  //回车 （当回车时，迅速转回初始状态）
            ul.style.webkitTransition='-webkit-transform 0.1s linear';
            break;
        }
        ul.style.webkitTransform = "rotateX("+x+"deg) rotateY("+y+"deg)"; //变换效果（沿X轴和Y轴旋转）
      }, false);document.addEventListener("keydown", function (e) {
        ul.style.webkitTransition = '-webkit-transform 3s linear';
        ul.style.oTransition = '-o-transform 3s linear';
        ul.style.transition = 'transform 3s linear';
        switch(e.keyCode){
          case 37:
        }
      })
      /* function run(){
        ul.style.webkitTransition='-webkit-transform 3s linear'; //设置立方体变换的属性、持续时间、动画类型
        if(inputs[0]==this){x+=90;}
        if(inputs[1]==this){y+=90;}
        if(inputs[2]==this){y-=90;}
        if(inputs[3]==this){x-=90;}
        if(inputs[4]==this){x=0;y=0; ul.style.webkitTransition='-webkit-transform 0.1s linear';}  //当点击重置按钮时，迅速转回到初始状态。
        ul.style.webkitTransform = "rotateX("+x+"deg) rotateY("+y+"deg)";  //变换效果（沿X轴和Y轴旋转）
      }*/
    }
  </script>
</head>
<body>

<ul id="ul">
  <li>1</li>
  <li>2</li>
  <li>3</li>
  <li>4</li>
  <li>5</li>
  <li>6</li>
</ul>
<div class="container">
</div>
<div class="button">
  <input type="button" value="上">
  <input type="button" value="右">
  <input type="button" value="左">
  <input type="button" value="下">
  <input type="button" value="重置">
</div>

</body>
</html>