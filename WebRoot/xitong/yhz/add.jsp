<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.jzero.util.*,com.jzero.tag.T,com.jzero.core.*"%>
<jsp:include page="/comm/jsp/add_top.jsp"></jsp:include>
	<%=T.add_table() %>
		<%=T.tr() %><%=T.td_l_must("20%","代码","dm") %><%=T.td() %><%=T.input_must_int("dm")%><%=T.td_close() %><%=T.tr_close() %>
		<%=T.tr() %><%=T.td_l_must("名称","mc") %><%=T.td(T.input_must("mc")) %><%=T.tr_close() %>
		<%=T.tr() %><%=T.td_l("排序","px")%><%=T.td(T.input_style_int("px","width:60px")) %><%=T.tr_close() %>
		<%=T.tr_space() %>
	<%=T. table_close_form() %>
<%=T.alert() %>
<%=T.end() %>
