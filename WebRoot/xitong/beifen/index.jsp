<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8");//只在这加了一句，问题解决 %> 
<%@ page import="com.jzero.util.*,com.jzero.tag.T,com.jzero.core.*"%>
<jsp:include page="/comm/jsp/index_top.jsp" >
	<jsp:param name="SHOW_COMM" value="false"/>
    <jsp:param name="SHOW_ADD" value="true"/>
    <jsp:param name="ADD_NAME" value="备份"/>
</jsp:include>
<!--  内容列表   -->
<%=T.table_list(5,"备份数据列表")%>
		<%=T.tr()%>
			<%=T.td("ID") %>
			<%=T.td("备份路径") %>
			<%=T.td("文件名称") %>
			<%=T.td("大小") %>
			<%=T.td("center","操作","15%") %>
    	<%=T.tr_close() %>
    	<% List<MRecord> lst=MR.me().getAttr(Msg.LIST_DATAS);if(!MCheck.isNull(lst)){for(MRecord row:lst){ %>
    		<%=T.tr() %>
    			<%=T.td(row.getStr("id"))%>
    			<%=T.td(row.getStr("path")) %>
    			<%=T.td(row.getStr("name")) %>
    			<%=T.td(row.getStr("size")) %>
    			<%=T.td_c("center") %>
    				<%=T.a_view(row.getStr("name").substring(0,row.getStr("name").length()-4),"下载") %>
    				<%=T.a_del(row.getStr("name").substring(0,row.getStr("name").length()-4)) %>
    			<%=T.td_close() %>
    		<%=T.tr_close() %>
    	<% }}%>
    	<%=T.form_close() %>
   		<%=T.pager_no_del(5) %>
	<%=T.table_close() %>
<%=T.end()%>