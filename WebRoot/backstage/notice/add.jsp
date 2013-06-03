<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.jzero.util.*,com.jzero.tag.T,com.jzero.core.*"%>
<jsp:include page="/comm/jsp/add_top.jsp">
	<jsp:param name="SHOW_KIND" value="true" />
</jsp:include>
	<%=T.add_table() %>
		<%=T.tr() %><%=T.td_l("20%","公告标题","title") %><%=T.td(T.input_must_style("title","width:280px")) %><%=T.tr_close() %>
		<%=T.tr() %><%=T.td_l("公告时间","inserttime") %><%=T.td(T.time_must_ymd("inserttime",MDate.get_ymd_hms())) %><%=T.tr_close() %>
		<%=T.tr() %><%=T.td_l("公告内容","content") %><%=T.td(T.textarea_kind_no("content",320)) %><%=T.tr_close() %>
		<%=T.tr() %><%=T.td_l("推广关键字","tag")%><%=T.td(T.input("tag")+T.span("关键字之间请用 , 隔开")) %><%=T.tr_close() %>
	<%=T.tr_space() %>
	<%=T. table_close_form() %>
<%=T.alert() %>
<%=T.kind_js("content") %>
<%=T.js_auto("title","tag") %>
<%=T.end() %>
