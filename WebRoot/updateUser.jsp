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
                                <span> �� �� �� �� </span>
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
          <label class="control-label"> �û��� </label>
              <div class="controls">
                   <input type="text" class="grd-white" value="<s:property value="user.username"/>" name="username"  readonly="readonly"/>
               </div>
        </div>
        <div class="control-group">
          <label class="control-label"> ���� </label>
              <div class="controls">
                   <input type="text" class="grd-white" value="<s:property value="user.psd"/>" name="psd" />
               </div>
        </div>
        <div class="control-group">
          <label class="control-label"> ���� </label>
              <div class="controls">
                   <input type="text" class="grd-white" value="<s:property value="user.name"/>" name="name" />
               </div>
        </div>
        <div class="control-group">
          <label class="control-label"> �Ա� </label>
              <div class="controls" >
               <select name="sex" id="sex" style="width: 206px">
               <option value="<s:property value="user.sex"/>"><s:property value="user.sex"/></option>
               <option id="1" value="��">��</option> 
                <option id="2" value="Ů">Ů</option>
                </select>
                </div>
         </div>
       <div class="control-group">
          <label class="control-label"> �绰 </label>
              <div class="controls">
                   <input type="text" class="grd-white" value="<s:property value="user.phone"/>" name="phone" />
               </div>
        </div>
        <div class="control-group">
          <label class="control-label"> �����ʼ� </label>
              <div class="controls">
                   <input type="text" class="grd-white" value="<s:property value="user.email"/>" name="email" />
               </div>
        </div>
        <div class="control-group">
          <label class="control-label"> ��ס��ַ </label>
              <div class="controls">
        <select name="addr" id="addr" style="width: 206px">
        <option value="<s:property value="user.addr"/>"><s:property value="user.addr"/></option>
        <option id="1" value="������">������</option>
        <option id="2" value="�����">�����</option>
        <option id="3" value="�ӱ�ʡ">�ӱ�ʡ</option>
        <option id="4" value="ɽ��ʡ">ɽ��ʡ</option>
        <option id="5" value="���ɹ�������">���ɹ�������</option>
        <option id="6" value="����ʡ">����ʡ</option>
        <option id="7" value="����ʡ">����ʡ</option>
        <option id="8" value="������ʡ">������ʡ</option>
        <option id="9" value="�Ϻ���">�Ϻ���</option>
        <option id="10" value="����ʡ">����ʡ</option>
        <option id="11" value="�㽭ʡ">�㽭ʡ</option>
        <option id="12" value="����ʡ">����ʡ</option>
        <option id="13" value="����ʡ">����ʡ</option>
        <option id="14" value="����ʡ">����ʡ</option>
        <option id="15" value="ɽ��ʡ">ɽ��ʡ</option>
        <option id="16" value="����ʡ">����ʡ</option>
        <option id="17" value="����ʡ">����ʡ</option>
        <option id="18" value="����ʡ">����ʡ</option>
        <option id="19" value="�㶫ʡ">�㶫ʡ</option>
        <option id="20" value="����׳��������">����׳��������</option>
        <option id="21" value="����ʡ">����ʡ</option>
        <option id="22" value="������">������</option>
        <option id="23" value="�Ĵ�ʡ">�Ĵ�ʡ</option>
        <option id="24" value="����ʡ">����ʡ</option>
        <option id="25" value="����ʡ">����ʡ</option>
        <option id="26" value="����������">����������</option>
        <option id="27" value="����ʡ">����ʡ</option>
        <option id="28" value="����ʡ">����ʡ</option>
        <option id="29" value="�ຣʡ">�ຣʡ</option>
        <option id="30" value="���Ļ���������">���Ļ���������</option>
        <option id="31" value="�½�ά���������">�½�ά���������</option>
        <option id="32" value="̨��ʡ">̨��ʡ</option>
        <option id="33" value="����ر�������">����ر�������</option>
        <option id="34" value="�����ر�������">�����ر�������</option>
        <option id="35" value="����">����</option>
        <option id="36" value="����">����</option>
        </select>
            </div>
        </div>
        <div class="control-group">
          <label class="control-label"> ���˼�� </label>
              <div class="controls">
              <textarea  name="bz" style="min-height: 100px;min-width: 206px;max-width: 206px;"><s:property value="user.bz"/></textarea>
              </div>
          </div>
         <input type="submit" class="btn  btn-primary" value=" ��  ��  " />
         <input type="reset" class="btn" value=" ��  ��  " />
        
      
	   </form> 
     </div></div></div></div></div>
  </body>
</html>
