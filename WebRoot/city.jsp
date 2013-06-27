<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@include file="/header.jsp" %>
<%@taglib prefix="s" uri="/struts-tags" %>
<%User u = (User)request.getSession().getAttribute("loginUser"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html> 
<head>
<title>Category</title>
<script type="text/javascript" language="javascript">
		function delTopic() {
			if(confirm("确定要删除此主题吗?")){
			return true;
			}else return false;
			}
</script>
</head>
<body ><div align="center">
   <table cellspacing="0" cellpadding="3" align="center" frame="below" style="margin-top: 75px;margin-bottom:25px">
    <tr >
        <td> <img src="./images/city.png"   width="50px" height="75px"/></td>
        <td width=200px><strong><s:property value="category.name"/></strong></td>
        <td width=100px>主题数：<em><s:property value="category.topicNum"/></em></td>
        <td width=200px>版主：<em><s:property value="category.user.username" /></em><img style="margin-left: 10px" src="./images/admin.gif" width="30px" height="30px"/></td>
        <td  colspan="7">创建时间：<em><s:property value="category.createDate.substring(0,10)"/></em></td>
      </tr>
      <tr align="right" style=" border-bottom: 1px solid gray;" ><td colspan="11">
      <a href="./post_topic.jsp?categoryId=<s:property value="category.id"/>">
      <img src="./images/pn_post.png"  width="120px" height="60px"/></a></td></tr>
    <tr >
       <td > <img src="./images/tttopic_icon.png"   width="50px" height="75px"/></td>
      <td width=400px>全站置顶</td> 
      <td width=100px>作者/时间</td> 
      <td width=50px>回复</td> 
      <td width=50px >最后发表</td>
      <td width=50px colspan="6">状态</td>
      </tr>
    <s:iterator value="tttList" status="st" id="tttList">
	     <tr >
	       <td width=50px>
	         <a href="./allMsgs.action?topicId=<s:property value="id"/>&pageNo=1" >
	            <img src="./images/qzdmsg.gif"   width="50px" height="90px"/>
	         </a>
	       </td >
	      <td width=400px>
	           <a href="./allMsgs.action?topicId=<s:property value="id"/>&pageNo=1">
	            <font style="color: red;"><strong><s:if test="title.length()>20"><s:property value="title.substring(0,20)" />...</s:if>
               <s:else><s:property value="title" /></s:else></strong>  </font>
	           </a>
	       </td>
	       <td width=100px>
	         <em><p><a href="./showUser?id=<s:property value="user.id"/>&flag=1"><s:property value="user.username"/></a></p>
	          <font color="#FF0000"><s:property value="createDate.substring(0,10)" /></font>
	          </em>
	       </td>
	        <td  width=50px>回复：<em><s:property value="msgNum"/></em></td>
	         <td  width=100px>
	         <em><p><s:property value="lastPostUserName"/></p>
	           <font color="#FF0000"><s:date name="lastPostTime" format="yyyy-MM-dd HH:mm:ss" /></font></em>
	         </td>
	          <td width=50px><s:if test="%{#tttList.status==0}">正常</s:if>
                        <s:if test="%{#tttList.status==1}">已锁定</s:if>
                    </td>
	         <% if(u.getGroup().getId() > 2){%>
	         <td  width=50px><a href="./removeTopic?id=<s:property value="id"/>&categoryId=<s:property value="category.id"/>" onclick="return delTopic()"><font color="blue">删除</font></a></td>
	         <td  width=50px><a href="./lockTopic?id=<s:property value="id"/>&categoryId=<s:property value="category.id"/>" ><font color="blue">锁定</font></a></td>
	          <td  width=50px><a href="./unLockTopic?id=<s:property value="id"/>&categoryId=<s:property value="category.id"/>" ><font color="blue">解锁</font></a></td>
	          <td  width=50px colspan="2"><a href="./unQZDTopic?id=<s:property value="id"/>&categoryId=<s:property value="category.id"/>" ><font color="blue">取消全站置顶</font></a></td>
	         
	          <% }%>
	     </tr>
	 </s:iterator>
     <tr style=" border-top: 1px solid gray;">
       <td > <img src="./images/ttopic_icon.png"   width="50px" height="75px"/></td>
      <td width=400px>本版置顶</td> 
      <td width=100px>作者/时间</td> 
      <td width=50px>回复</td> 
      <td width=50px >最后发表</td>
      <td width=50px colspan="6">状态</td>
      </tr>
     <s:iterator value="ttList" status="st" id="ttList">
	     <tr >
	       <td width=50px>
	         <a href="./allMsgs.action?topicId=<s:property value="id"/>&pageNo=1" >
	            <img src="./images/zdmsg.gif"   width="30px" height="45px"/>
	         </a>
	       </td >
	      <td width=400px>
	           <a href="./allMsgs.action?topicId=<s:property value="id"/>&pageNo=1">
	           <strong> <s:if test="title.length()>20"><s:property value="title.substring(0,20)" />...</s:if>
               <s:else><s:property value="title" /></s:else>  
	           </strong></a>
	       </td>
	       <td width=100px>
	         <em><p><a href="./showUser?id=<s:property value="user.id"/>&flag=1"><s:property value="user.username"/></a></p>
	          <font color="#FF0000"><s:property value="createDate.substring(0,10)" /></font>
	          </em>
	       </td>
	        <td  width=50px>回复：<em><s:property value="msgNum"/></em></td>
	         <td  width=100px>
	         <em><p><s:property value="lastPostUserName"/></p>
	           <font color="#FF0000"><s:date name="lastPostTime" format="yyyy-MM-dd HH:mm:ss" /></font></em>
	         </td>
	          <td width=50px><s:if test="%{#ttList.status==0}">正常</s:if>
                        <s:if test="%{#ttList.status==1}">已锁定</s:if>
                    </td>
	         <% if(u.getGroup().getId() > 1){%>
	         <td  width=50px><a href="./removeTopic?id=<s:property value="id"/>&categoryId=<s:property value="category.id"/>" onclick="return delTopic()"><font color="blue">删除</font></a></td>
	         <td  width=50px><a href="./lockTopic?id=<s:property value="id"/>&categoryId=<s:property value="category.id"/>" ><font color="blue">锁定</font></a></td>
	          <td  width=50px><a href="./unLockTopic?id=<s:property value="id"/>&categoryId=<s:property value="category.id"/>" ><font color="blue">解锁</font></a></td>
	          <td  width=70px><a href="./unZDTopic?id=<s:property value="id"/>&categoryId=<s:property value="category.id"/>" ><font color="blue">取消置顶</font></a></td>
	            <% if(u.getGroup().getId() > 2){%>
	          <td  width=70px><a href="./QZDTopic?id=<s:property value="id"/>&categoryId=<s:property value="category.id"/>" ><font color="blue">全站置顶</font></a></td>
	          <% }}%>
	     </tr>
	 </s:iterator>
      <tr style=" border-top: 1px solid gray;">
       <td ><img src="./images/topic_icon.png"   width="45px" height="70px"/></td>
      <td width=400px>普通主题</td> 
      <td width=100px>作者/时间</td> 
      <td width=50px>回复</td> 
      <td width=50px >最后发表</td>
      <td width=50px colspan="6">状态</td>
      </tr>
      <s:iterator value="tList" status="st" id="tList">
	     <tr >
	       <td width=50px>
	         <a href="./allMsgs.action?topicId=<s:property value="id"/>&pageNo=1" >
	            <img src="./images/msg.gif"   width="25px" height="35px"/>
	         </a>
	       </td >
	      <td width=400px>
	           <a href="./allMsgs.action?topicId=<s:property value="id"/>&pageNo=1">
	            <s:if test="title.length()>20"><s:property value="title.substring(0,20)" />...</s:if>
               <s:else><s:property value="title" /></s:else>  
	           </a>
	       </td>
	       <td width=100px>
	         <em><p><a href="./showUser?id=<s:property value="user.id"/>&flag=1"><s:property value="user.username"/></a></p>
	          <font color="#FF0000"><s:property value="createDate.substring(0,10)" /></font>
	          </em>
	       </td>
	        <td  width=50px>回复：<em><s:property value="msgNum"/></em></td>
	         <td  width=100px>
	         <em><p><s:property value="lastPostUserName"/></p>
	           <font color="#FF0000"><s:date name="lastPostTime" format="yyyy-MM-dd HH:mm:ss" /></font></em>
	         </td>
	          <td width=50px><s:if test="%{#tList.status==0}">正常</s:if>
                        <s:if test="%{#tList.status==1}">已锁定</s:if>
                    </td>
	         <% if(u.getGroup().getId() > 1){%>
	         <td  width=50px><a href="./removeTopic?id=<s:property value="id"/>&categoryId=<s:property value="category.id"/>" onclick="return delTopic()"><font color="blue">删除</font></a></td>
	         <td  width=50px><a href="./lockTopic?id=<s:property value="id"/>&categoryId=<s:property value="category.id"/>" ><font color="blue">锁定</font></a></td>
	          <td  width=50px><a href="./unLockTopic?id=<s:property value="id"/>&categoryId=<s:property value="category.id"/>" ><font color="blue">解锁</font></a></td>
	         <td  width=70px><a href="./ZDTopic?id=<s:property value="id"/>&categoryId=<s:property value="category.id"/>" ><font color="blue">本版置顶</font></a></td>
	         <% if(u.getGroup().getId() > 2){%>
	         <td  width=70px><a href="./QZDTopic?id=<s:property value="id"/>&categoryId=<s:property value="category.id"/>" ><font color="blue">全站置顶</font></a></td>
	          <% }}%>
	     </tr>
	 </s:iterator>
	</table>
         <s:url id="url_pre" value="allTopics.action">  
            <s:param name="categoryId" value="categoryId"></s:param> 
             <s:param name="pageNo" value="pageNo-1"></s:param>   
           </s:url>  
          <s:url id="url_next" value="allTopics.action">  
          <s:param name="categoryId" value="categoryId"></s:param>  
              <s:param name="pageNo" value="pageNo+1"></s:param>  
         </s:url>  
         
          <s:url id="url_end" value="allTopics.action">  
          <s:param name="categoryId" value="categoryId"></s:param>  
              <s:param name="pageNo" value="topicPageCount"></s:param>  
         </s:url>
         <s:url id="url_start" value="allTopics.action"> 
         <s:param name="categoryId" value="categoryId"></s:param>   
              <s:param name="pageNo" value="1"></s:param>  
         </s:url>
         <s:a href="./allCategories.action?pageNo=1"><s:text name="[返回主页]"/></s:a>
            <s:a href="%{url_start}"><s:text name="[首页]"/></s:a>
            <s:a href="%{url_pre}"><s:text name="[上一页]"/></s:a>
           <s:text name="/"/>
         <s:a href="%{url_next}"><s:text name="[下一页]"/></s:a>
          <s:a href="%{url_end}"><s:text name="[末页]"/></s:a>  
   </div></body>
<s:include value="/footer.jsp"></s:include>
</html>


