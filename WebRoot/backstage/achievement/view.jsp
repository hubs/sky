<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.jzero.util.*,com.jzero.tag.T,com.jzero.core.*"%>
<%@include file="/comm/jsp/view_top.jsp" %>
<% MRecord record=MR.me().getAttr(Msg.OUT_DATAS);List<MRecord> lst=record.get("mxlst"); %>
	<%=T.view_table() %>
		<%=T.tr() %><%=T.td_l("分类","types")%><%=T.td(obj.getStr("types"))%><%=T.tr_close() %>
		<%=T.img_mul_show(lst) %>
		<%=T.tr() %><%=T.td("20%","文章标题") %><%=T.td(obj.getStr("title")) %><%=T.tr_close()%>
		<%=T.tr() %><%=T.td("内容")%> <%=T.td(obj.getStr("content")) %><%=T.tr_close() %>
		<%=T.tr() %><%=T.td("相关标签")%><%=T.td(obj.getStr("tag")) %><%=T.tr_close() %>
		<%=T.tr() %><%=T.td("来源")%><%=T.td(obj.getStr("source")) %><%=T.tr_close() %>
		<%=T.tr() %><%=T.td("添加时间")%><%=T.td(obj.getStr("inserttime")) %><%=T.tr_close() %>
		<%=T.tr_space(2) %>
	<%=T. table_close_form() %>
<%=T.end() %>
