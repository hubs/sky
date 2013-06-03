<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.jzero.util.*,com.jzero.tag.T,com.jzero.core.*"%>

<%=T.head("修改密码",MTool.getBase()) %>
<%@include file="/comm/js/base.jsp" %>
<%@include file="/comm/js/validator.jsp" %>
<%=T.head_end() %>
<body>
<%	String save_uri="xitong/renyuan/save_pass";%>
 <%=T.form_open(save_uri) %>
	<table width="98%" border="0" cellpadding="0" cellspacing="1" bgcolor="#EEF3F7" align="center">
		<tr>
		 <td class="top_title">
		 	<%=T.button("更新","confirms_msg('确认进行修改?','niceform')") %>
		 </td>
		</tr>
	</table>
	<%=T.add_table("修改密码",2) %>
		<%=T.tr() %><%=T.td_l("20%","原密码","oldpass") %><%=T.td(T.input_must("oldpass")) %><%=T.tr_close() %>
		<%=T.tr() %><%=T.td_l("新密码","newpass")%><%=T.td(T.input_must("newpass")) %><%=T.tr_close() %>
		<%=T.tr() %><%=T.td_l("确认密码","qrpass") %><%=T.td(T.input_must("qrpass")) %><%=T.tr_close() %>
		<%=T.tr_space() %>
	<%=T. table_close_form() %>
	<%=T.alert()%>
<%=T.end() %>