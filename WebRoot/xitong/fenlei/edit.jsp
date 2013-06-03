<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.jzero.util.*,com.jzero.tag.T,com.jzero.core.*"%>
<jsp:include page="/comm/jsp/edit_top.jsp">
	<jsp:param name="SHOW_KIND" value="false" />
</jsp:include>
<%  MRecord row=MR.me().getAttr(Msg.OBJECT); 
	MRecord out_data=MR.me().getAttr(Msg.OUT_DATAS);
	List<MRecord> category=out_data.get("category");
%>
<%=T.hidden_id(row.getStr("id")) %>
<%=T.add_table("修改分类",2) %>
		<%=T.tr() %><%=T.td_l("20%","上级分类","parent_id") %><%=T.td() %><%=T.select_info("parent_id",row.getStr("parent_id"),"顶级分类","0",category)%><%=T.td_close() %><%=T.tr_close() %>
		<%=T.tr() %><%=T.td_l("20%","名称","name") %><%=T.td() %><%=T.input_must("name",row.getStr("name"))%><%=T.td_close() %><%=T.tr_close() %>
		<%=T.tr() %><%=T.td_l("备注","bz")%><%=T.td(T.textarea("bz",row.getStr("bz"))) %><%=T.tr_close() %>
		<%=T.tr() %><%=T.td_l("排序","sort")%><%=T.td(T.input_style_int("sort",row.getStr("sort"),"width:60px")) %><%=T.tr_close() %>
		<%=T.tr_space(2) %>
	<%=T. table_close_form() %>
<%=T.alert() %>
<%=T.end() %>
