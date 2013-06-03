<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.jzero.util.*,com.jzero.tag.T,com.jzero.core.*"%>
<%@include file="/comm/jsp/view_top.jsp" %>
	<%=T.view_table() %>
		<%=T.tr() %><%=T.td("20%","标题") %><%=T.td(obj.getStr("title")) %><%=T.tr_close()%>
		<%=T.tr() %><%=T.td_l("图片","path")%><%=T.td(T.img_show(obj.getStr("path")))%><%=T.tr_close() %>
		<%=T.tr() %><%=T.td("内容")%> <%=T.td(obj.getStr("content")) %><%=T.tr_close() %>
		<%=T.tr() %><%=T.td("添加时间")%><%=T.td(obj.getStr("pubdate")) %><%=T.tr_close() %>
		<%=T.tr_space(2) %>
	<%=T. table_close_form() %>
<%=T.end() %>
