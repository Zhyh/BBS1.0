<%@ page language="java" import="java.util.*,com.zyh.po.*" pageEncoding="GBK"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@include file="/header.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
	<title>detail</title>
  </head>
  <body>
     <div  style="margin: 80px">
     
        <div style=" float:left;">
       <img src="./images/touxiang.png" width="50px" height="50px"/>
        </div>
       <div style="position: relative;left:10px;">
         <h4><s:property value="user.username"/></h4>
         <p>
          <a href="http://localhost:8080/BBS/showUser.action?id=<s:property value="user.id"/>" class="xg1">http://localhost:8080/BBS/showUser.action?id=<s:property value="user.id"/></a>
         </p>
       </div>
        
         <div style=" float:left;"><a href="#">����</a>
         </div>
          <div style="position: relative;left:10px;"> <a href="#">��������</a></div>
         

            <div >
             <h4 >
               <s:property value="user.username"/>(UID: <font color="red"><s:property value="user.id"/></font>)
             </h4>
            </div> 
             <div >
            <em>�� ��&nbsp;&nbsp;</em><s:property value="user.sex"/>
              </div>
              <div >
            <em>���˼��&nbsp;&nbsp;</em><s:property value="user.bz"/>
              </div>
              <div >
            <em>��ϵ�绰&nbsp;&nbsp;</em><s:property value="user.phone.substring(0,3)"/>********
              </div>
               <div >
            <em>�����ʼ�&nbsp;&nbsp;</em><s:property value="user.email"/>
              </div>
              <div >
            <em>�� ַ&nbsp;&nbsp;</em>����
              </div>
               <div >
            <em>�û�״̬&nbsp;&nbsp;</em><s:if test="%{user.status==0}">����</s:if><s:if test="%{user.status==1}">������</s:if>
              </div>
               <div >
           <h4>��֤��Ϣ</h4>
               </div>
              <div >
              <em>����״̬&nbsp;&nbsp;</em>����֤&nbsp;&nbsp;
              <em>ʵ����֤&nbsp;&nbsp;</em>δ��֤
             </div>

           <div >
           <h4>��Ծ�ſ�</h4>
          </div>
            <div >
              <em >������&nbsp;&nbsp;</em>
              <span style="color:#FF0000"><a href="#" ><font color="#FF0000">��������</font></a></span> 
              <img src="./images/admin_1.gif" />
             </div>
            <div >
            <em class="xg1">�û���&nbsp;&nbsp;</em>
              <span style="color:blue"><a href="#" ><font color="blue">��������-H</font></a></span>
               <img src="./images/admin_2.gif" class="vm" /> 
            </div>
          
         <div >
          <em>������&nbsp;&nbsp;</em><s:date name="user.lastVisitTime" format="yyyy-MM-dd HH:mm"/> 
          <em>����ʱ��&nbsp;&nbsp;</em>ʹ��ϵͳĬ�� 
        </div>
        
        <div >
         <h4>ͳ����Ϣ</h4>
         <em>����&nbsp;</em><s:property value="user.score"/> 
         <a href="#" ><em>&nbsp;������&nbsp; </em><s:property value="user.msgNum"/>
         </a><a href="#" ><em>&nbsp;������&nbsp;</em><s:property value="user.msgNum"/></a>
	   </div> 
     </div>
          
        
        
  </body>
</html>
