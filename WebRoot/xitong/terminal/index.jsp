<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.jzero.util.*,com.jzero.tag.*,com.jzero.core.*"%>
<%=T.js("js/My97DatePicker/WdatePicker.js") %>
<jsp:include page="/comm/jsp/index_top.jsp" >
    <jsp:param name="SHOW_COMM" value="true" />
</jsp:include>
	<%=T.form_open("","delForm") %>
	<%=T.table_list(6,"终端信息")%>
		<%=T.tr_align("center")%>
			<%=T.td("5%",T.a_checkbox()) %>
			<%=T.td("left","终端编号","15%") %>
			<%=T.td("8%","在线状态") %>
			<%=T.td("20%","登录时间") %>
			<%=T.td("15%","登录IP") %>
			<%=T.td("15%","操作") %>
    	<%=T.tr_close() %>
    	<% List<MRecord> lst=MR.me().getAttr(Msg.LIST_DATAS);if(!MCheck.isNull(lst)){for(MRecord row:lst){ %>
    		<%=T.tr_align("center") %>
    			<%=T.td(T.a_checkbox(row.getStr("id"))) %>
    			<%=T.td("left",T.a_view(row.getStr("id"),row.getStr("zdbh")),"15%")%>
    			<%=T.td(row.getStr("online").equals("true")?"在线":"不在线") %>
    			<%=T.td(row.getStr("logintime")) %>
    			<%=T.td(row.getStr("ip")) %>
    			<%=T.td_c("center") %>
    				<%=T.a_edit(row.getStr("id")) %>
    				<%=T.a_del(row.getStr("id")) %>
    			<%=T.td_close() %>
    		<%=T.tr_close() %>
    	<% }}%>
    	<%=T.form_close() %>
   		<%=T.pager(6) %>
	<%=T.table_close() %>
<%=T.end()%>