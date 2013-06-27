<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="./adminIndex.jsp" %>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>管理后台</title>
 <link rel="stylesheet" type="text/css" href="../css/tab.css">
	 
</head>
<script type="text/javascript" language="javascript">
		function demoteUser() {
			if(confirm("确定要将此版主降为普通会员吗?")){
			return true;
			}else return false;
			}
	</script>
<body >
 


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
        <td ><a href="./demoteUser.action?id=<s:property value="id"/>&groupId=<s:property value="group.id"/>" onclick="return demoteUser()">降为会员</a></td>
        <td ><a href="./lockUser.action?id=<s:property value="id"/>&groupId=<s:property value="group.id"/>">锁定</a></td>
        <td ><a href="./unLockUser.action?id=<s:property value="id"/>&groupId=<s:property value="group.id"/>">解锁</a></td>
      </tr>
    </s:iterator>
       </tbody>
      </table>
           <s:url id="url_pre" value="userList.action">  
            <s:param name="groupId" value="#parameters.groupId"></s:param> 
             <s:param name="pageNo" value="pageNo-1"></s:param>   
           </s:url>  
          <s:url id="url_next" value="userList.action">  
          <s:param name="groupId" value="#parameters.groupId"></s:param>  
              <s:param name="pageNo" value="pageNo+1"></s:param>  
         </s:url>  
         
          <s:url id="url_end" value="userList.action">  
          <s:param name="groupId" value="#parameters.groupId"></s:param>  
           <s:param name="pageNo" value="userPageCount"></s:param>  
         </s:url>
         <s:url id="url_start" value="userList.action"> 
         <s:param name="groupId" value="#parameters.groupId"></s:param>   
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
 
</div>

  
</body>
<jsp:include page="../footer.jsp"></jsp:include>
</html>
