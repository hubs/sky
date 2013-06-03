<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.jzero.util.*,com.jzero.tag.T,com.jzero.core.*"%>

<%=T.head("修改页面",MTool.getBase()) %>
<%@include file="/comm/js/base.jsp" %>
<%@include file="/comm/js/validator.jsp" %>
<%=T.head_end() %>
<body>
<%
	MRecord out_data=MR.me().getAttr(Msg.OUT_DATAS);
	MRecord obj=MR.me().getAttr(Msg.OBJECT);
	String yhzdm=out_data.getStr("yhzdm");
	String yhzmc=out_data.getStr("yhzmc");
	String save_uri="xitong/renyuan/update/"+yhzdm+"/"+yhzmc;
 %>
 <%=T.form_open(save_uri) %>
 	<%=T.hidden_id(obj.getStr("id")) %>
	<table width="98%" border="0" cellpadding="0" cellspacing="1" bgcolor="#EEF3F7" align="center">
	<tr>
	 <td class="top_title">
	 	<%=T.button("更新","confirms_msg('确认进行修改?','niceform')") %>
	 	<%=T.button("返回","go_back();") %>
	 </td>
	</tr>
</table>
	<%=T.edit_table(4) %>
		<%=T.tr() %><%=T.td_l("20%","用户组","name") %><%=T.td(3,yhzmc) %><%=T.tr_close() %>
		<%=T.tr() %><%=T.td_l("编号","bh")%><%=T.td(obj.getStr("bh")) %><%=T.td_l_must("姓名","xm")%><%=T.td(T.input_must("xm",obj.getStr("xm"))) %><%=T.tr_close() %>
		<%=T.tr() %><%=T.td_l("登录显示名","dlm") %><%=T.td(3,T.input("dlm",obj.getStr("dlm"))) %><%=T.tr_close() %>
		<%=T.tr() %><%=T.td_l("手机","sj")%><%=T.td(T.input("sj",obj.getStr("sj")))%><%=T.td_l("邮箱","dzyj")%><%=T.td(T.input("dzyj",obj.getStr("dzyj")))%><%=T.tr_close() %>
		<%=T.tr() %><%=T.td_l("排序","px")%><%=T.td(3,T.input_style_int("px",obj.getStr("px"),"width:60px")) %><%=T.tr_close() %>
		<%=T.tr_space(4) %>
	<%=T. table_close_form() %>
<script type="text/javascript">
	$(function(){
		$('#xm').keyup(function() {$("#dlm").val($(this).val());});
	})
</script>
<%=T.end() %>