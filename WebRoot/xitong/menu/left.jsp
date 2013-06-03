<%@ page language="java"  contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@page import="com.jzero.tag.*,com.jzero.util.*,java.util.*,com.jzero.core.MR"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>menu</title>
<script> BASE_URL="<%=MTool.getBase()%>";</script>
<%=T.css("css/base.css") %>
<%=T.css("js/dtree/dtree.css") %>
<%=T.js("js/dtree/dtree.js") %>
</head>
<body>
<table width='99%' height="100%" border='0' cellspacing='0' cellpadding='0'>
  <tr>
    <td style='padding-left:3px;padding-top:8px' valign="top">
   
	<!-- Item 1 Strat -->
      <dl class='bitem'>
        <dd style='display:block' class='sitem' id='items1_1'>
			   <script type="text/javascript">
                   dmenu = new dTree('dmenu');
                   dmenu.add(0,-1,"菜单管理","","","菜单管理","","","");	
                   <%
                   	 List<MRecord> lst=MR.me().getAttr("LEFT");
                   	 if(!MCheck.isNull(lst)){
                   	 	for(MRecord row:lst){
                   %>
                   		dmenu.add(<%=row.getStr("id")%>,<%=row.getStr("pid")%>, "<%=row.getStr("name")%>","<%=MTool.getBase()%><%=row.getStr("op_url")%>/<%=row.getStr("root_id")%>/", "<%=row.getStr("title")%>", "menu_content", "", "", "");
                   <% }}%>
                   document.write(dmenu);
            </script>			     
        </dd>
      </dl>
      <!-- Item 1 End -->
	  </td>
  </tr>
</table>
</body>
</html>