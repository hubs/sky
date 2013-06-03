<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.jzero.util.*,com.jzero.tag.*,com.jzero.core.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">   
<head>    
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />    
</head>    
<body>
<%
		String imgname=MR.me().getAttr(Msg.CON_IMG);
		String hid=MR.me().getAttr("HID");
		String imgid=MR.me().getAttr("IMGID");
 %>
<%=T.form_open_mul("Common/upimg") %>
<table>
    <tr>
        <td><input type="file" name="userfile" id="userfile" onchange="this.form.submit();"   /></td>
        <td><input type="hidden" name="hid" value="<%=hid %>"/><input type="hidden" name="imgid" value="<%=imgid %>"/></td>
    </tr>
</table> 
<%=T.form_close() %>
<script type="text/javascript">
   	<% 
		if(!MCheck.isNull(imgname)){
			out.write("var txthidden = parent.document.getElementById('"+hid+"'); ");
			out.write("var img=parent.document.getElementById('"+imgid+"');");
			out.write("txthidden.value = '"+imgname+"'; ");
			out.write("img.src = '"+MTool.getBase()+"upload/"+imgname+"'; ");
		}
	%>
</script>
</body>  
</html> 