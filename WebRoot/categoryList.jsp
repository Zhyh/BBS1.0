<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@include file="header.jsp" %>
<%@taglib prefix="s" uri="/struts-tags" %>
<% User u = (User)request.getSession().getAttribute("loginUser");%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<title>City</title>
</head>
<body ><div align="center">
       <table cellspacing="0" cellpadding="0" frame="below" style="margin-top: 75px;margin-bottom:25px">
              <s:iterator value="cList" status="st" id="cList">
              <s:if test="#st.index % 4 == 0">
                <tr>
              </s:if>
                <td width="25%">
                    <div style="width: 66px;">
                        <a href="./allTopics.action?categoryId=<s:property value="id"/>&pageNo=1">
                            <img title="������" src="./images/city.png"  alt="<s:property value="name"/>" width="60px" height="90px"/>
                        </a>
                    </div>
                <dl style="margin-left: 20px; margin-top:10px;">
                  <dt><a title="������" href="./allTopics.action?categoryId=<s:property value="id"/>" ><s:property value="name"/></a>
                     &nbsp; &nbsp;����:<font color="red"><em >(<s:property value="todayPostNum"/>)</em></font>
                  </dt>
                    <dd>����: <em><s:property value="topicNum"/> </em>&nbsp; &nbsp;������: <em><s:property value="msgNum"/></em></dd>
                    <dd><a href="./allTopics.action?categoryId=<s:property value="id"/>">��󷢱�:<em> <s:date name="lastPostTime" format="yyyy-MM-dd HH:mm:ss" /></em></a></dd>
                    <dd>״̬:<s:if test="%{#cList.status==0}"><em>����</em></s:if>
                        <s:if test="%{#cList.status==1}"><em>������</em></s:if>
                    </dd>
                </dl>
               </td>
              <s:if test="#st.index % 4 == 3||#st.last">
   ����                        </tr>
                </s:if>             
                </s:iterator>
          </table>
          <s:url id="url_pre" value="allCategories.action">  
              <s:param name="pageNo" value="pageNo-1"></s:param>  
           </s:url>  
          <s:url id="url_next" value="allCategories.action">  
              <s:param name="pageNo" value="pageNo+1"></s:param>  
         </s:url>  
          <s:url id="url_end" value="allCategories.action">  
              <s:param name="pageNo" value="categoryPageCount"></s:param>  
         </s:url>
         <s:url id="url_start" value="allCategories.action">  
              <s:param name="pageNo" value="1"></s:param>  
         </s:url>
           <s:a href="%{url_start}"><s:text name="[��ҳ]"/></s:a>
       <s:a href="%{url_pre}"><s:text name="[��һҳ]"/></s:a>
           <s:text name="/"/>
         <s:a href="%{url_next}"><s:text name="[��һҳ]"/></s:a>
          <s:a href="%{url_end}"><s:text name="[ĩҳ]"/></s:a> 
</div></body>
<s:include value="footer.jsp"></s:include>
</html>


