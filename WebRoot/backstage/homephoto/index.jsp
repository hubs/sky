<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.jzero.util.*,com.jzero.tag.*,com.jzero.core.*"%>
<jsp:include page="/comm/jsp/index_top.jsp" >
    <jsp:param name="SHOW_COMM" value="false" />
</jsp:include>
	<%=T.form_open("","delForm") %>
	<%=T.table_list(5,"首页图页展示列表")%>
		<%=T.tr()%>
			<%=T.td("center",T.a_checkbox(),"5%") %>
			<%=T.td("25%","标题") %>
			<%=T.td("20%","图片") %>
			<%=T.td("12%","日期") %>
			<%=T.td("center","操作","15%") %>
    	<%=T.tr_close() %>
    	<% List<MRecord> lst=MR.me().getAttr(Msg.LIST_DATAS);if(!MCheck.isNull(lst)){for(MRecord row:lst){ %>
    		<%=T.tr() %>
    			<%=T.td("center",T.a_checkbox(row.getStr("id")),"5%") %>
    			<%=T.td(T.a_view(row.getStr("id"),row.getStr("title")))%>
    			<%=T.td(T.img_show(row.getStr("path"))) %>
    			<%=T.td(row.getStr("pubdate")) %>
    			<%=T.td_c("center") %>
    				<%=T.a_edit(row.getStr("id")) %>
    				<%=T.a_del(row.getStr("id")) %>
    			<%=T.td_close() %>
    		<%=T.tr_close() %>
    	<% }}%>
    	<%=T.form_close() %>
   		<%=T.pager(5) %>
	<%=T.table_close() %>
<%=T.end()%>