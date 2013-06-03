<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.jzero.util.*,com.jzero.tag.T,com.jzero.core.*"%>
<%@include file="/comm/jsp/edit_top.jsp"%>
	 <% MRecord row=MR.me().getAttr(Msg.OBJECT); %>
	<%=T.edit_table() %>
		<%=T.hidden_id(row.getStr("id")) %>
		<%=T.tr() %><%=T.td_l("20%","代码","dm") %><%=T.td(row.getStr("dm")) %><%=T.tr_close() %>
		<%=T.tr() %><%=T.td_l_must("名称","mc") %><%=T.td(T.input("mc",row.getStr("mc"))) %><%=T.tr_close() %>
		<%=T.tr() %><%=T.td_l("排序","px")%><%=T.td(T.input("px",row.getStr("px"))) %><%=T.tr_close() %>
		<%=T.tr_space() %>
	<%=T. table_close_form() %>
<%=T.end() %>
