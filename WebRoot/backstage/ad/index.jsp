<%@ page language="java"  contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@page import="com.jzero.tag.*,com.jzero.util.*,java.util.*,com.jzero.core.MR"%>
<%
	MRecord record=MR.me().getAttr(Msg.OUT_DATAS);
	String parent_name=record.getStr("parent_name");
	String parent_id=record.getStr("parent_id");
	String add_uri="backstage/ad/add/"+parent_id+"/"+parent_name;
	List<MRecord> lst=MR.me().getAttr(Msg.LIST_DATAS);
 %>
<jsp:include page="/comm/jsp/index_top.jsp" >
	<jsp:param name="SHOW_COMM" value="false"/>
    <jsp:param name="SHOW_ADD" value="true"/>
    <jsp:param name="ADD_URI" value="<%=add_uri%>"/>
    <jsp:param name="ADD_NAME" value="添加"/>
</jsp:include>

<%=T.table_list(7,parent_name) %>
	<%=T.tr_align("center") %>
		<%=T.td("left","标题","15%") %>
		<%=T.td("left","所属分类","15%") %>
		<%=T.td("23%","有效时间") %>
		<%=T.td("7%","首页图片") %>
		<%=T.td("7%","是否推荐") %>
		<%=T.td("18%","发布时间") %>
		<%=T.td("18%","操作") %>
	<%=T.tr_close() %>
<% if(!MCheck.isNull(lst)){for(MRecord row:lst){%>
	<%=T.tr_align("center") %>
		<%=T.td("left",T.a_view(row.getStr("id"),row.getStr("title"),row.getStr("tb")),"15%")%>
		<%=T.td("left",row.getStr("category_name"),"15%") %>
		<%=T.td("23%",row.getStr("starttime")+"--"+row.getStr("endtime")) %>
		<%=T.td("7%",row.getStr("is_home_pic").equals("false")?"否":"是") %>
		<%=T.td("7%",row.getStr("is_recommend").equals("false")?"否":"是") %>
		<%=T.td("18%",row.getStr("pubdate")) %>
		<%=T.td() %>
    		<%=T.a_edit_base("backstage/ad/edit/"+row.getStr("id")+"/"+parent_id+"/"+parent_name) %>
    		<%=T.a_del_base("backstage/ad/del/"+row.getStr("id")+"/"+parent_id+"/"+parent_name) %>
    	<%=T.td_close() %>
	<%=T.tr_close() %>
<%	}}else{ %>
	<%=T.tr("center") %>
		<%=T.td(7,"没有记录.") %>
	<%=T.tr_close() %>
<%} %>
<%=T.pager_no_del(7) %>
<%=T.table_close() %>
<%=T.end()%>