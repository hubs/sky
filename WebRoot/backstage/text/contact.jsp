<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.jzero.util.*,com.jzero.tag.T,com.jzero.core.*"%>
<jsp:include page="/comm/jsp/add_top.jsp">
	<jsp:param name="SHOW_KIND" value="true" />
	<jsp:param name="SHOW_BACK" value="false" />
	<jsp:param name="SAVE_URI" value="backstage/text/save_contact" />
</jsp:include>
	<% String content=MR.me().getAttr("content"); %>
	<%=T.add_table("\"联系我们\" 频道内容",2) %>
		<%=T.tr() %><%=T.td_l("内容","content") %><%=T.td(T.textarea_kind_no("content",content,420)) %><%=T.tr_close() %>
		<%=T.tr_space() %>
	<%=T. table_close_form() %>
<%=T.alert() %>
<%=T.kind_js("content") %>
<%=T.end() %>
