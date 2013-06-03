<%@ page language="java"  contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@page import="com.jzero.tag.*,com.jzero.util.*,java.util.*,com.jzero.core.MR"%>
<%=T.head("权限管理列表",MTool.getBase()) %>
    <%=T.css("css/base.css") %>
    <%=T.css("js/wtree/wtree.css") %>
    <%=T.js("js/wtree/wtree.js") %>
<%=T.head_end() %>
<%=T.body() %>
<%
	String dm=MR.me().getAttr("dm");
	String mc=MR.me().getAttr("mc");
	String[] cdid=MR.me().getAttr("cdid");
	List<MRecord> lst=MR.me().getAttr(Msg.OUT_DATAS);
 %>
 <%=T.form_open_m("xitong/quanxian/add","return check()") %>
 <%=T.hidden("cdid","") %>
 <%=T.hidden("dm",dm) %>
 <%=T.hidden("mc",mc) %>
<!--  快速转换位置按钮  -->
<table width="98%" border="0" cellpadding="0" cellspacing="1" bgcolor="#D1DDAA" align="center">
<tr>
 <td class="top_title">
    <input type='submit' class="coolbg np" value='保存'  />
</td>
</tr>
</table>
<%=T.form_close() %>
<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
<tr bgcolor="#E7E7E7">
	<td height="24" colspan="5" class="title">&nbsp;【<%=mc %>】 权限分配&nbsp;</td>
</tr>
<tr  bgcolor="#FAFAF1" onmousemove="javascript:this.bgColor='#FCFDEE';" onmouseout="javascript:this.bgColor='#FFFFFF';" height="22" >
  <td colspan="5">
   <fieldset>
       <legend>菜单功能项目</legend>
       <div  style="height: 282px; overflow: scroll; overflow-x: hidden; overflow-y: scroll;">
            <div id="systree"></div>			  
       </div>
   </fieldset> 
  </td>
 </tr>

<tr bgcolor="#FAFAF1">
<td height="7" colspan="5"></td>
</tr>

</table>
     <script type="text/javascript">
    
    var d = new dTree('d','<%=MTool.getBase()%>images/dtree/');
	d.config.folderLinks=true;
	d.config.useCookies=false;
	d.config.check=true;
	d.add(0,-1,'系统菜单',"javascript:;",'提示');
	<%for(MRecord row:lst){if(!row.getStr("op_type").equals("ROOT")){%>
			d.add(<%=row.getStr("id")%>, <%=row.getStr("pid")%>, "<%=row.getStr("name")%>","javascript:;", "<%=row.getStr("title")%>");
	<%	}}%>	
	document.getElementById('systree').innerHTML = d;
 	function sel(){
	    var selids=d.getCheckedNodes();
        var str="";
		for(var n=0; n<selids.length; n++){
			str+=selids[n]+"-";
		}
		return str;
	}
    function check(){	
		var gnlist = sel();
		document.getElementById("cdid").value = gnlist;
		if(gnlist==null || gnlist==''||gnlist=="0,"){
		   alert("请选分配菜单功能项目！");
		   return false;
		}
		if(confirm("确认分配此权限?")){
		  return true;
		}
	  
	}
	<%
		if(!MCheck.isNull(cdid)){
			for(String str:cdid){
			 out.write("  d.co('"+str+"').checked=true;");
			}
		}
		T.alert();
	%>
 </script>
</body>
</html>