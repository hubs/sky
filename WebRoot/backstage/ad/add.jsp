
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.jzero.util.*,com.jzero.tag.T,com.jzero.core.*"%>
<%=T.js("js/My97DatePicker/WdatePicker.js") %>
<%
	MRecord out_data=MR.me().getAttr(Msg.OUT_DATAS);
	String parent_name=out_data.getStr("parent_name");
	String parent_id=out_data.getStr("parent_id");
	String save_uri="backstage/ad/save/"+parent_id+"/"+parent_name;
	String back_uri="backstage/ad/index/"+parent_id+"/"+parent_name;
	List<MRecord> category=out_data.get("category");
 %>
<jsp:include page="/comm/jsp/add_top.jsp">
	<jsp:param name="SHOW_KIND" value="true" />
	<jsp:param  name="SAVE_URI" value="<%=save_uri %>"/>
	<jsp:param  name="BACK_URI" value="<%=back_uri %>"/>
</jsp:include>
<%=T.hidden("parent_id",parent_id) %>
<%=T.hidden("parent_name",parent_name) %>
<%=T.add_table(parent_name+"-新增页面",4) %>
		<%=T.tr() %><%=T.td_l("20%","分类","category_id") %><%=T.td(3,T.select_other("category_id","category_name",category)) %><%=T.hidden("category_name","")%><%=T.tr_close() %>
		<%=T.tr() %><%=T.td_l("20%","标题","title") %><%=T.td(3,T.input_must("title")) %><%=T.tr_close() %>
		<%=T.tr() %>
			<%=T.td_l("首页推荐","is_recommend")%><%=T.td(T.radio("is_recommend","1","true")+"是"+T.radio("is_recommend","0")+"否") %>
			<%=T.td_l("首页图片","is_home_pic")%><%=T.td(T.radio("is_home_pic","1")+"是"+T.radio("is_home_pic","0","false")+"否") %>
		<%=T.tr_close() %>
		
		<%=T.tr() %>
			<%=T.td_l("有效开始时间","starttime") %><%=T.td(T.time_must_ymd("starttime")) %>
			<%=T.td_l("截止时间","endtime") %><%=T.td(T.time_must_ymd("endtime")) %>
		<%=T.tr_close() %>
		<%=T.tr()%><%=T.td_l("图片上传","path")%><%=T.td(3,T.img_single("path")) %><%=T.tr_close() %>
		<%=T.tr() %><%=T.td_l("说明","introduce")%><%=T.td(3,T.textarea_kind_no("introduce",160)) %><%=T.tr_close() %>
		<%=T.tr_space(4) %>
	<%=T. table_close_form() %>
<%=T.alert() %>
<%=T.kind_js("introduce") %>
<%=T.end() %>
