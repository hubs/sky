<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.jzero.util.*,com.jzero.tag.T,com.jzero.core.*"%>
<%=T.js("js/My97DatePicker/WdatePicker.js") %>
<jsp:include page="/comm/jsp/add_top.jsp">
	<jsp:param name="SHOW_KIND" value="true" />
	<jsp:param name="SHOW_BACK" value="false" />
</jsp:include>
 	<% MRecord row=MR.me().getAttr(Msg.OBJECT); %>
	<%=T.add_table("基本设置",2) %>
		<%=T.tr() %><%=T.td_l("20%","网站标题","title") %><%=T.td() %><%=T.input_must_style("title",row.getStr("title"),"width:320px;")%><%=T.td_close() %><%=T.tr_close() %>
		<%=T.tr() %><%=T.td_l("电话","tel")%><%=T.td(T.input_style("tel",row.getStr("tel"),"width:160px"))%><%=T.tr_close() %>
		<%=T.tr() %><%=T.td_l("邮箱","phone")%><%=T.td(T.input_style("phone",row.getStr("phone"),"width:160px"))%><%=T.tr_close() %>
		<%=T.tr() %><%=T.td_l("SEO关键字","seokey")%><%=T.td(T.input_style("seokey",row.getStr("seokey"),"width:310px;")+T.span("关键字之间请用 , 隔开")) %><%=T.tr_close() %>
		<%=T.tr() %><%=T.td_l("SEO描述","seodes")%><%=T.td(T.input_style("seodes",row.getStr("seodes"),"width:310px;")+T.span("针对搜索引擎的描述")) %><%=T.tr_close() %>
		<%=T.tr() %><%=T.td_l("网站所有","owner")%><%=T.td(T.input_style("owner",row.getStr("owner"),"width:310px;")) %><%=T.tr_close() %>
		<%=T.tr() %><%=T.td_l("版权信息","copyright") %><%=T.td(T.textarea_kind_no("copyright",row.getStr("copyright"),180)) %><%=T.tr_close() %>
		<%=T.tr_space(2) %>
	<%=T. table_close_form() %>
<%=T.alert() %>
<%=T.kind_js("copyright") %>
<%=T.end() %>