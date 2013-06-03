<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.jzero.util.*,com.jzero.tag.T,com.jzero.core.*"%>
<%=T.js("js/My97DatePicker/WdatePicker.js") %>
	<%
		MRecord record=MR.me().getAttr(Msg.OUT_DATAS);
		String types=MCheck.isNull(record)?"":record.getStr("types");
		MRecord row=MR.me().getAttr(Msg.OBJECT);
		List<MRecord> lst=record.get("mxlst");
		String save_uri="backstage/achievement/update/"+types;
	%>
<jsp:include page="/comm/jsp/edit_top.jsp">
	<jsp:param name="SHOW_KIND" value="true" />
	<jsp:param name="SAVE_URI" value="<%=save_uri %>"/>
</jsp:include>

	<%=T.edit_table() %>
		<%=T.hidden_id(row.getStr("id")) %>
		<%=T.tr() %><%=T.td_l("分类","types")%><%=T.td(types)%><%=T.tr_close() %>
		<%=T.tr() %><%=T.td_l("20%","文章标题","title") %><%=T.td() %><%=T.input_must_style("title",row.getStr("title"),"width:360px;")%><%=T.td_close() %><%=T.tr_close() %>
		<%=T.img_mul_show(lst,row.getStr("fimg")) %>
		<%=T.tr() %><%=T.td_l("内容","content") %><%=T.td(T.textarea_kind_no("content",row.getStr("content"),150)) %><%=T.tr_close() %>
		<%=T.tr() %><%=T.td_l("相关标签","tag")%><%=T.td(T.input_style("tag",row.getStr("tag"),"width:280px")+T.span("用“|”分隔")) %><%=T.tr_close() %>
		<%=T.tr() %><%=T.td_l("消息来源","source")%><%=T.td(T.input("source",row.getStr("source"))) %><%=T.tr_close() %>
		<%=T.tr() %><%=T.td_l("添加时间","inserttime")%><%=T.td(T.time_must("inserttime",row.get("inserttime"))) %><%=T.tr_close() %>
		<%=T.tr_space() %>
	<%=T. table_close_form() %>
<%=T.kind_js("content") %>
<%=T.js_auto("title","tag") %>
<%=T.end() %>
