<%@ page language="java" import="java.util.*,com.zyh.po.*" pageEncoding="GBK"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@include file="/header.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
	<title>update</title>
  </head>
  <body>
     <div class="container">
                <div class="signin-form row-fluid">
                    <div class="span5 offset2">
                        <div class="box corner-all">
                            <div class="box-header grd-red color-white corner-top">
                                <span> 个 人 资 料 </span>
                            </div>
                            <div class="box-body bg-white">
       <form action="updateUser.action" method="post">
      <div class="control-group">
          <label class="control-label"> ID </label>
              <div class="controls">
                   <input type="text" class="grd-white" value="<s:property value="user.id" />"name="id"  readonly="readonly"/>
               </div>
        </div>
       <div class="control-group">
          <label class="control-label"> 用户名 </label>
              <div class="controls">
                   <input type="text" class="grd-white" value="<s:property value="user.username"/>" name="username"  readonly="readonly"/>
               </div>
        </div>
        <div class="control-group">
          <label class="control-label"> 密码 </label>
              <div class="controls">
                   <input type="text" class="grd-white" value="<s:property value="user.psd"/>" name="psd" />
               </div>
        </div>
        <div class="control-group">
          <label class="control-label"> 姓名 </label>
              <div class="controls">
                   <input type="text" class="grd-white" value="<s:property value="user.name"/>" name="name" />
               </div>
        </div>
        <div class="control-group">
          <label class="control-label"> 性别 </label>
              <div class="controls" >
               <select name="sex" id="sex" style="width: 206px">
               <option value="<s:property value="user.sex"/>"><s:property value="user.sex"/></option>
               <option id="1" value="男">男</option> 
                <option id="2" value="女">女</option>
                </select>
                </div>
         </div>
       <div class="control-group">
          <label class="control-label"> 电话 </label>
              <div class="controls">
                   <input type="text" class="grd-white" value="<s:property value="user.phone"/>" name="phone" />
               </div>
        </div>
        <div class="control-group">
          <label class="control-label"> 电子邮件 </label>
              <div class="controls">
                   <input type="text" class="grd-white" value="<s:property value="user.email"/>" name="email" />
               </div>
        </div>
        <div class="control-group">
          <label class="control-label"> 居住地址 </label>
              <div class="controls">
        <select name="addr" id="addr" style="width: 206px">
        <option value="<s:property value="user.addr"/>"><s:property value="user.addr"/></option>
        <option id="1" value="北京市">北京市</option>
        <option id="2" value="天津市">天津市</option>
        <option id="3" value="河北省">河北省</option>
        <option id="4" value="山西省">山西省</option>
        <option id="5" value="内蒙古自治区">内蒙古自治区</option>
        <option id="6" value="辽宁省">辽宁省</option>
        <option id="7" value="吉林省">吉林省</option>
        <option id="8" value="黑龙江省">黑龙江省</option>
        <option id="9" value="上海市">上海市</option>
        <option id="10" value="江苏省">江苏省</option>
        <option id="11" value="浙江省">浙江省</option>
        <option id="12" value="安徽省">安徽省</option>
        <option id="13" value="福建省">福建省</option>
        <option id="14" value="江西省">江西省</option>
        <option id="15" value="山东省">山东省</option>
        <option id="16" value="河南省">河南省</option>
        <option id="17" value="湖北省">湖北省</option>
        <option id="18" value="湖南省">湖南省</option>
        <option id="19" value="广东省">广东省</option>
        <option id="20" value="广西壮族自治区">广西壮族自治区</option>
        <option id="21" value="海南省">海南省</option>
        <option id="22" value="重庆市">重庆市</option>
        <option id="23" value="四川省">四川省</option>
        <option id="24" value="贵州省">贵州省</option>
        <option id="25" value="云南省">云南省</option>
        <option id="26" value="西藏自治区">西藏自治区</option>
        <option id="27" value="陕西省">陕西省</option>
        <option id="28" value="甘肃省">甘肃省</option>
        <option id="29" value="青海省">青海省</option>
        <option id="30" value="宁夏回族自治区">宁夏回族自治区</option>
        <option id="31" value="新疆维吾尔自治区">新疆维吾尔自治区</option>
        <option id="32" value="台湾省">台湾省</option>
        <option id="33" value="香港特别行政区">香港特别行政区</option>
        <option id="34" value="澳门特别行政区">澳门特别行政区</option>
        <option id="35" value="海外">海外</option>
        <option id="36" value="其他">其他</option>
        </select>
            </div>
        </div>
        <div class="control-group">
          <label class="control-label"> 个人简介 </label>
              <div class="controls">
              <textarea  name="bz" style="min-height: 100px;min-width: 206px;max-width: 206px;"><s:property value="user.bz"/></textarea>
              </div>
          </div>
         <input type="submit" class="btn  btn-primary" value=" 提  交  " />
         <input type="reset" class="btn" value=" 重  置  " />
        
      
	   </form> 
     </div></div></div></div></div>
  </body>
</html>
