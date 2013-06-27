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
        
         <div style=" float:left;"><a href="#">主题</a>
         </div>
          <div style="position: relative;left:10px;"> <a href="#">个人资料</a></div>
         

            <div >
             <h4 >
               <s:property value="user.username"/>(UID: <font color="red"><s:property value="user.id"/></font>)
             </h4>
            </div> 
             <div >
            <em>性 别&nbsp;&nbsp;</em><s:property value="user.sex"/>
              </div>
              <div >
            <em>个人简介&nbsp;&nbsp;</em><s:property value="user.bz"/>
              </div>
              <div >
            <em>联系电话&nbsp;&nbsp;</em><s:property value="user.phone.substring(0,3)"/>********
              </div>
               <div >
            <em>电子邮件&nbsp;&nbsp;</em><s:property value="user.email"/>
              </div>
              <div >
            <em>地 址&nbsp;&nbsp;</em>保密
              </div>
               <div >
            <em>用户状态&nbsp;&nbsp;</em><s:if test="%{user.status==0}">正常</s:if><s:if test="%{user.status==1}">已锁定</s:if>
              </div>
               <div >
           <h4>验证信息</h4>
               </div>
              <div >
              <em>邮箱状态&nbsp;&nbsp;</em>已验证&nbsp;&nbsp;
              <em>实名认证&nbsp;&nbsp;</em>未认证
             </div>

           <div >
           <h4>活跃概况</h4>
          </div>
            <div >
              <em >管理组&nbsp;&nbsp;</em>
              <span style="color:#FF0000"><a href="#" ><font color="#FF0000">超级版主</font></a></span> 
              <img src="./images/admin_1.gif" />
             </div>
            <div >
            <em class="xg1">用户组&nbsp;&nbsp;</em>
              <span style="color:blue"><a href="#" ><font color="blue">分区版主-H</font></a></span>
               <img src="./images/admin_2.gif" class="vm" /> 
            </div>
          
         <div >
          <em>最后访问&nbsp;&nbsp;</em><s:date name="user.lastVisitTime" format="yyyy-MM-dd HH:mm"/> 
          <em>所在时区&nbsp;&nbsp;</em>使用系统默认 
        </div>
        
        <div >
         <h4>统计信息</h4>
         <em>积分&nbsp;</em><s:property value="user.score"/> 
         <a href="#" ><em>&nbsp;回帖数&nbsp; </em><s:property value="user.msgNum"/>
         </a><a href="#" ><em>&nbsp;主题数&nbsp;</em><s:property value="user.msgNum"/></a>
	   </div> 
     </div>
          
        
        
  </body>
</html>
