<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8");//只在这加了一句，问题解决 %> 
<%@ page import="com.jzero.util.*,com.jzero.tag.*,com.jzero.core.*"%>
  <%=T.head("列表页面",MTool.getBase()) %>
    <%=T.css("css/dividPage.css") %>
    <%@include file="../js/base.jsp" %>
	<%@include file="../js/dialog.jsp" %>
	<script type="text/javascript">
		$(function(){ list_page(); <% String order=MR.me().getAttr(Msg.ORDER_STR);if(!MCheck.isNull(order)){out.write("c_order('"+order+"')");}%>})
	</script>
  <%=T.head_end() %>
  <body>
  <%
    MRecord record=MR.me().getAttr(Msg.OBJECT);
    List<MRecord> slst=MR.me().getAttr(Msg.SELECT_DATAS);//检索下拉框(eg,已审核,未审核)
    List<MRecord> list=null;String cxzd=null;String cxnr=null; String select_name=null;String btime=null;String etime=null;
    if(!MCheck.isNull(record)){
	  	list=record.get("lst");//检索的下拉框,display字段				
	    cxzd=record.get("cxzd");//检索的字段
	    cxnr=record.get("cxnr");//检索的内容
	    if(MCheck.isNull(cxnr)){ cxnr="";}
	    select_name=record.get("select_name");//检索下拉框值
	    btime=record.get("btime");//检索开始时间
	    btime=MCheck.isNull(btime)?MDate.get_year()+"-01-01":btime;
	    etime=record.get("etime");//截止时间
	    etime=MCheck.isNull(etime)?MDate.get_max_day():etime;
    }
    boolean show_comm=MR.me().getParaToBoolean(request,Msg.SHOW_COMM,true);//是否显示共同检索
    boolean show_time=MR.me().getParaToBoolean(request,Msg.SHOW_TIME,false);//是否显示检索时间框
    boolean show_add=MR.me().getParaToBoolean(request,Msg.SHOW_ADD,true);//是否新装按钮
    String find_uri	=MR.me().getPara(request,Msg.FIND_URI,null);//查询的按钮
    String add_uri=MR.me().getPara(request,Msg.ADD_URI,null);
    
    
    String directory=MRouter.me().getDirectory();
    String controller= MRouter.me().getController();
    String path=(MCheck.isNull(directory)?controller:directory+"/"+controller).toLowerCase();
    find_uri=MCheck.isNull(find_uri)?path+"/find":find_uri;
    add_uri=MCheck.isNull(add_uri)?MTool.getBase()+path+"/add":add_uri;
    //称
    String add_name=MR.me().getPara(request,"ADD_NAME","新增");
  %>
  
<%=T.form_open(find_uri) %><!-- bgcolor="#d1ddaa"  -->
<table width="98%" border="0" cellpadding="0"  bgcolor="#d1ddaa"  cellspacing="1" align="center">
<tr>
 <td class="top_title">
  <table width="98%" border="0" cellspacing="0" cellpadding="0">
  <tr> 
  	<% if(!MCheck.isNull(slst)){ //如果为空,则默认不显示下拉框 %>
     <td align="right">审核状态:
      <select name="select_name">
      <option value="">全部信息</option>    
         <% for(MRecord r:slst){ %>
       		<option value="<%=r.getStr("mc") %>" <% if(r.getStr("mc").equals(select_name)){  out.write(" selected ");} %>><%=r.getStr("mc") %></option>
         <% } %>     
       </select>
     </td>
    <% } %>
    <% if(show_comm){%>
	    <td align="right"><label for="cxzd">查询字段:</label> 
		    <select  name="cxzd" id="cxzd" ><option value="all">全部信息</option>         
		       <%  if(!MCheck.isNull(list)){for(MRecord r:list){ %>
		       		<option value="<%=r.getStr("field") %>" <% if(r.getStr("field").equals(cxzd)){  out.write(" selected ");} %> ><%=r.getStr("comment") %></option>
		       <% }} %>
		    </select>
	    </td>
    <td align="right"><label for="cxnr">查询内容:</label> 
    	<%=T.input("cxnr",cxnr) %>
    </td>
    <% } %>
    <% if(show_time){ %>
	     <td align="right"><label for="begintime">时间:</label>
	     	<%=T.time_must_ymd("btime",btime) %>
	         <td align="right"><label for="endtime">至:</label>
	         <%=T.time_must_ymd("etime",etime) %>
    <% } %>
    <% if(show_comm){ %>
    	 <td width="8%" style="padding:2px 10px 2px 15px" > <img src="<%=MTool.getBase() %>/images/search.png" height="28px"  class="coolbt" onclick="if(check_find()){ getObjById('niceform').submit()} "/>  </td>
    <% }else{if(show_time){ %>
    	<td width="12%" style="padding:2px 10px 2px 15px" > <img src="<%=MTool.getBase() %>/images/search.png" height="28px"  class="coolbt" onclick="getObjById('niceform').submit() "/>  </td>
    <%}} %>
    <% if(show_add){%>
       <td align="right"  height="26"  width="8%">
       	<%=T.button(add_name,"go_to_url('"+add_uri+"')") %>
       </td>
    <% } %>
 </tr>
</table>
</td>
</tr>
</table>
<%=T.form_close() %>
