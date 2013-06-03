<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.jzero.util.*,com.jzero.tag.T,com.jzero.core.*"%>
<%=T.head("查看页面",MTool.getBase()) %>
	<%@include file="../js/base.jsp" %>
 <%=T.head_end() %>
  <body>
	<table width="98%" border="0" cellpadding="0" cellspacing="1" bgcolor="#D1DDAA" align="center">
	<tr>
	 <td class="top_title">
	 	<%=T.button("返回","go_back()") %>
	 </td>
	</tr>
</table>
<%	MRecord obj=MR.me().getAttr(Msg.OBJECT);  %>
  
  