<%@ page language="java"  contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@page import="com.jzero.tag.*,com.jzero.util.*,java.util.*,com.jzero.core.MR"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>menu</title>
<base href="<%=MTool.getBase() %>" target="main">
<script> BASE_URL="<%=MTool.getBase()%>";</script>
<%=T.css("css/base.css") %>
<%=T.css("js/dtree/dtree.css") %>
<%=T.js("js/dtree/dtree.js") %>
</head>
<body>
<table width='99%' height="100%" border='0' cellspacing='0' cellpadding='0'>
  <tr>
    <td style='padding-left:3px;padding-top:8px' valign="top">
			<script type="text/javascript">
	 		r = new dTree('r');
			r.add(0,-1,"人员权限","","","菜单管理","","","");
 			<%
                List<MRecord> YHZ_LST=MR.me().getAttr("YHZ_LST");
                List<MRecord> RY_LST=MR.me().getAttr("RY_LST");
                if(!MCheck.isNull(YHZ_LST)){
                   for(MRecord yhz:YHZ_LST){
           %>
		        r.add(<%=yhz.getStr("dm")%>, 0, "<%=yhz.getStr("mc")%>","xitong/quanxian/index/<%=yhz.getStr("dm")%>/<%=yhz.getStr("mc")%>", "<%=yhz.getStr("mc")%>", "menu_content");
		    <%
		    	 for(MRecord ry:RY_LST){ 
		    	 	if(ry.getStr("yhzdm").equals(yhz.getStr("dm"))){
		    %>
		    	r.add('<%=ry.getStr("bh")%>','<%=yhz.getStr("dm")%>','<%=ry.getStr("xm")%>','xitong/quanxian/index/<%=ry.getStr("bh")%>/<%=ry.getStr("xm")%>','<%=ry.getStr("xm")%>','menu_content');
		    <% }}}}%>
   	 		document.write(r); 
       </script>			             
	  </td>
  </tr>
</table>
</body>
</html>