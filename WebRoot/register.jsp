<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@include file="header.jsp" %>
 <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
 <head>
        <title>�û�ע��</title>
        </head>
    <body>
        
        <!-- section content -->
            <div class="container">
                <div class="signin-form row-fluid">
                   
                    <!--Sign Up-->
                    <div class="span5 offset2">
                        <div class="box corner-all">
                            <div class="box-header grd-green color-white corner-top">
                                <span> �� �� �� �� </span>
                            </div>
                            <div class="box-body bg-white">
                                <form id="sign-up" action="register.action" method="post" />
                                    <div class="control-group">
                                        <label class="control-label"> �û��� </label>
                                        <div class="controls">
                                            <input type="text" class="input-block-level" data-validate="{required: true, messages:{required:'Please enter field username'}}" name="username" id="username" />
                                            <p class="help-block muted helper-font-small">���԰������֡���ĸ���»��ߣ�����Ϊ6-20</p>
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label"> ��  �� </label>
                                        <div class="controls">
                                            <input type="text" class="input-block-level" data-validate="{required: true, email:true, messages:{required:'Please enter field email', email:'Please enter a valid email address'}}" name="email" id="email" />
                                            <p class="help-block muted helper-font-small"><strong>ע��</strong> �����յ�һ��ȷ���ʼ�</p>
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label"> ��  �� </label>
                                        <div class="controls">
                                            <input type="password" class="input-block-level" data-validate="{required: true, minlength: 6, messages:{required:'Please enter field password', minlength:'Please enter at least 6 characters.'}}" name="psd" id="password"  />
                                            <p class="help-block muted helper-font-small">����ͬ�û�����Խ��Խ��</p>
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label"> ��  �� </label>
                                        <div class="controls">
                                            <input type="text" class="input-block-level" data-validate="{required: true, equalTo: '#password', messages:{required:'Please enter field confirm password', equalTo: 'confirmation password does not match the password'}}" name="name" id="name"  />
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label">��ϵ�绰</label>
                                        <div class="controls">
                                            <input type="text" class="input-block-level" data-validate="{required: true, equalTo: '#password', messages:{required:'Please enter field confirm password', equalTo: 'confirmation password does not match the password'}}" name="phone" id="phone"  />
                                        </div>
                                    </div>
                                  <div class="control-group">
		                            <label class="control-label">��  ��</label>
		                           <label><input type="radio" name="sex" value="��" /><span class="helper-font-small">  ��  </span></label>
		                             <label><input type="radio" name="sex" value="Ů" /><span class="helper-font-small">  Ů  </span></label> 
	                               </div>
                                    <div class="control-group">
                                        <label class="control-label"> ��  ַ </label>
                                        <div class="controls">
                                           <!--  <input type="text" class="input-block-level" data-validate="{required: true, equalTo: '#password', messages:{required:'Please enter field confirm password', equalTo: 'confirmation password does not match the password'}}" name="addr" id="addr"  /> -->
                                           <select id="addr" name="addr"  class="input-block-level" ><option value="">-ʡ��-</option>
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
                                        <label class="control-label">����˵��</label>
                                        <div class="controls">
                                            <input type="text" class="input-block-level" data-validate="{required: true, equalTo: '#password', messages:{required:'Please enter field confirm password', equalTo: 'confirmation password does not match the password'}}" name="bz"   />
                                        </div>
                                    </div>
                                    <div class="form-actions">
                                        <input type="submit" class="btn btn-primary" value=" ע  ��  " />
                                        <input type="reset" class="btn " value=" ��  ��  " />
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div><!--/Sign Up-->
                </div><!-- /row -->
            </div><!-- /container -->
    </body>
    <jsp:include page="footer.jsp" />
</html>
