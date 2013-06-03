<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.jzero.util.*,com.jzero.tag.T,com.jzero.core.*"%>
<%=T.js("js/My97DatePicker/WdatePicker.js") %>
<%@include file="/comm/js/wdate.jsp" %>
<jsp:include page="/comm/jsp/edit_top.jsp">
	<jsp:param name="SHOW_KIND" value="true" />
</jsp:include>
	 <% MRecord row=MR.me().getAttr(Msg.OBJECT); %>
	<%=T.edit_table(4) %>
		<%=T.hidden_id(row.getStr("id")) %>
		<%=T.tr() %><%=T.td_l("20%","终端编号","zdbh") %><%=T.td(3,T.input_other("zdbh",row.getStr("zdbh")," class='validate[required]'  onchange='exists(\"zdbh\",\"wz_terminal\",\"此终端编号已存在.\")'"))%><%=T.tr_close() %>
		<%=T.tr() %>
			<%=T.td_l("经度","longitude") %><%=T.td(T.input_must_style("longitude",row.getStr("longitude"),"width:120px")) %>
			<%=T.td_l("纬度","latitude") %><%=T.td(T.input_must_style("latitude",row.getStr("latitude"),"width:120px")) %>
		<%=T.tr_close() %>
		<%=T.tr() %><%=T.td_l("描述","bz") %><%=T.td(3,T.textarea_kind_no("bz",row.getStr("bz"),180)) %><%=T.tr_close() %>
		<%=T.tr_space(4) %>
	<%=T. table_close_form() %>
<%=T.kind_js("bz") %>
<%=T.end() %>
