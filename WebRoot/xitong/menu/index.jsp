<%@ page language="java"  contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@page import="com.jzero.tag.*,com.jzero.util.*,java.util.*,com.jzero.core.MR"%>
<%=T.head("菜单管理列表",MTool.getBase()) %>
    <%=T.css("css/dividPage.css") %>
    <%@include file="/comm/js/base.jsp" %>
	<%@include file="/comm/js/dialog.jsp" %>
	<script type="text/javascript">
		$(function(){ list_page();})
	</script>
<%=T.head_end() %>
<body>
<%
	MRecord record=MR.me().getAttr(Msg.OUT_DATAS);
	String mid=record.getStr("mid");
	String pid=record.getStr("pid");
	String root_id=record.getStr("root_id");
	String parent_name=record.getStr("parent_name");
	List<MRecord> lst=MR.me().getAttr(Msg.LIST_DATAS);
 %>
<!--  快速转换位置按钮  -->
<table width="98%" border="0" cellpadding="0" cellspacing="1" bgcolor="#D1DDAA" align="center">
<tr>
 <td class="top_title">
    <input type='button' class="coolbg np" onclick="go_to_url('<%=MTool.getBase() %>xitong/menu/add/<%=mid %>/<%=pid %>/<%=root_id %>')" value='添加菜单'  />
</td>
</tr>
</table>
  
<!--  内容列表   -->
<table width="98%" border="0" cellpadding="2" cellspacing="1" class="list" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
<tr>
	<td  colspan="6" class="title">&nbsp;【<%=parent_name %>】菜单列表&nbsp;</td>
</tr>
<tr align="center" >
	<td width="6%" height="26">排序</td>
	<td width="20%">菜单名称</td>
	<td width="38%">链接地址</td>
	<td width="8%">所属类型</td>
    <td width="8%">显示状态</td>
	<td width="15%">操作</td>
</tr>
<%
	if(!MCheck.isNull(lst)){
		for(MRecord row:lst){
	
 %>
<tr align='center'  >
	<td align="center"><%=row.getStr("i_order") %></td>
	<td align="left"><%=row.getStr("name") %></td>
	<td align="left"><%=row.getStr("url") %></td>
	<td align="center"><%=row.getStr("is_type") %></td>
    <td align="center"><% if(row.getStr("root_show").equals("0")){ out.write("隐藏");}else{out.write("显示");} %></td>
    <%=T.td_c("center") %>
    		<%=T.a_edit_base("xitong/menu/edit/"+row.getStr("id")+"/"+mid+"/"+pid+"/"+root_id) %>
    		<%=T.a_del_base("xitong/menu/delete/"+row.getStr("id")+"/"+mid+"/"+pid+"/"+root_id) %>
    <%=T.td_close() %>
</tr>
<%	}}else{ %>
	<%=T.tr("center") %>
		<%=T.td(6,"没有记录.") %>
	<%=T.tr_close() %>
<%} %>
<%=T.pager_no_del(6) %>
</table>
<script type="text/javascript">
//     window.parent.frames.menu_left.location.replace(window.parent.frames.menu_left.location);
</script>
<%=T.end() %>
