<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@include file="/header.jsp" %>
<%@taglib prefix="s" uri="/struts-tags" %>
<%User u = (User)request.getSession().getAttribute("loginUser"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<title>Topic</title>
 <script type="text/javascript" src="xheditor/jquery/jquery-1.4.4.min.js" charset="utf-8"></script>
      <script type="text/javascript" src="xheditor/xheditor.min.js" charset="utf-8"></script>
      <script type="text/javascript" src="xheditor/xheditor_lang/zh-cn.js" charset="utf-8"></script>
<script type="text/javascript" language="javascript">
		function delMsg() {
			if(confirm("ȷ��Ҫɾ���˻ظ���?")){
			return true;
			}else return false;
			}
</script>
</head>
<body ><div align="center">
   <table cellspacing="0" cellpadding="0" frame="below" style="margin-top: 70px;margin-bottom: 15px; width: 1200px">
      <thead><tr style="border: 1px solid gray; height: 50px; " ><th width="900px" colspan="2" ><s:property value="topic.title" /></th></tr></thead>
	 <tr >
		<td width="100" rowspan="2" >
		   <p><a href="./showUser?id=<s:property value="topic.user.id"/>&flag=1"  title="���ʿռ�"><s:property value="topic.user.username" /></a></p>
		   <a href="./showUser?id=<s:property value="topic.user.id"/>&flag=1" ><img src="./images/touxiang.png" title="���ʿռ�" /></a>
			<table cellspacing="0" cellpadding="0">
				<tr>
				<th><p><em><s:property value="topic.user.topicNum"/></em></p>����&nbsp;&nbsp;</th>
				<th><p><em><s:property value="topic.user.score"/></em></p>����</th>
				</tr>
			</table>
				<p title="��ν">��ѧר��</p>
				<p><img src="./images/sun.gif" alt="Rank: 5" title="�ȼ�"/><img title="�ȼ�" src="./images/star.gif" alt="Rank: 5" /></p>
			<dl ><dt>����¼</dt><dd><em><s:date name="topic.user.lastVisitTime" format="yyyy-MM-dd"/></em></dd>
			 <s:if test="%{topic.type>2}"></s:if>
			 <s:else>
			 <dd><a href="./grantRight.action?topicId=<s:property value="topic.id"/>&categoryId=<s:property value="topic.category.id"/>&id=<s:property value="topic.user.id"/>"><font color="blue">��Ϊ�������</font></a></dd>
			 </s:else>
			</dl>                                      
	   </td>
	   <td width="800"  style="margin-top: 15px;">
				<strong>¥��</strong>
				<img  src="./images/reply_icon.gif" />
				������<em> <s:property value="topic.createDate"/></em>
	       <table cellspacing="0" cellpadding="0" style="margin-top: 20px;">
	       <tr><td><s:property value="topic.content" escape="false"/></td></tr>
	      </table>
	  </td>
	 </tr>
	 <tr>
		<td colspan="2" align="right" valign="bottom" >
		  <a href="#down" title="�ظ���"><img src="./images/reply.png" height="35px" width="80px"/></a>
		</td>
	</tr>
	</table>
	
  <s:iterator value="mList" status="st" id="allMsgs">
   <table cellspacing="0" cellpadding="0" frame="below" style="margin-bottom: 15px; width: 1200px">
	 <tr >
		<td width="100" rowspan="2">
		   <p><a href="./showUser?id=<s:property value="user.id"/>&flag=1"  title="���ʿռ�"><s:property value="user.username"/></a></p>
		   <a href="./showUser?id=<s:property value="user.id"/>&flag=1" ><img src="./images/touxiang.png" title="���ʿռ�" /></a>
			 <table cellspacing="0" cellpadding="0">
				<tr>
				  <th><p><em><s:property value="user.topicNum"/></em></p>����&nbsp;&nbsp;</th>
				  <th><p><em><s:property value="user.score"/></em></p>����</th>
				</tr>
			 </table>
				<p title="��ν">��ѧר��</p>
				<p><img src="./images/sun.gif" alt="Rank: 5" title="�ȼ�"/><img title="�ȼ�" src="./images/star.gif" alt="Rank: 5" /></p>
			   <dl ><dt>����¼</dt><dd><em><s:date name="user.lastVisitTime" format="yyyy-MM-dd"/></em></dd>
			   <s:if test="%{topic.type>2}"></s:if>
			 <s:else>
			   <% if(u.getGroup().getId() > 2){%>
			   <dd><a href="./grantRight.action?topicId=<s:property value="topic.id"/>&categoryId=<s:property value="topic.category.id"/>&id=<s:property value="user.id"/>"><font color="blue">��Ϊ�������</font></a></dd>
			   <% }%>
			   </s:else>
			   </dl>                                      
	   </td>
	   <td width="800" >
				<strong>
				  <em><s:property value="layer"/> </em>¥
			    </strong>
				<img  src="./images/reply_icon.gif" />
				������ <em><s:date name="createDate" format="yyyy-MM-dd HH:mm:ss" /></em>
				<% if(u.getGroup().getId() > 1){%>
				<a href="./removeMsg?id=<s:property value="id"/>&topicId=<s:property value="topic.id"/>" onclick="return delMsg()"><font color="blue">&nbsp;&nbsp;&nbsp;ɾ��</font></a>
	             <% }%>
	       <table cellspacing="0" cellpadding="0" style="margin-top: 20px;">
	         <tr><td><s:property value="content" escape="false" /></td></tr>
	       </table>
	  </td>
	</tr>
	<tr>
		<td colspan="2"  align="right" valign="bottom" >
        <a href="./post_msg.jsp?topicId=<s:property value="topic.id"/>&toUserId=<s:property value="user.id"/>&toLayer=<s:property value="layer"/>&categoryId=<s:property value="topic.category.id"/>" title="�ظ���">
       <img src="./images/reply.png" height="35px" width="80px"/></a>
		</td>
	</tr>
	</table>
	 </s:iterator>

         <s:url id="url_pre" value="allMsgs.action">  
            <s:param name="topicId" value="topicId"></s:param> 
             <s:param name="pageNo" value="pageNo-1"></s:param>   
           </s:url>  
          <s:url id="url_next" value="allMsgs.action">  
          <s:param name="topicId" value="topicId"></s:param>  
              <s:param name="pageNo" value="pageNo+1"></s:param>  
         </s:url>  
         
          <s:url id="url_end" value="allMsgs.action">  
          <s:param name="topicId" value="topicId"></s:param>  
              <s:param name="pageNo" value="msgPageCount"></s:param>  
         </s:url>
         <s:url id="url_start" value="allMsgs.action"> 
         <s:param name="topicId" value="topicId"></s:param>   
              <s:param name="pageNo" value="1"></s:param>  
         </s:url>
         <s:url id="back_list" value="allTopics.action">
          <s:param name="categoryId" value="%{topic.category.id}"/>
           <s:param name="pageNo" value="1"/>
         </s:url>
         
         <s:a  href="%{back_list}"><s:text name="[�����б�]"/></s:a>
            <s:a href="%{url_start}"><s:text name="[��ҳ]"/></s:a>
            <s:a href="%{url_pre}"><s:text name="[��һҳ]"/></s:a>
          
           <s:text name="/"/>
         <s:a href="%{url_next}"><s:text name="[��һҳ]"/></s:a>
          <s:a href="%{url_end}"><s:text name="[ĩҳ]"/></s:a>  
           <a name="down"/>
       
       <form method="post" action="addMsg.action?toLayerUserId=<s:property value="topic.user.id"/>&topicId=<s:property value="topic.id"/>">
        <div style="position:relative;left:100px;margin-top: 15px">
       <textarea name="content" style="max-width:700px;min-width:700px;min-height:300px;" class="xheditor"></textarea>
         <br/>
         <br/>
         </div>
         <div style="position:relative;left:-220px;">
         <input type="submit" value="����ظ�"/>
         </div>
       </form> 
   
   </div>
   </body>
<s:include value="/footer.jsp"></s:include>
</html>


