<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>

 <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<title>Ìí¼Ó°å¿é</title>
 <link rel="stylesheet" type="text/css" href="./css/register.css"/>
</head>
 
<body bgcolor="#D1EEEE">
<h2 class="h2">Ìí¼Ó°å¿é</h2>

<form action="addCategory.action" method="post" >
  
     <div>
		<label class="required field" >Name</label>
		<input name="name" type="text" />
	</div>
	
	<div >
		<input type="submit" value="add" class="btn2" />
	</div>
</form>
</body>
<jsp:include page="footer.jsp" />
</html>
