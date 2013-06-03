<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.jzero.util.*,com.jzero.tag.T,com.jzero.core.*"%>
<%=T.js("js/My97DatePicker/WdatePicker.js") %>
<%
	MRecord out_data=MR.me().getAttr(Msg.OUT_DATAS);
	String parent_name=out_data.getStr("parent_name");
	String parent_id=out_data.getStr("parent_id");
	String save_uri="backstage/ad/update/"+parent_id+"/"+parent_name;
	List<MRecord> category=out_data.get("category");
	List<MRecord> lst=out_data.get("mxlst");
	MRecord row=MR.me().getAttr(Msg.OBJECT);
 %>
<jsp:include page="/comm/jsp/edit_top.jsp">
	<jsp:param name="SHOW_KIND" value="true" />
	<jsp:param  name="SAVE_URI" value="<%=save_uri %>"/>
</jsp:include>

<%=T.hidden_id(row.getStr("id")) %>
<%=T.add_table(parent_name+"-新增页面",4) %>
		<%=T.tr() %><%=T.td_l("20%","分类","category_id") %><%=T.td(3,T.select_other("category_id",row.getStr("category_id"),"category_name",category)) %><%=T.hidden("category_name",row.getStr("category_name"))%><%=T.tr_close() %>
		<%=T.tr() %><%=T.td_l("20%","标题","title") %><%=T.td(3,T.input_must("title",row.getStr("title"))) %><%=T.tr_close() %>
		<%=T.tr() %>
			<%=T.td_l("首页推荐","is_recommend")%><%=T.td(T.radio("is_recommend","1",row.getStr("is_recommend"))+"是"+T.radio("is_recommend","0",row.getStr("is_recommend"))+"否") %>
			<%=T.td_l("首页图片","is_home_pic")%><%=T.td(T.radio("is_home_pic","1",row.getStr("is_home_pic"))+"是"+T.radio("is_home_pic","0",row.getStr("is_home_pic"))+"否") %>
		<%=T.tr_close() %>
		<%=T.tr() %>
			<%=T.td_l("有效开始时间","starttime") %><%=T.td(T.time_must_ymd("starttime",row.get("starttime"))) %>
			<%=T.td_l("截止时间","endtime") %><%=T.td(T.time_must_ymd("endtime",row.get("endtime"))) %>
		<%=T.tr_close() %>
		<%=T.tr()%><%=T.td_l("图片上传","path")%><%=T.td(3,T.img_single("path",row.getStr("path"))) %><%=T.tr_close() %>
		<%=T.tr() %><%=T.td_l("说明","introduce")%><%=T.td(3,T.textarea_kind_no("introduce",row.getStr("introduce"),180)) %><%=T.tr_close() %>
		<%=T.tr_space(4) %>
	<%=T. table_close_form() %>
<%=T.alert() %>
<%=T.kind_js("introduce") %>
<%=T.end() %>
