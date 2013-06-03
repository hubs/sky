<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.jzero.util.*,com.jzero.tag.*,com.jzero.core.*"%>
<!DOCTYPE html>
<html>
<head>    
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />  
<script type="text/javascript" src="<%=MTool.getBase() %>js/jquery.js" ></script>
<style type="text/css">
*{font-size:14px;font-family:"微软雅黑";}
</style>
</head>    
<body>
<%=T.form_open_mul("Common/mulimg") %>  
<table>
    <tr>
        <td><input type="file" name="userfile" id="userfile" onchange="this.form.submit();" multiple="multiple"   /></td>
        <td>注意:<br/>1、IE浏览器不支持多图片上传.<br/>2、如果上传的文件较大,请耐心等待...<br/>3、图片格式不支持tif格式</td>
    </tr>
</table> 
<%=T.form_close() %>
<script type="text/javascript">
	<%
		Object obj=MR.me().getAttr(Msg.CON_MUL_IMG);
		if(!MCheck.isNull(obj)){
			List<MRecord> lst=(List<MRecord>)obj;
			out.write("  $obj=$('#show_img',window.parent.document);");
			boolean bool_first=false;
			for(int i=0;i<lst.size();i++){
				out.write("var h_t='';");
				bool_first=i==0?true:false;
				String pathname=lst.get(i).getStr("userfile");
				String name=lst.get(i).getStr("name");
				MPrint.print(pathname);
				out.write("h_t=h_t+\"<ul  class='"+name.replace(".","_")+"'><li class='li'><img alt='"+name+"'  width='120px' height='60px' src='"+MTool.getBase()+"upload/"+pathname+"'/></li>\"");
				out.write(" +\"<li class='t'>\"");
				out.write(" +\"<input type='hidden' name='name[]' value='"+name+"'/>\"");
				out.write(" +\"<input type='hidden' name='path[]' value='"+pathname+"'>\"");
				out.write(" +\"<input type='radio' name='mrz[]'　class='input_align' value='"+pathname+"'");
				if(bool_first){
					out.write(" checked='true' ");
				}
				out.write(" />默认首图\"");
				out.write(" +\"<a  href='javascript:;' onclick='remove_this(this.id)' title='删除此图片' style='padding-left:15px' id='"+name.replace(".","_")+"' >删除</a>\"");
				out.write(" +\"</ul></li>\";");
				
				out.write("  $obj.html($obj.html()+h_t);");
			}
		
		}
	%>
</script>
</body>
</html> 