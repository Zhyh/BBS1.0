<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/header.jsp" %>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>超级管理员</title>
 <link rel="stylesheet" type="text/css" href="../css/tab.css">
	 
</head>
<script type="text/javascript" language="javascript">
		function opens(obj){
		for(var i = 1;i <= 8;i++){
		if(i == obj){document.getElementById("dis"+i).style.display="block";
		}else{
		document.getElementById("dis"+i).style.display="none";
		}}}
		
		function delUser() {
			if(confirm("确定要删除此用户吗?")){
			return true;
			}else return false;
			}
	</script>
<body style="margin-top: 80px">
 
<h3 style=" margin-left: 600px;">管 理 菜 单 </h3>
<div class="tabs"  >
  <ul>
    <li ><a href="#" onclick="opens(1)"><span>普 通 用 户 列 表</span></a></li>
    <li><a href="#" onclick="opens(2)"><span>版 主 列 表</span></a></li>
    <li><a href="#" onclick="opens(3)"><span>超 级 版 主 列 表</span></a></li>
    <li><a href="#" onclick="opens(4)"><span>管 理 员 列 表</span></a></li>
    <li><a href="#" onclick="opens(5)"><span>超 级 管 理 员 列 表</span></a></li>
    <li><a href="#" onclick="opens(6)"><span>版 块 列 表</span></a></li>
	<li><a href="#"  onclick="opens(7)"><span>主 题 列 表</span></a></li>
	<li><a href="#"  onclick="opens(8)"><span>回 复 列 表</span></a></li>
  </ul>
</div>
<div class ="all">
  <div class="dis1"  id="dis1"  >
    <div class="span12">
      <table class="table table-bordered table-striped responsive" >
         <thead>
         <tr>
        <td >ID</td><td >用户名</td><td >姓名</td><td >积分</td><td >电子邮件</td><td >上次访问IP</td>
        <td >最后访问时间</td><td >主题数</td><td >回复数</td><td >状态</td><td colspan="3" >操作</td>
         </tr>
         </thead>
       <tbody>
          <s:iterator value="uList" status="st" id="uList" >
       <tr class="odd gradeX">
        <td ><s:property value="id"/></td>
        <td><s:property value="username"/></td>
        <td ><s:property value="name"/></td>
        <td ><s:property value="score"/></td>
        <td ><s:property value="email"/></td>
        <td ><s:property value="IP"/></td>
        <td><s:date name="lastVisitTime" format="yy-MM-dd HH:mm:ss"/></td>
        <td ><s:property value="topicNum"/></td>
        <td ><s:property value="msgNum"/></td>
        <td ><s:if test="%{#uList.status==0}">正常</s:if><s:if test="%{#uList.status==1}">已锁定</s:if></td>
        <td ><a href="./removeUser.action?id=<s:property value="id"/>&groupId=<s:property value="group.id"/>" onclick="return delUser()">删除</a></td>
        <td ><a href="./lockUser.action?id=<s:property value="id"/>&groupId=<s:property value="group.id"/>">锁定</a></td>
        <td ><a href="./unLockUser.action?id=<s:property value="id"/>&groupId=<s:property value="group.id"/>">解锁</a></td>
      </tr>
    </s:iterator>
       </tbody>
      </table>
           <s:url id="url_pre" value="display.action">  
            <s:param name="groupId" value="#parameters.groupId"></s:param> 
             <s:param name="pageNo" value="pageNo-1"></s:param>   
           </s:url>  
          <s:url id="url_next" value="display.action">  
          <s:param name="groupId" value="#parameters.groupId"></s:param>  
              <s:param name="pageNo" value="pageNo+1"></s:param>  
         </s:url>  
         
          <s:url id="url_end" value="display.action">  
          <s:param name="groupId" value="#parameters.groupId"></s:param>  
              <s:param name="pageNo" value="user1PageCount"></s:param>  
         </s:url>
         <s:url id="url_start" value="display.action"> 
         <s:param name="groupId" value="1"></s:param>   
              <s:param name="pageNo" value="1"></s:param>  
         </s:url>
         <div style="position: relative;left:450px;margin-top: 30px;">
            <s:a href="%{url_start}"><s:text name="[首页]"/></s:a>
            <s:a href="%{url_pre}"><s:text name="[上一页]"/></s:a>
           <s:text name="/"/>
         <s:a href="%{url_next}"><s:text name="[下一页]"/></s:a>
          <s:a href="%{url_end}"><s:text name="[末页]"/></s:a>  
        </div>
       </div> 
  </div>
  <div id="dis2"  style="display:none">222</div>
  <div id="dis3" style="display:none">333</div>
  <div id="dis4" style="display:none">444</div>
  <div id="dis5" style="display:none">555</div>
  <div class="dis6" id="dis6" style="display:none">
   <div class="span12">
      <table class="table table-bordered table-striped responsive" >
         <thead>
         <tr>
        <td >ID</td><td >版块名</td><td >版主</td><td >创建日期</td><td >主题数</td><td >回复数</td>
        <td >最后发表时间</td><td >状态</td><td colspan="3" >操作</td>
         </tr>
         </thead>
       <tbody>
        <s:iterator value="cList" status="st" id="cList" >
       <tr class="odd gradeX">
        <td ><s:property value="id"/></td>
        <td><s:property value="name"/></td>
        <td ><s:property value="user.name"/></td>
        <td><s:date name="createDate" format="yy-MM-dd"/></td>
        <td ><s:property value="topicNum"/></td>
        <td ><s:property value="msgNum"/></td>
         <td><s:date name="lastPostTime" format="yy-MM-dd HH:mm:ss"/></td>
        <td ><s:if test="%{#cList.status==0}">正常</s:if><s:if test="%{#cList.status==1}">已锁定</s:if></td>
        <td ><a href="./removeUser.action?id=<s:property value="id"/>&groupId=<s:property value="group.id"/>">删除</a></td>
        <td ><a href="./lockUser.action?id=<s:property value="id"/>&groupId=<s:property value="group.id"/>">锁定</a></td>
        <td ><a href="./unLockUser.action?id=<s:property value="id"/>&groupId=<s:property value="group.id"/>">解锁</a></td>
      </tr>
    </s:iterator>
       </tbody>
      </table>
           <s:url id="url_pre" value="display.action">  
            <s:param name="groupId" value="#parameters.groupId"></s:param> 
             <s:param name="pageNo" value="pageNo-1"></s:param>   
           </s:url>  
          <s:url id="url_next" value="display.action">  
          <s:param name="groupId" value="#parameters.groupId"></s:param>  
              <s:param name="pageNo" value="pageNo+1"></s:param>  
         </s:url>  
         
          <s:url id="url_end" value="display.action">  
          <s:param name="groupId" value="#parameters.groupId"></s:param>  
              <s:param name="pageNo" value="categoryPageCount"></s:param>  
         </s:url>
         <s:url id="url_start" value="display.action"> 
         <s:param name="groupId" value="1"></s:param>   
              <s:param name="pageNo" value="1"></s:param>  
         </s:url>
         <div style="position: relative;left:450px;margin-top: 30px;marker-bottom: 30px">
            <s:a href="%{url_start}"><s:text name="[首页]"/></s:a>
            <s:a href="%{url_pre}"><s:text name="[上一页]"/></s:a>
           <s:text name="/"/>
         <s:a href="%{url_next}"><s:text name="[下一页]"/></s:a>
          <s:a href="%{url_end}"><s:text name="[末页]"/></s:a>  
        </div>
       </div> 
  
  </div>
  <div id="dis7" style="display:none">777</div>
  <div id="dis8" style="display:none">888</div>

</div>

  
</body>
<jsp:include page="../footer.jsp"></jsp:include>
</html>
