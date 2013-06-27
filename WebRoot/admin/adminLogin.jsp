<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@include file="../header.jsp" %>
 <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
 <head>
 <title>用户登录</title>
  </head>
    <body>
            <div class="container">
                <div class="signin-form row-fluid">
        <!-- section content -->
                    <!--Sign In-->
                    <div class="span5 offset2">
                        <div class="box corner-all">
                            <div class="box-header grd-teal color-white corner-top">
                                <span>管理员登录</span>
                            </div>
                            <div class="box-body bg-white">
                                <s:form action="adminLogin.action" method="post" namespace="/admin">
                                    <div class="control-group">
                                        <label class="control-label">管理员账号</label>
                                        <div class="controls">
                                            <input type="text" class="input-block-level" data-validate="{required: true, messages:{required:'请输入用户名！'}}" name="username" id="username" />
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label">密码</label>
                                        <div class="controls">
                                            <input type="password" class="input-block-level" data-validate="{required: true, messages:{required:'请输入密码！'}}" name="psd" id="password"  />
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="checkbox">
                                            <input type="checkbox" data-form="uniform" name="remember_me" id="remember_me_yes" value="yes" /> 记住我
                                        </label>
                                    </div>
                                    <div class="form-actions">
                                        <input type="submit" class="btn  btn-primary  " value=" 登   录 " />
                                        <input type="reset" class="btn  " value=" 重   置 " />
                                    </div>
                                </s:form>
                            </div>
                        </div>
                    </div>
                    </div></div>
</body>
   <jsp:include page="../footer.jsp" />
</html>
