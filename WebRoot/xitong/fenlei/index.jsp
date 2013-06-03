<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %> 
<%@ page import="com.jzero.util.*,com.jzero.tag.*,com.jzero.core.*,guilinsoft.sky.utils.Tools"%>
<%=T.head("分类列表") %>
<%
	String add_uri="xitong/fenlei/add";
 %>
<jsp:include page="/comm/jsp/index_top.jsp" >
	<jsp:param name="SHOW_COMM" value="false"/>
    <jsp:param name="SHOW_ADD" value="true"/>
    <jsp:param name="ADD_URI" value="<%=add_uri%>"/>
    <jsp:param name="ADD_NAME" value="添加分类"/>
</jsp:include>
<%=T.body() %>
<!--  内容列表   -->
<%=T.table_list(2,"分类信息")%>
		<%=T.tr_align("center")%>
			<%=T.td("left","分类名称","60%") %>
			<%=T.td("center","操作","33%") %>
    	<%=T.tr_close() %>
    	<% List<MRecord> lst=MR.me().getAttr(Msg.LIST_DATAS);if(!MCheck.isNull(lst)){for(MRecord row:lst){ %>
    		<%=T.form_open("xitong/fenlei/update")%>
    			<%=T.form_hidden("id",row.getStr("id")) %>
    			<tr id="<%=row.getStr("id") %>" parent="<%=row.getStr("parent_id") %>">
	    			<td align="left" >
	    			<img name="switch" style="margin-left:<%=Integer.parseInt(Tools.repeat(Integer.valueOf("2"),row.getStr("path")))*2 %>0px" class="operator" src="<%=MTool.getBase() %>images/close.gif" alt="关闭" />
	    			<%=row.getStr("name") %>
	    			</td>
	    			<%=T.td_c("center") %>
	    				<%=T.a_edit_base("xitong/fenlei/edit/"+row.getStr("id")) %>
    					<%=T.a_del_base("xitong/fenlei/del/"+row.getStr("id")) %>
	    			<%=T.td_close() %>
	    		<%=T.tr_close() %>
	    	<%=T.form_close() %>
    	<% }}%>
    	<%=T.form_close() %>
    	<%=T.tr() %>
    		<%=T.td_s(2) %>
    	<%=T.tr_close() %>
	<%=T.table_close() %>
<script language="javascript">
$("img[name='switch']").each(function(i){
	$(this).toggle(function(){
		jqshow($(this).parent().parent().attr('id'), 'hide');
		$(this).attr("src", "<%=MTool.getBase()%>images/open.gif");
	},function(){
		jqshow($(this).parent().parent().attr('id'), 'show');
		$(this).attr("src", "<%=MTool.getBase()%>images/close.gif");
	});
});

function jqshow(id,isshow){
	var obj = $(".list tr[parent='"+id+"']");
	if (obj.length>0){
		obj.each(function(i) {
			jqshow($(this).attr('id'), isshow);
		});
		if (isshow=='hide'){
			obj.hide();
		}else{
			obj.show();
		}
	}
}
</script>
<%=T.end()%>
