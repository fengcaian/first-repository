<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<style type="text/css">
    .fu_list{ width:500px; border:1px solid #ebebeb;line-height:20px; font-size:12px;}
    .fu_list thead td{background-color:#ebebeb;}
    .fu_list td{padding:5px;}
    .fu_list a{outline:none;/*ff*/hide-focus:expression(this.hideFocus=true);/*ie*/}
    .fu_list a:link, .fu_list a:visited, .fu_list a:hover, .fu_list a:active{text-decoration:none;color:#333;}
    .fu_list thead a{padding-right:15px;}
    .fu_list thead a.up, .fu_list thead a.down{ background:url() right center no-repeat; }
    .fu_list thead a.down{background-image:url();}
    
    .hoverTr{background-color:Orange;}
    </style>
</head>
<body>
<table border="0" cellspacing="0" cellpadding="0" class="fu_list" id="idTable">
    <thead>
    <tr>
    <td> <a href="javascript:void(0)" id="idTitle">名称</a> / <a href="javascript:void(0)" id="idExt">类型</a></td>
    <td width="150" align="center"><a href="javascript:void(0)" id="idAddtime" class="up">上传时间</a></td>
    <td width="50" align="center"><a href="javascript:void(0)" id="idSize">大小</a></td>
    </tr>
    </thead>
    <tbody>
    <tr>
    <td _order="JSCSS">JSCSS</td>
    <td align="center" _order="2008/9/12 8:51:09">2008/9/12 8:51:09</td>
    <td align="right" _order="433247">433247</td>
    </tr>
    <tr>
    <td _order="逗你玩">逗你玩</td>
    <td align="center" _order="2008/3/6 20:12:23">2008/3/6 20:12:23</td>
    <td align="right" _order="11394">11394</td>
    </tr>
    <tr>
    <td _order="张迪">张迪</td>
    <td align="center" _order="2008/10/4 20:21:54">2008/10/4 20:21:54</td>
    <td align="right" _order="351">351</td>
    </tr>
    <tr>
    <td _order="Index">Index</td>
    <td align="center" _order="2008/10/4 20:24:11">2008/10/4 20:24:11</td>
    <td align="right" _order="14074">14074</td>
    </tr>
    <tr>
    <td _order="阿波罗">阿波罗</td>
    <td align="center" _order="2008/10/4 20:24:11">2008/10/4 20:24:11</td>
    <td align="right" _order="2844">2844</td>
    </tr>
    <tr>
    <td _order="张涛">张涛</td>
    <td align="center" _order="2012/10/4 20:21:54">2012/10/4 20:21:54</td>
    <td align="right" _order="1236">1236</td>
    </tr>
    <tr>
    <td _order="jSSon">jSSon</td>
    <td align="center" _order="2010/12/12 8:51:09">2010/12/12 8:51:09</td>
    <td align="right" _order="10101">10101</td>
    </tr>
    </tbody>
    </table>
    <script src="js/jquery-1.9.1.js"></script>
    <script src="js/TableOrder.js" type="text/javascript"></script>
    <script src="js/ZhCN_Pinyin.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        TableOrderOper.Init("idTable", 0, {
            OnShow: function (i, trJqObj, _tbodyObj) {
                trJqObj.attr("class", ((i + 1) % 2 == 0 ? "hoverTr" : ""));
            }
        });
        TableOrderOper.SetOrder("idTitle", 0, { ValAttr: "_order", DataType: "string" });
        TableOrderOper.SetOrder("idAddtime", 1, { ValAttr: "_order", DataType: "date" });
        TableOrderOper.SetOrder("idSize", 2, { DataType: "int", DefaultOrder: true, OnClick: function () {
            alert("idSize"); 
        } });
    </script>
</body>
</html>