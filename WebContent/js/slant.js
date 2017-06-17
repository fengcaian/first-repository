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
          for(var i=0;i<hg;i++){
             sumSrate+=srate;
             document.write("<span style='position:absolute; display:block; margin-left:"+(xOffer)+";margin-top:"+(yoffer)+";float:left; width:"+Math.floor(rate)+";height:1;line-height:1;background:"+color+";overflow:hidden;'></span>");
             xOffer+=Math.floor(rate);
             yoffer+=up;
             if(sumSrate>=1){
               document.write("<span style='position:absolute; display:block; margin-left:"+(xOffer)+";margin-top:"+(yoffer)+";float:left;width:1;height:1;line-height:1;background:"+color+";overflow:hidden;'></span>");
               sumSrate-=1;
               xOffer+=1;
               yoffer+=up;
             }
          }
       }
       if(wm=="y"){
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
    }
drawQLine(100,100,300,300,"red");
drawQLine(100,100,110,150,"green");
drawQLine(100,100,200,300,"red");