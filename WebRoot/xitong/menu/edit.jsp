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
	String mid=out_data.getStr("mid");
	String pid=out_data.getStr("pid");
	String root_id=out_data.getStr("mid");
	String parent_name=out_data.getStr("parent_name");
	String save_uri="xitong/menu/update/"+mid+"/"+pid+"/"+root_id;
 %>
 <%=T.form_open(save_uri) %>
 	<%=T.hidden_id(obj.getStr("id")) %>
	<table width="98%" border="0" cellpadding="0" cellspacing="1" bgcolor="#D1DDAA" align="center">
	<tr>
	 <td class="top_title">
	 	<%=T.button("更新","confirms_msg('确认进行修改?','niceform')") %>
	 	<%=T.button("返回","go_back();") %>
	 </td>
	</tr>
</table>
	<%=T.add_table(parent_name,2) %>
		<%=T.tr() %><%=T.td_l("20%","菜单名称","name") %><%=T.td() %><%=T.input_must("name",obj.getStr("name"))%><%=T.td_close() %><%=T.tr_close() %>
		<%=T.tr() %><%=T.td_l("链接地址","url")%><%=T.td(T.input("url",obj.getStr("url"))) %><%=T.tr_close() %>
		<%=T.tr() %><%=T.td_l("所属类型","is_type")%>
			     <%=T.td() %>
			     	<select name="is_type" id="is_type">
				       <option value="节点" <%if(obj.getStr("is_type").equals("节点")){out.write("selected='selected'");}%>>节点</option>
				       <option value="叶子" <%if(obj.getStr("is_type").equals("叶子")){out.write("selected='selected'");}%>>叶子</option>
				    </select>
			    <%=T.td_close() %>
		<%=T.tr_close() %>
		<%=T.tr() %><%=T.td_l("排序","i_order")%><%=T.td(T.input_style_int("i_order",obj.getStr("i_order"),"width:60px")) %><%=T.tr_close() %>
		<%=T.tr() %><%=T.td_l("是否显示","root_show")%>
			<%=T.td() %>
				<select name="root_show" id="root_show">
					   <option value="1" <%if(obj.getStr("root_show").equals("1")){out.write("selected='selected'");}%>>显示</option>
					   <option value="0" <%if(obj.getStr("root_show").equals("0")){out.write("selected='selected'");}%>>隐藏</option>
				</select>
			<%=T.td_close() %>
		<%=T.tr_close() %>
		<%=T.tr_space(2) %>
	<%=T. table_close_form() %>
<%=T.end() %>