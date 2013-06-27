<%@ page language="java" import="java.util.*,com.zyh.po.*" pageEncoding="GBK"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%User user = (User)request.getSession().getAttribute("loginUser");
 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta name="description" content="" />
        <meta name="author" content="chinabbs" />
	 <!-- google font -->
        <link href="http://fonts.googleapis.com/css?family=Aclonica:regular" rel="stylesheet" type="text/css" />
        <!-- styles -->
        <link href="/BBS/css/bootstrap.css" rel="stylesheet" />
        <link href="/BBS/css/bootstrap-responsive.css" rel="stylesheet" />
        <link href="/BBS/css/stilearn.css" rel="stylesheet" />
        <link href="/BBS/css/stilearn-responsive.css" rel="stylesheet" />
        <link href="/BBS/css/stilearn-helper.css" rel="stylesheet" />
        <link href="/BBS/css/stilearn-icon.css" rel="stylesheet" />
        <link href="/BBS/css/font-awesome.css" rel="stylesheet" />
        <link href="/BBS/css/animate.css" rel="stylesheet" />
        <link href="/BBS/css/uniform.default.css" rel="stylesheet" />
  </head>
  <body>
   <!-- section header -->
        <div class="header" data-spy="affix" data-offset-top="0">
            <div class="navbar-helper">
                    <!--panel site-name-->
                        <div class="panel-sitename" style=" width:60%;float: left;">
                            <h2><a href="/BBS/allCategories.action?pageNo=1"><span class="color-teal">China</span>BBS</a></h2>
                        </div>
                            <div   style="margin-top: 20px">
                                <% if(user != null){%>
                                   <h4 ><a href="/BBS/showUser.action?id=<%=user.getId() %>&flag=1" ><font color="#FF6347" > <%=user.getUsername() %></font></a>
                                       |<a href="/BBS/showUser.action?id=<%=user.getId() %>&flag=2" > <font color="#40E0D0">&nbsp;&nbsp;Éè&nbsp;ÖÃ</font></a>
                                       |<a href="/BBS/exit.action" ><font color="#B3EE3A" > &nbsp;&nbsp;ÍË&nbsp;³ö</font></a>
                                      </h4>
                                <% }else{ %>
                                 <a class="btn btn-primary  "  href="/BBS/login.jsp">&nbsp;&nbsp;µÇ&nbsp; Â¼&nbsp;&nbsp; </a>
                                  <a class="btn btn-success "  href="/BBS/register.jsp" >&nbsp;&nbsp;×¢&nbsp; ²á&nbsp;&nbsp;</a>
                                <% } %>
                            </div>
            </div><!--/nav bar helper-->
        </div>
  </body>
</html>
