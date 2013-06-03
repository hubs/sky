<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.jzero.util.*,com.jzero.tag.T,com.jzero.core.*"%>
<%=T.js("js/My97DatePicker/WdatePicker.js") %>
<%@include file="/comm/js/wdate.jsp" %>
<jsp:include page="/comm/jsp/edit_top.jsp">
	<jsp:param name="SHOW_KIND" value="true" />
</jsp:include>
	 <% MRecord row=MR.me().getAttr(Msg.OBJECT); %>
	<%=T.edit_table() %>
		<%=T.hidden_id(row.getStr("id")) %>
		<%=T.tr() %><%=T.td_l("20%","标题","title") %><%=T.td() %><%=T.input_must_style("title",row.getStr("title"),"width:320px;")%><%=T.td_close() %><%=T.tr_close() %>
		<%=T.tr() %><%=T.td_l("图片","path")%><%=T.td(T.img_single("path",row.getStr("path")))%><%=T.tr_close() %>
		<%=T.tr() %><%=T.td_l("内容","content") %><%=T.td(T.textarea_kind_no("content",row.getStr("content"),230)) %><%=T.tr_close() %>
		<%=T.tr() %><%=T.td_l("添加时间","pubdate")%><%=T.td(T.time_must("pubdate",row.getStr("pubdate"))) %><%=T.tr_close() %>
		<%=T.tr_space() %>
	<%=T. table_close_form() %>
<%=T.kind_js("content") %>
<%=T.js_auto("title","tag") %>
<%=T.end() %>
