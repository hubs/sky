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
		<%=T.tr() %><%=T.td_l("20%","公告标题","title") %><%=T.td(T.input_must_style("title",row.getStr("title"),"width:280px")) %><%=T.tr_close() %>
		<%=T.tr() %><%=T.td_l("公告时间","inserttime") %><%=T.td(T.time_must_ymd("inserttime",row.getStr("inserttime"))) %><%=T.tr_close() %>
		<%=T.tr() %><%=T.td_l("公告内容","content") %><%=T.td(T.textarea_kind_no("content",row.getStr("content"),320)) %><%=T.tr_close() %>
		<%=T.tr() %><%=T.td_l("推广关键字","tag")%><%=T.td(T.input("tag",row.getStr("tag"))+T.span("关键字之间请用 , 隔开")) %><%=T.tr_close() %>
		<%=T.tr_space() %>
	<%=T. table_close_form() %>
<%=T.kind_js("content") %>
<%=T.js_auto("title","tag") %>
<%=T.end() %>
