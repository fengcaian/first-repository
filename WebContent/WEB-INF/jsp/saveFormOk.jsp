<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script src="js/jquery-1.9.1.js"></script>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"></link>
<title>保存成功</title>
</head>
<style type="text/css"> 
._box 
{ 
position: relative; 
width: 119px; 
height: 37px; 
background-color: grey; 
background-image: url(images/bg.png); 
background-repeat: no-repeat; 
background-position: 0 0; 
background-attachment: scroll; 
line-height: 37px; 
text-align: center; 
color: white; 
cursor: pointer; 
overflow: hidden; 
z-index: 1; 
} 
._box input 
{ 
position: absolute; 
width: 119px; 
height: 40px; 
line-height: 40px; 
font-size: 23px; 
opacity: 0; 
filter: "alpha(opacity=0)"; 
filter: alpha(opacity=0); 
-moz-opacity: 0; 
left: -5px; 
top: -2px; 
cursor: pointer; 
z-index: 2; 
} 
</style> 
<body>
	<nav class="navbar navbar-default">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="#">Brand</a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li class="active"><a href="#">Link <span class="sr-only">(current)</span></a></li>
        <li><a href="#">Link</a></li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Dropdown <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="#">Action</a></li>
            <li><a href="#">Another action</a></li>
            <li><a href="#">Something else here</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="#">Separated link</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="#">One more separated link</a></li>
          </ul>
        </li>
      </ul>
      <form class="navbar-form navbar-left" role="search">
        <div class="form-group">
          <input type="text" class="form-control" placeholder="Search">
        </div>
        <button type="submit" class="btn btn-default">Submit</button>
      </form>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#">Link</a></li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Dropdown <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="#">Action</a></li>
            <li><a href="#">Another action</a></li>
            <li><a href="#">Something else here</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="#">Separated link</a></li>
          </ul>
        </li>
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>
<!-- <div class="container"> -->
	<form id="uploadForm" action="/SpringMVC/servlet/Upload" enctype="multipart/form-data" method="post">
	<div>
		<div class="_box" style="display: inline-block;">
			<input id="_f" type="file" name="_f" style="width: 300px;background-color: #1f1;" onchange="ss()">上传文件1234</input>
		</div>
		<div style="display: inline-block;margin:0 0 20px 0;vertical-align: middle;">
			<input id="sss" type="text" readonly="readonly"/>
		</div>
	</div>
	<input type="submit" value="upload file" id="uploadBtn" >
	</form>
	
	<input type="file" name="uploadfile" onfocus="showRealPath(this.value);"/>
<input type="hidden" name="uploadfileRealPath">
	
<!-- </div> -->
</body>
<script type="text/javascript">
	/* $("uploadBtn").click(function (){
		alert("adfa");
		$("uploadForm").submit();
	}); */
	function ss(){
		var va = $("#_f").val();
		alert(va);
		$("#sss").attr("value",va);
	}
	
	function sub(){
		
		/* document.getElementById("uploadBtn").onchange = function () {
		    document.getElementById("file").value = this.value;
		}; */
		
		$.ajax({
			url:"/SpringMVC/servlet/Upload",  
            type:"post",  
            enctype:"multipart/form-data",  
            contentType: "application/x-www-form-urlencoded; charset=utf-8",  
            dataType:"json",  
            success: function(data){ 
            	var objData = jQuery.parseJSON(data);
            	alert("objData="+objData);
            	var path = data.message;
            	alert("path="+path);
            },
            error: function(){
            	alert("error");
            }
		});
		$("#uploadForm").submit();
		alert("123");
		
		
		/* $("#uploadForm").ajaxSubmit({  
            url:"uploadFile.do",  
            type:"post",  
            enctype:"multipart/form-data",  
            contentType: "application/x-www-form-urlencoded; charset=utf-8",  
            dataType:"json",  
            success: function(data){  
             var r= confirm(data.message);
             if(r==true){
               closeDialogInIframe();
             }
            },  
            error: function() {  
                alert('error');  
            }  
        });  */
		
		
	}
	
	function showRealPath(filePath){
	      document.getElementsByName("textfield")[0].value = filePath;
	}
	
/* 	$().ready(function(){
		var inputObj=document.createElement('input')
        inputObj.setAttribute('id','_ef');
        inputObj.setAttribute('type','file');
        inputObj.setAttribute("style",'visibility:hidden');
        document.body.appendChild(inputObj);
        inputObj.click();
        inputObj.value ;
	}); */
	
</script>
</html>