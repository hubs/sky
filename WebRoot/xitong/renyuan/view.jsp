<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.jzero.util.*,com.jzero.tag.T,com.jzero.core.*"%>
<%@include file="/comm/jsp/view_top.jsp" %>
	<%=T.view_table(4) %>
		<%=T.tr() %><%=T.td_l("20%","用户组","name") %><%=T.td(3,obj.getStr("yhzmc")) %><%=T.tr_close() %>
		<%=T.tr() %><%=T.td_l("编号","bh")%><%=T.td(obj.getStr("bh")) %><%=T.td_l("姓名","xm")%><%=T.td(obj.getStr("xm")) %><%=T.tr_close() %>
		<%=T.tr() %><%=T.td_l("登录显示名","dlm") %><%=T.td(3,obj.getStr("dlm")) %><%=T.tr_close() %>
		<%=T.tr() %><%=T.td_l("手机","sj")%><%=T.td(obj.getStr("sj")) %><%=T.td_l("邮箱","dzyj")%><%=T.td(obj.getStr("dzyj")) %><%=T.tr_close() %>
		<%=T.tr() %><%=T.td_l("排序","px")%><%=T.td(3,obj.getStr("px")) %><%=T.tr_close() %>
		<%=T.tr_space(4) %>
	<%=T. table_close_form() %>
<%=T.end() %>
