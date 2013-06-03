<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.jzero.util.*,com.jzero.tag.T,com.jzero.core.*"%>
<%
	MRecord out_data=MR.me().getAttr(Msg.OUT_DATAS);
	List<MRecord> lst=out_data.get("mxlst");
 %>
<%@include file="/comm/jsp/view_top.jsp" %>
<%=T.add_table("查看页面",4) %>
		<%=T.tr() %><%=T.td_l("20%","分类","category_id") %><%=T.td(3,obj.getStr("category_name")) %><%=T.tr_close() %>
		<%=T.tr() %><%=T.td_l("20%","标题","title") %><%=T.td(3,obj.getStr("title")) %><%=T.tr_close() %>
		<%=T.tr() %>
			<%=T.td_l("首页推荐","is_recommend")%><%=T.td(obj.getStr("is_recommend").equals("0")?"否":"是") %>
			<%=T.td_l("首页图片","is_home_pic")%><%=T.td(obj.getStr("is_home_pic").equals("0")?"否":"是") %>
		<%=T.tr_close() %>
		<%=T.tr() %>
			<%=T.td_l("有效开始时间","starttime") %><%=T.td(obj.getStr("starttime")) %>
			<%=T.td_l("截止时间","endtime") %><%=T.td(obj.getStr("endtime")) %>
		<%=T.tr_close() %>
		<%=T.tr()%><%=T.td_l("图片","path")%><%=T.td(3,T.img_show(obj.getStr("path"))) %><%=T.tr_close() %>
		<%=T.tr() %><%=T.td_l("说明","introduce")%><%=T.td(3,obj.getStr("introduce")) %><%=T.tr_close() %>
		<%=T.img_mul_view(lst,4) %>
		<%=T.tr_space(4) %>
	<%=T. table_close_form() %>
<%=T.end() %>
