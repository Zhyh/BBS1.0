<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@include file="../header.jsp" %>
 <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
 <head>
 <title>�û���¼</title>
  </head>
    <body>
            <div class="container">
                <div class="signin-form row-fluid">
        <!-- section content -->
                    <!--Sign In-->
                    <div class="span5 offset2">
                        <div class="box corner-all">
                            <div class="box-header grd-teal color-white corner-top">
                                <span>����Ա��¼</span>
                            </div>
                            <div class="box-body bg-white">
                                <s:form action="adminLogin.action" method="post" namespace="/admin">
                                    <div class="control-group">
                                        <label class="control-label">����Ա�˺�</label>
                                        <div class="controls">
                                            <input type="text" class="input-block-level" data-validate="{required: true, messages:{required:'�������û�����'}}" name="username" id="username" />
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label">����</label>
                                        <div class="controls">
                                            <input type="password" class="input-block-level" data-validate="{required: true, messages:{required:'���������룡'}}" name="psd" id="password"  />
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="checkbox">
                                            <input type="checkbox" data-form="uniform" name="remember_me" id="remember_me_yes" value="yes" /> ��ס��
                                        </label>
                                    </div>
                                    <div class="form-actions">
                                        <input type="submit" class="btn  btn-primary  " value=" ��   ¼ " />
                                        <input type="reset" class="btn  " value=" ��   �� " />
                                    </div>
                                </s:form>
                            </div>
                        </div>
                    </div>
                    </div></div>
</body>
   <jsp:include page="../footer.jsp" />
</html>
