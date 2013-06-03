<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.jzero.util.*,com.jzero.tag.*,com.jzero.core.*"%>
<%=T.js("js/My97DatePicker/WdatePicker.js") %>
<jsp:include page="/comm/jsp/index_top.jsp" >
    <jsp:param name="SHOW_COMM" value="true" />
    <jsp:param  name="SHOW_TIME" value="true"/>
    <jsp:param name="SHOW_ADD" value="false"/>
</jsp:include>
<!--  内容列表   -->
<%=T.form_open("xitong/jilu/delete","delForm") %>
<%=T.table_list(4,"系统记录信息列表")%>
		<%=T.tr()%>
			<%=T.td("15%","记录时间"+T.a_o("time")) %>
			<%=T.td("10%","事件"+T.a_o("event")) %>
			<%=T.td("10%","操作用户"+T.a_o("username")) %>
			<%=T.td("15%","登录IP") %>
    	<%=T.tr_close() %>
    	<% List<MRecord> lst=MR.me().getAttr(Msg.LIST_DATAS);if(!MCheck.isNull(lst)){for(MRecord row:lst){ %>
    		<%=T.tr() %>
    			<%=T.td(row.getStr("time"))%>
    			<%=T.td(row.getStr("event")) %>
    			<%=T.td(row.getStr("username")) %>
    			<%=T.td(row.getStr("loginIp")) %>
    		<%=T.tr_close() %>
    	<% }}%>
    	<%=T.form_close() %>
   		<%=T.pager_no_del(4) %>
   		<%=T.tr_align("center") %>	
   			<%=T.td_s(4) %>
   				<%=T.label("时间","start") %><%=T.time("start",MDate.get_min_day()) %><%=T.label("-","end") %><%=T.time("end",MDate.get_max_day()) %><%=T.button("删除","confirms_msg('是否删除此段时间的记录?','delForm')") %>
   			<%=T.td_close() %>
   		<%=T.tr_close() %>
	<%=T.table_close() %>
<%=T.end()%>
