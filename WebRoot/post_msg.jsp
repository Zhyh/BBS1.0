<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@include file="/header.jsp" %>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<title>Post</title>
      <script type="text/javascript" src="xheditor/jquery/jquery-1.4.4.min.js" charset="utf-8"></script>
      <script type="text/javascript" src="xheditor/xheditor.min.js" charset="utf-8"></script>
      <script type="text/javascript" src="xheditor/xheditor_lang/zh-cn.js" charset="utf-8"></script>
</head>
<body ><div style="float: center;">
       <div style="position:relative;left:350px ;margin-top: 80px">
       <form method="post" action="addMsg.action?toLayerUserId=<s:property value="#parameters.toUserId"/>&topicId=<s:property value="#parameters.topicId"/>&toLayer=<s:property value="#parameters.toLayer"/>">
        <textarea name="content" style="max-width:700px;min-width:700px;min-height:300px;" class="xheditor">回复<s:property value="#parameters.toLayer"/>楼：</textarea>
        <br/>
        <br/>
         <input type="submit" value="发表回复"/>
       </form> 
       </div>
     <s:url id="back_list" value="allTopics.action">
          <s:param name="categoryId" value="#parameters.categoryId"/>
           <s:param name="pageNo" value="1"/>
         </s:url>
          <div style="position:relative;left:650px ">
         <s:a  href="%{back_list}"><s:text name="[返回列表]"/></s:a>
   </div>
   </div>
   </body>
<s:include value="/footer.jsp"></s:include>
</html>


