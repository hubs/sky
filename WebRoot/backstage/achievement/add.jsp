<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.jzero.util.*,com.jzero.tag.T,com.jzero.core.*"%>
<%=T.js("js/My97DatePicker/WdatePicker.js") %>
	<%
		MRecord record=MR.me().getAttr(Msg.OUT_DATAS);
		String types=MCheck.isNull(record)?"":record.getStr("types");
		String save_uri="backstage/achievement/save/"+types;
		String back_uri="backstage/achievement/index/"+types;
	%>
<jsp:include page="/comm/jsp/add_top.jsp">
	<jsp:param name="SHOW_KIND" value="true" />
	<jsp:param name="SAVE_URI" value="<%=save_uri %>"/>
	<jsp:param name="BACK_URI" value="<%=back_uri %>"/>
</jsp:include>
	<%=T.add_table() %>
		<%=T.tr() %><%=T.td_l("分类","types")%><%=T.td(types)%><%=T.hidden("types",types)%><%=T.tr_close() %>
		<%=T.tr() %><%=T.td_l("20%","文章标题","title") %><%=T.td() %><%=T.input_must_style("title","width:360px;")%><%=T.td_close() %><%=T.tr_close() %>
		<%=T.img_mul() %>
		<%=T.tr() %><%=T.td_l("内容","content") %><%=T.td(T.textarea_kind_no("content",160)) %><%=T.tr_close() %>
		<%=T.tr() %><%=T.td_l("相关标签","tag")%><%=T.td(T.input_style("tag","width:280px")+T.span("用“-”分隔")) %><%=T.tr_close() %>
		<%=T.tr() %><%=T.td_l("消息来源","source")%><%=T.td(T.input("source","桂林市测绘院")) %><%=T.tr_close() %>
		<%=T.tr() %><%=T.td_l("添加时间","inserttime")%><%=T.td(T.time_must("inserttime",MDate.get_ymd_hms())) %><%=T.tr_close() %>
		<%=T.tr_space() %>
	<%=T. table_close_form() %>
<%=T.alert() %>
<%=T.kind_js("content") %>
<%=T.js_auto("title","tag") %>
<%=T.end() %>
