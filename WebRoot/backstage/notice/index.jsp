<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.jzero.util.*,com.jzero.tag.*,com.jzero.core.*"%>
<%=T.js("js/My97DatePicker/WdatePicker.js") %>
<jsp:include page="/comm/jsp/index_top.jsp" >
    <jsp:param name="SHOW_COMM" value="true" />
</jsp:include>
	<%=T.form_open("","delForm") %>
	<%=T.table_list(5,"公告信息栏")%>
		<%=T.tr()%>
			<%=T.td("center",T.a_checkbox(),"5%") %>
			<%=T.td("15%","公告标题") %>
			<%=T.td("30%","公告时间") %>
			<%=T.td("30%","推广关键字") %>
			<%=T.td("center","操作","15%") %>
    	<%=T.tr_close() %>
    	<% List<MRecord> lst=MR.me().getAttr(Msg.LIST_DATAS);if(!MCheck.isNull(lst)){for(MRecord row:lst){ %>
    		<%=T.tr() %>
    			<%=T.td("center",T.a_checkbox(row.getStr("id")),"5%") %>
    			<%=T.td(T.a_view(row.getStr("id"),row.getStr("title")))%>
    			<%=T.td(row.getStr("inserttime")) %>
    			<%=T.td(row.getStr("tag")) %>
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