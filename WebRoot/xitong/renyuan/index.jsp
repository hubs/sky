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
 	MRecord re=MR.me().getAttr(Msg.OUT_DATAS);
	String yhzdm=re.getStr("yhzdm");
	String yhzmc=re.getStr("yhzmc");
	String title=MR.me().getPara("title");
	List<MRecord> lst=MR.me().getAttr(Msg.LIST_DATAS);
 %>
<!--  快速转换位置按钮  -->
<table width="98%" border="0" cellpadding="0" cellspacing="1" bgcolor="#EEF3F7" align="center">
	<tr>
		 <td class="top_title">
		    <input type='button' class="coolbg np" onclick="go_to_url('<%=MTool.getBase() %>xitong/renyuan/add/<%=yhzdm %>/<%=yhzmc %>')" value='添加'  />
		 </td>
	</tr>
</table>
<!--  内容列表   -->
<%=T.table_list(8,yhzmc) %>
<%=T.form_open("","nform") %>
	<%=T.tr()%>
		<%=T.td("center",T.a_checkbox(),"5%") %>
		<%=T.td_c("center","排序","5%") %>
		<%=T.td("10%","编号") %>
		<%=T.td("13%","姓名") %>
		<%=T.td("13%","显示名") %>
		<%=T.td("12%","用户组名称") %>
		<%=T.td_c("center","用户状态","9%") %>
		<%=T.td_c("center","操作","15%") %>
    <%=T.tr_close() %>
	<% if(!MCheck.isNull(lst)){for(MRecord row:lst){ %>
	    	<%=T.tr() %>
	    		<%=T.td("center",T.a_checkbox(row.getStr("id")),"5%") %>
	    		<%=T.td_c("center",row.getStr("px")) %>
	    		<%=T.td(T.a_view(row.getStr("id"),row.getStr("bh")))%>
	    		<%=T.td(row.getStr("xm")) %>
	    		<%=T.td(row.getStr("dlm")) %>
	    		<%=T.td(row.getStr("yhzmc")) %>
	    		<%=T.td_c("center",row.getStr("yhzt")) %>
	    		<%=T.td_c("center") %>
	    			<%=T.a_edit(row.getStr("id")+"/"+row.getStr("yhzdm")+"/"+row.getStr("yhzmc")) %>
	    			<%=T.a_del(row.getStr("id")+"/"+row.getStr("yhzdm")+"/"+row.getStr("yhzmc")) %>
	    		<%=T.td_close() %>
	    	<%=T.tr_close() %>
	<%	}}else{ %>
	<%=T.tr("center") %>
		<%=T.td(8,"没有记录.") %>
	<%=T.tr_close() %>
	<%} %>
	<%=T.tr() %>
		<td height=36 colspan="8" >
			<input type='button' onclick="check_form('锁定')" class="coolbg np"  value='锁定' />
		    <input type='button' onclick="check_form('解锁')" class="coolbg np"  value='解锁' />
			<%=MR.me().getAttr("pageInfo")%>
		</td>
	<%=T.tr_close() %>
</table>
<script type="text/javascript">
    function check_form(n){
         if(!checkIsSelect("select[]")){
            alertMsg("请选择要"+n+"的人员.");
            return false;
        }
        $.dialog.confirm("确定"+n+"选中的人员?", function(){
            var url="<%=MTool.getBase()%>xitong/renyuan/batch/"+n+"/<%=yhzdm%>/<%=yhzmc%>";
            getObjById("nform").action =url;
            getObjById("nform").submit();
        },function(){ $.dialog.tips('执行取消操作'); });  
    }
</script>
<%=T.end() %>
