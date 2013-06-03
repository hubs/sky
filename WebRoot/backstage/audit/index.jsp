<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.jzero.util.*,com.jzero.tag.*,com.jzero.core.*"%>
<jsp:include page="/comm/jsp/index_top.jsp" >
    <jsp:param name="SHOW_COMM" value="false" />
    <jsp:param name="SHOW_ADD" value="false" />
</jsp:include>
<% 
   MRecord  outMR=MR.me().getAttr(Msg.OUT_DATAS);
   String tp=outMR.getStr("tp");
 %>
	<%=T.form_open("","delForm") %>
	<%=T.table_list(6,"信息审核")%>
		<%=T.tr()%>
			<%=T.td("center",T.a_checkbox(),"5%") %>
			<%=T.td("15%","所属分类"+T.a_o("tp",tp)) %>
			<%=T.td("25%","标题") %>
			<%=T.td("15%","录入日期") %>
			<%=T.td("12%","录入人员") %>
			<%=T.td("center","操作","15%") %>
    	<%=T.tr_close() %>
    	<% List<MRecord> lst=MR.me().getAttr(Msg.LIST_DATAS);if(!MCheck.isNull(lst)){for(MRecord row:lst){ %>
    		<%=T.tr() %>
    			<%=T.hidden("tb[]",row.getStr("tb")) %>
    			<%=T.td("center",T.a_checkbox(row.getStr("id")),"5%") %>
    			<%=T.td(row.getStr("tp")) %>
    			<%=T.td(T.a_view(row.getStr("id"),row.getStr("title"),row.getStr("tb")))%>
    			<%=T.td(row.getStr("pubdate")) %>
    			<%=T.td(row.getStr("publisher")) %>
    			<%=T.td_c("center") %>
    				<%=T.a_audit(row.getStr("id"),row.getStr("tb")) %>
    			<%=T.td_close() %>
    		<%=T.tr_close() %>
    	<% }}%>
    	<%=T.form_close() %>
   		<%=T.pager_audit(6,tp) %>
	<%=T.table_close() %>
<%=T.end()%>