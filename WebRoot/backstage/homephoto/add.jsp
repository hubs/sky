<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.jzero.util.*,com.jzero.tag.T,com.jzero.core.*"%>
<%=T.js("js/My97DatePicker/WdatePicker.js") %>
<jsp:include page="/comm/jsp/add_top.jsp">
	<jsp:param name="SHOW_KIND" value="true" />
	<jsp:param name="BOOL_FILE" value="true" />
</jsp:include>
	<%=T.add_table() %>
		<%=T.tr() %><%=T.td_l("20%","标题","title") %><%=T.td() %><%=T.input_must_style("title","width:320px;")%><%=T.td_close() %><%=T.tr_close() %>
		<%=T.tr() %><%=T.td_l("图片","path")%><%=T.td(T.img_single("path"))%><%=T.tr_close() %>
		<%=T.tr() %><%=T.td_l("内容","content") %><%=T.td(T.textarea_kind_no("content",230)) %><%=T.tr_close() %>
		<%=T.tr() %><%=T.td_l("添加时间","pubdate")%><%=T.td(T.time_must("pubdate",MDate.get_ymd_hms())) %><%=T.tr_close() %>
		<%=T.tr_space() %>
	<%=T. table_close_form() %>
<%=T.alert() %>
<%=T.js_auto("title","tag") %>
<%=T.kind_js("content") %>
<%=T.end() %>
