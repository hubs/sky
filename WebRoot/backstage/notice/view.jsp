<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.jzero.util.*,com.jzero.tag.T,com.jzero.core.*"%>
<%@include file="/comm/jsp/view_top.jsp" %>
	<%=T.view_table() %>
		<%=T.tr() %><%=T.td_l("20%","公告标题","title") %><%=T.td(obj.getStr("title")) %><%=T.tr_close() %>
		<%=T.tr() %><%=T.td_l("公告时间","inserttime") %><%=T.td(obj.getStr("inserttime"))%><%=T.tr_close() %>
		<%=T.tr() %><%=T.td_l("公告内容","content") %><%=T.td(obj.getStr("content")) %><%=T.tr_close() %>
		<%=T.tr() %><%=T.td_l("推广关键字","tag")%><%=T.td(obj.getStr("tag")) %><%=T.tr_close() %>
		<%=T.tr_space(2) %>
	<%=T. table_close_form() %>
<%=T.end() %>
