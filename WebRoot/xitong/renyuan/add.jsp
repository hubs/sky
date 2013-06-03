<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.jzero.util.*,com.jzero.tag.T,com.jzero.core.*"%>

<%=T.head("新增页面",MTool.getBase()) %>
<%@include file="/comm/js/base.jsp" %>
<%@include file="/comm/js/validator.jsp" %>
<%=T.head_end() %>
<body>
<%
	MRecord out_data=MR.me().getAttr(Msg.OUT_DATAS);
	String yhzdm=out_data.getStr("yhzdm");
	String yhzmc=out_data.getStr("yhzmc");
	String save_uri="xitong/renyuan/save/"+yhzdm+"/"+yhzmc;
	String back_uri="xitong/renyuan/index/"+yhzdm+"/"+yhzmc;
 %>
 <%=T.form_open(save_uri) %>
	<%=T.hidden("yhzdm",yhzdm) %>
	<%=T.hidden("yhzmc",yhzmc) %>
	<table width="98%" border="0" cellpadding="0" cellspacing="1" bgcolor="#EEF3F7" align="center">
	<tr>
	 <td class="top_title">
	 	<%=T.button("保存","confirms_msg('确认保存操作','niceform')") %>
	 	<%=T.button("返回","go_to_url('"+back_uri+"')") %>
	 </td>
	</tr>
</table>
	<%=T.add_table(4) %>
		<%=T.tr() %><%=T.td_l("20%","用户组","name") %><%=T.td(3,yhzmc) %><%=T.tr_close() %>
		<%=T.tr() %><%=T.td_l_must("编号","bh")%><%=T.td(T.input_must("bh")) %><%=T.td_l_must("姓名","xm")%><%=T.td(T.input_must("xm")) %><%=T.tr_close() %>
		<%=T.tr() %><%=T.td_l("登录显示名","dlm") %><%=T.td(3,T.input("dlm")) %><%=T.tr_close() %>
		<%=T.tr() %><%=T.td_l("手机","sj")%><%=T.td(T.input("sj"))%><%=T.td_l("邮箱","dzyj")%><%=T.td(T.input("dzyj"))%><%=T.tr_close() %>
		<%=T.tr() %><%=T.td_l("排序","px")%><%=T.td(3,T.input_style_int("px","width:60px")) %><%=T.tr_close() %>
		<%=T.tr_space(4) %>
	<%=T. table_close_form() %>
<%=T.alert() %>
<script type="text/javascript">
	$(function(){
	$('#xm').keyup(function() {$("#dlm").val($(this).val());});
	$("#bh").blur(function(){exists($(this).attr("id"),'xt_yhxxb','该帐号已存在,请重新录入');})
	})
</script>
<%=T.end() %>
