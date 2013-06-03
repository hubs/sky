<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.jzero.util.*,com.jzero.tag.T,com.jzero.core.*"%>

<%=T.head("新增页面",MTool.getBase()) %>
<%@include file="/comm/js/base.jsp" %>
<%@include file="/comm/js/validator.jsp" %>
<%=T.head_end() %>
<body>
<%
	MRecord out_data=MR.me().getAttr(Msg.OUT_DATAS);
	String save_uri="xitong/fenlei/save/";
	String back_uri="xitong/fenlei/index/";
	List<MRecord> category=out_data.get("category");
 %>
 <%=T.form_open(save_uri) %>
	<table width="98%" border="0" cellpadding="0" cellspacing="1" bgcolor="#D1DDAA" align="center">
	<tr>
	 <td class="top_title">
	 	<%=T.button("保存","confirms_msg('确认保存操作','niceform')") %>
	 	<%=T.button("返回","go_to_url('"+back_uri+"')") %>
	 </td>
	</tr>
</table>
<%=T.add_table("增加分类",2) %>
		<%=T.tr() %><%=T.td_l("20%","上级分类","parent_id") %><%=T.td() %><%=T.select_info("parent_id","顶级分类","0",category)%><%=T.td_close() %><%=T.tr_close() %>
		<%=T.tr() %><%=T.td_l("20%","名称","name") %><%=T.td() %><%=T.input_must("name")%><%=T.td_close() %><%=T.tr_close() %>
		<%=T.tr() %><%=T.td_l("备注","bz")%><%=T.td(T.textarea("bz")) %><%=T.tr_close() %>
		<%=T.tr() %><%=T.td_l("排序","sort")%><%=T.td(T.input_style_int("sort","width:60px")) %><%=T.tr_close() %>
		<%=T.tr_space(2) %>
	<%=T. table_close_form() %>
<%=T.alert() %>
<%=T.end() %>
