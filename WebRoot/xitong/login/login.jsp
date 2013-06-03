<%@ page language="java"  contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@page import="com.jzero.tag.T" %>
<!DOCTYPE html PUBliC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>用户登录</title>
<link href="<%=basePath %>css/login/User_Login.css" rel="stylesheet" type="text/css"/>
<script>
function check(){
   var username_obj = document.getElementById("username");
   
   if(username_obj.value==""){
     alert("请输入用户名！");
     username_obj.focus();
     return false;
   }
   var userpassword_obj = document.getElementById("userpass");
   if(userpassword_obj.value==""){
     alert("请输入密码！");
     userpassword_obj.focus();
     return false;
   }
     var key_obj = document.getElementById("key");
   if(key_obj.value==""){
     alert("请输入验证码！");
     key_obj.focus();
     return false;
   }  
  return true;	  
}
</script>
</head>
<body id="userlogin_body">
<%=T.form_open_m("xitong/login/login","return check()") %>
<div id="user_login">
<dl>

  <dd id="user_top">
  <ul>
    <li class="user_top_l"></li>
    <li class="user_top_c"></li>
    <li class="user_top_r"></li>
  </ul>
  </dd>
  <dd id="user_main">
  <ul>
    <li class="user_main_l"></li>
    <li class="user_main_c">
    <div class="user_main_box">
    <br/>
    <ul>
      <li class="user_main_text">用户名</li> 
      <li class="user_main_input"><input class="TxtUserNameCssClass" =  maxlength="20" name="username" id="username" />
       </li>
    </ul>
    <ul>
      <li class="user_main_text">密  码</li>
      <li class="user_main_input"><input class="TxtPasswordCssClass" type="password" name="userpass" id="userpass"/>
       </li>
      </ul>
      <ul>
      <li class="user_main_text"> 验证码:</li>
      <li class="user_main_input">
        <input type="text" name="rand" class="TxtValidateCodeCssClass"  maxlength="4" id="key"/>
        <span style="padding-left: 30px;"><img src="<%=request.getContextPath()%>/Image" alt="验证码"  id="safecode"  onclick="reloadVerifyCode();" title="刷新"/></span>
       </li>
      </ul>
    </div>
    </li>
    <li class="user_main_r">
      <input class="IbtnEnterCssClass" id="IbtnEnter" style="BORDER-TOP-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-RIGHT-WIDTH: 0px" type="image" src="<%=basePath %>images/login/user_botton.gif" name="IbtnEnter"/> 
    </li>
  </ul>
 </dd>
  <dd id="user_bottom">
  <ul>
    <li class="user_bottom_l"></li>
    <li class="user_bottom_c"></li>
    <li class="user_bottom_r"></li> 
   </ul>
  </dd>
</dl>
</div>
<%=T.form_close() %>
  <script type="text/javascript">
        var Sys = {};
        var ua = navigator.userAgent.toLowerCase();
        window.ActiveXObject ? Sys.ie = ua.match(/msie ([\d.]+)/)[1] :
        document.getBoxObjectFor ? Sys.firefox = ua.match(/firefox\/([\d.]+)/)[1] :
        window.MessageEvent && !document.getBoxObjectFor ? Sys.chrome = ua.match(/chrome\/([\d.]+)/)[1] :
        window.opera ? Sys.opera = ua.match(/opera.([\d.]+)/)[1] :
        window.openDatabase ? Sys.safari = ua.match(/version\/([\d.]+)/)[1] : 0;
     if (window.self != window.parent) {
        if(Sys.ie){ 
            window.top.location.href("<%=basePath%>");
        }else{
            window.top.location.reload();
        }
    }
    
    function reloadVerifyCode(){document.getElementById("safecode").src="<%=request.getContextPath()%>/Image?d="	+ new Date().getTime();}
<% 
	Object message=request.getAttribute("MESSAGE");
	if(message!=null){
		out.write("alert('"+message+"')");
	}
%>
</script>
</body>
</html>