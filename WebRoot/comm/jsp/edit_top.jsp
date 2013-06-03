<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.jzero.util.*,com.jzero.tag.T,com.jzero.core.*"%>
<%=T.head("修改页面",MTool.getBase()) %>
 <%  
	boolean show_kind=MR.me().getParaToBoolean(request,Msg.SHOW_KIND,false);
	String  save_name=MR.me().getPara(request,"SAVE_NAME");
	String 	save_msg =MR.me().getPara(request,"SAVE_MSG");
	String save_uri	=MR.me().getPara(request,"SAVE_URI",null);
	save_name=MCheck.isNull(save_name)?"保存":save_name;
	save_msg =MCheck.isNull(save_msg)?"确认进行修改?":save_msg;
	
 %>
	<%@include file="../js/base.jsp" %>
	<% if(show_kind){ %>
		<%@include file="../js/kind.jsp" %>
	<% } %>
	<%@include file="../js/validator.jsp" %>
 <%=T.head_end() %>
  <body>
  <% 
  		String order_str=MR.me().getAttr(Msg.ORDER_STR); 
  		String find_str=MR.me().getAttr(Msg.FIND_STR); 
  	  	String path= MTool.get_path();
  	  	save_uri=MCheck.isNull(save_uri)?path+"/update":save_uri;
  	  	String update_uri=path+"/update/"+order_str+"/"+find_str; 
   	  	String back_uri=MTool.getBase()+"/"+path+"/index"; 
   %>
 <%=T.form_open(save_uri) %>
	<table width="98%" border="0" cellpadding="0" cellspacing="1" bgcolor="#D1DDAA" align="center">
	<tr>
	 <td class="top_title">
	 	<%=T.button(save_name,"confirms_msg('"+save_msg+"','niceform')") %>
	 	<%=T.button("返回","go_back()") %>
	 </td>
	</tr>
</table>
  
  