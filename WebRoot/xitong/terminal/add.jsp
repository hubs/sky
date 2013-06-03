<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.jzero.util.*,com.jzero.tag.T,com.jzero.core.*"%>
<jsp:include page="/comm/jsp/add_top.jsp">
	<jsp:param name="SHOW_KIND" value="true" />
</jsp:include>
	<%=T.add_table(4) %>
		<%=T.tr() %><%=T.td_l("20%","终端编号","zdbh") %><%=T.td(3,T.input_other("zdbh"," class='validate[required]'  onchange='exists(\"zdbh\",\"wz_terminal\",\"此终端编号已存在.\")'"))%><%=T.tr_close() %>
		<%=T.tr() %>
			<%=T.td_l("经度","longitude") %><%=T.td(T.input_must_style("longitude","width:120px")) %>
			<%=T.td_l("纬度","latitude") %><%=T.td(T.input_must_style("latitude","width:120px")) %>
		<%=T.tr_close() %>
		<%=T.tr() %><%=T.td_l("描述","bz") %><%=T.td(3,T.textarea_kind_no("bz",180)) %><%=T.tr_close() %>
	<%=T.tr_space(4) %>
	<%=T. table_close_form() %>
<%=T.alert() %>
<%=T.kind_js("bz") %>
<%=T.end() %>
