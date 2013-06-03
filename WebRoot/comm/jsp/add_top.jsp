<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.jzero.util.*,com.jzero.tag.T,com.jzero.core.*"%>
<%=T.head("新增页面",MTool.getBase()) %>
 <%  
	boolean show_kind=MR.me().getParaToBoolean(request,Msg.SHOW_KIND,false);
	boolean show_back=MR.me().getParaToBoolean(request,Msg.SHOW_BACK,true);
	boolean bool_upfile=MR.me().getParaToBoolean(request,"BOOL_FILE",false);//是否是上传表单
	String  save_name=MR.me().getPara(request,"SAVE_NAME");
	String  save_uri =MR.me().getPara(request,"SAVE_URI");
	String 	save_msg =MR.me().getPara(request,"SAVE_MSG");
	String  back_uri =MR.me().getPara(request,"BACK_URI",null);
	
	save_name=MCheck.isNull(save_name)?"保存":save_name;
	save_msg =MCheck.isNull(save_msg)?"确认保存操作?":save_msg;
 %>
	<%@include file="../js/base.jsp" %>
	<% if(show_kind){ %>
		<%@include file="../js/kind.jsp" %>
	<% } %>
	<%@include file="../js/validator.jsp" %>
 <%=T.head_end() %>
  <body>
  <%
  	 if(MCheck.isNull(save_uri)){save_uri=MTool.get_path()+"/save";}
  	 if(MCheck.isNull(back_uri)){back_uri=MTool.getBase()+MTool.get_path()+"/index";}
   %>
   <%
   		if(bool_upfile){
   			out.write(T.form_open_mul(save_uri));
   		}else{
   			out.write(T.form_open(save_uri));
   		}
    %>
	<table width="98%" border="0" cellpadding="0" cellspacing="1" bgcolor="#D1DDAA" align="center">
	<tr>
	 <td class="top_title">
	 	<%=T.button(save_name,"confirms_msg('"+save_msg+"','niceform')") %>
	 	<%if(show_back){ %>
	 		<%=T.button("返回","go_to_url('"+back_uri+"')") %>
	 	<%} %>
	 </td>
	</tr>
</table>
  
  