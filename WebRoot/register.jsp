<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@include file="header.jsp" %>
 <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
 <head>
        <title>用户注册</title>
        </head>
    <body>
        
        <!-- section content -->
            <div class="container">
                <div class="signin-form row-fluid">
                   
                    <!--Sign Up-->
                    <div class="span5 offset2">
                        <div class="box corner-all">
                            <div class="box-header grd-green color-white corner-top">
                                <span> 加 入 我 们 </span>
                            </div>
                            <div class="box-body bg-white">
                                <form id="sign-up" action="register.action" method="post" />
                                    <div class="control-group">
                                        <label class="control-label"> 用户名 </label>
                                        <div class="controls">
                                            <input type="text" class="input-block-level" data-validate="{required: true, messages:{required:'Please enter field username'}}" name="username" id="username" />
                                            <p class="help-block muted helper-font-small">可以包含数字、字母和下划线，长度为6-20</p>
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label"> 邮  箱 </label>
                                        <div class="controls">
                                            <input type="text" class="input-block-level" data-validate="{required: true, email:true, messages:{required:'Please enter field email', email:'Please enter a valid email address'}}" name="email" id="email" />
                                            <p class="help-block muted helper-font-small"><strong>注：</strong> 您将收到一封确认邮件</p>
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label"> 密  码 </label>
                                        <div class="controls">
                                            <input type="password" class="input-block-level" data-validate="{required: true, minlength: 6, messages:{required:'Please enter field password', minlength:'Please enter at least 6 characters.'}}" name="psd" id="password"  />
                                            <p class="help-block muted helper-font-small">规则同用户名，越长越好</p>
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label"> 姓  名 </label>
                                        <div class="controls">
                                            <input type="text" class="input-block-level" data-validate="{required: true, equalTo: '#password', messages:{required:'Please enter field confirm password', equalTo: 'confirmation password does not match the password'}}" name="name" id="name"  />
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label">联系电话</label>
                                        <div class="controls">
                                            <input type="text" class="input-block-level" data-validate="{required: true, equalTo: '#password', messages:{required:'Please enter field confirm password', equalTo: 'confirmation password does not match the password'}}" name="phone" id="phone"  />
                                        </div>
                                    </div>
                                  <div class="control-group">
		                            <label class="control-label">性  别</label>
		                           <label><input type="radio" name="sex" value="男" /><span class="helper-font-small">  男  </span></label>
		                             <label><input type="radio" name="sex" value="女" /><span class="helper-font-small">  女  </span></label> 
	                               </div>
                                    <div class="control-group">
                                        <label class="control-label"> 地  址 </label>
                                        <div class="controls">
                                           <!--  <input type="text" class="input-block-level" data-validate="{required: true, equalTo: '#password', messages:{required:'Please enter field confirm password', equalTo: 'confirmation password does not match the password'}}" name="addr" id="addr"  /> -->
                                           <select id="addr" name="addr"  class="input-block-level" ><option value="">-省份-</option>
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
                                        <label class="control-label">个人说明</label>
                                        <div class="controls">
                                            <input type="text" class="input-block-level" data-validate="{required: true, equalTo: '#password', messages:{required:'Please enter field confirm password', equalTo: 'confirmation password does not match the password'}}" name="bz"   />
                                        </div>
                                    </div>
                                    <div class="form-actions">
                                        <input type="submit" class="btn btn-primary" value=" 注  册  " />
                                        <input type="reset" class="btn " value=" 重  置  " />
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
