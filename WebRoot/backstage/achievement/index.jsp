<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.jzero.util.*,com.jzero.tag.*,com.jzero.core.*,guilinsoft.sky.utils.Tools"%>
<%=T.js("js/My97DatePicker/WdatePicker.js") %>
<%
	MRecord record=MR.me().getAttr(Msg.OUT_DATAS);
	String types=MCheck.isNull(record)?"":record.getStr("types");
	boolean is_admin=record.getBoolean("admin");
	String add_uri="backstage/achievement/add/"+types;
	String find_uri="backstage/achievement/find/"+types;
 %>
<jsp:include page="/comm/jsp/index_top.jsp" >
    <jsp:param name="SHOW_COMM" value="false" />
    <jsp:param  name="SHOW_TIME" value="true"/>
    <jsp:param  name="SHOW_ADD" value="true"/>
    <jsp:param  name="ADD_URI" value="<%=add_uri%>" />
    <jsp:param  name="FIND_URI" value="<%=find_uri%>" />
</jsp:include>
<!--  内容列表   -->
<%=T.form_open("","delForm") %>
<%=T.table_list(6,"「"+types+"」列表页面")%>
		<%=T.tr()%>
			<%=T.td("center",T.a_checkbox(),"5%") %>
			<%=T.td("8%","分类") %>
			<%=T.td("25%","标题") %>
			<%=T.td("15%","时间"+T.a_o("inserttime",types)) %>
			<%=T.td("center","审核","8%") %>
			<%=T.td("center","操作","15%") %>
    	<%=T.tr_close() %>
    	<% List<MRecord> lst=MR.me().getAttr(Msg.LIST_DATAS);if(!MCheck.isNull(lst)){for(MRecord row:lst){ %>
    		<%=T.tr() %>
    			<%=T.td("center",T.a_checkbox(row.getStr("id"),Tools.is_audit(row.getStr("shzt"),is_admin)),"5%") %>
    			<%=T.td(T.a_view(row.getStr("id"),row.getStr("types")))%>
    			<%=T.td(row.getStr("title")) %>
    			<%=T.td(row.getStr("inserttime")) %>
    			<%=T.td("center",row.getStr("shzt"),"8%") %>
    			<%=T.td_c("center") %>
    			 <% if(Tools.is_audit(row.getStr("shzt"),is_admin)){ %>
	    				<%=T.a_edit(row.getStr("id")+"/"+types) %>
    					<%=T.a_del(row.getStr("id")+"/"+types) %>
    				<%}else{ %>
    					<%=T.a_view(row.getStr("id"),"查看") %>
    				<%} %>
    			<%=T.td_close() %>
    		<%=T.tr_close() %>
    	<% }}%>
    	<%=T.form_close() %>
   		<%=T.pager(6,types) %>
	<%=T.table_close() %>
<%=T.end()%>