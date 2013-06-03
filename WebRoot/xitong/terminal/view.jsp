<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.jzero.util.*,com.jzero.tag.T,com.jzero.core.*"%>
<%@include file="/comm/jsp/view_top.jsp" %>
	<%=T.view_table(4) %>
		<%=T.tr() %><%=T.td_l("20%","终端编号","zdbh") %><%=T.td(3,obj.getStr("zdbh"))%><%=T.tr_close() %>
		<%=T.tr() %>
			<%=T.td_l("经度","longitude") %><%=T.td(obj.getStr("longitude")) %>
			<%=T.td_l("纬度","latitude") %><%=T.td(obj.getStr("latitude")) %>
		<%=T.tr_close() %>
		<%=T.tr() %>
			<%=T.td_l("最后登录时间","logintime") %><%=T.td(obj.getStr("logintime")) %>
			<%=T.td_l("登录IP","ip") %><%=T.td(obj.getStr("ip")) %>
		<%=T.tr_close() %>
		<%=T.tr() %><%=T.td_l("描述","bz") %><%=T.td(3,obj.getStr("bz")) %><%=T.tr_close() %>
		<%=T.tr_space(4) %>
	<%=T. table_close_form() %>
<%=T.end() %>
