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
		function delCategory() {
			if(confirm("确定要删除此版块吗?")){
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
        <td >ID</td><td >版块名</td><td >版主</td><td >创建日期</td><td >主题数</td><td >回复数</td><td >今日发表</td>
        <td >最后发表时间</td><td >状态</td><td colspan="3" >操作</td>
         </tr>
         </thead>
        <s:iterator value="cList" status="st" id="cList" >
       <tr class="odd gradeX">
        <td ><s:property value="id"/></td>
        <td><s:property value="name"/></td>
        <td ><s:property value="user.name"/></td>
        <td><s:property value="createDate.substring(2,10)"/></td>
        <td ><s:property value="topicNum"/></td>
        <td ><s:property value="msgNum"/></td>
        <td ><s:property value="todayPostNum"/></td>
         <td><s:date name="lastPostTime" format="yy-MM-dd HH:mm:ss"/></td>
        <td ><s:if test="%{#cList.status==0}">正常</s:if><s:if test="%{#cList.status==1}">已锁定</s:if></td>
        <td ><a href="./removeCategory.action?id=<s:property value="id"/>" onclick="return delCategory()">删除</a></td>
        <td ><a href="./lockCategory.action?id=<s:property value="id"/>">锁定</a></td>
        <td ><a href="./unLockCategory.action?id=<s:property value="id"/>">解锁</a></td>
      </tr>
    </s:iterator>
       </tbody>
      </table>
           <s:url id="url_pre" value="categoryList.action">  
             <s:param name="pageNo" value="pageNo-1"></s:param>   
           </s:url>  
          <s:url id="url_next" value="categoryList.action">  
              <s:param name="pageNo" value="pageNo+1"></s:param>  
         </s:url>  
         
          <s:url id="url_end" value="categoryList.action">  
              <s:param name="pageNo" value="categoryPageCount"></s:param>  
         </s:url>
         <s:url id="url_start" value="categoryList.action"> 
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
