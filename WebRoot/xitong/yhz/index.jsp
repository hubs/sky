<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8");//只在这加了一句，问题解决 %> 
<%@ page import="com.jzero.util.*,com.jzero.tag.*,com.jzero.core.*,guilinsoft.sky.utils.MMsg"%>
<jsp:include page="/comm/jsp/index_top.jsp" >
	<jsp:param name="SHOW_COMM" value="false"/>
    <jsp:param name="SHOW_ADD" value="true"/>
    <jsp:param name="ADD_NAME" value="添加用户组"/>
</jsp:include>
<!--  内容列表   -->
<%=T.table_list(4,"用户组列表")%>
		<%=T.tr()%>
			<%=T.td("排序") %>
			<%=T.td("代码") %>
			<%=T.td("名称") %>
			<%=T.td("center","操作","15%") %>
    	<%=T.tr_close() %>
    	<% List<MRecord> lst=MR.me().getAttr(Msg.LIST_DATAS);if(!MCheck.isNull(lst)){for(MRecord row:lst){ %>
    		<%=T.tr() %>
    			<%=T.td(row.getStr("px"))%>
    			<%=T.td(row.getStr("dm")) %>
    			<%=T.td(row.getStr("mc")) %>
    			<%=T.td_c("center") %>
    				<%=T.a_edit(row.getStr("id")) %>
    				<% if(!row.getStr("dm").equals(MMsg.SYS)){%><%=T.a_del(row.getStr("id")) %><%} %>
    			<%=T.td_close() %>
    		<%=T.tr_close() %>
    	<% }}%>
    	<%=T.form_close() %>
   		<%=T.pager_no_del(4) %>
	<%=T.table_close() %>
<%=T.end()%>
