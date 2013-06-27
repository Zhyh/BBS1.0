<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@include file="/header.jsp" %>
<%User u = (User)request.getSession().getAttribute("loginUser"); %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
 <link rel="stylesheet" type="text/css" href="../css/tab.css">
</head>
<body style="margin-top: 80px">
<h3 style=" margin-left: 600px;">管 理 菜 单 </h3>
<div class="tabs"  >
  <ul>
   <li><a href="./categoryList?pageNo=1" ><span>版 块 列 表</span></a></li>
    <li><a href="./userList?groupId=2&pageNo=1" ><span>版 主 列 表</span></a></li>
     <li ><a href="./userList?groupId=1&pageNo=1" ><span>普 通 用 户 列 表</span></a></li>
   <%if(u.getGroup().getId() > 3 ){%>
    <li><a href="./userList?groupId=3&pageNo=1" ><span>超 级 版 主 列 表</span></a></li>
    <%if(u.getGroup().getId() > 4 ){%>
    <li><a href="./userList?groupId=4&pageNo=1" ><span>管 理 员 列 表</span></a></li>
    <li><a href="./userList?groupId=5&pageNo=1" ><span>超 级 管 理 员 列 表</span></a></li>
   <%} } %>
   
   
    
  </ul>
</div>
</body>
</html>
