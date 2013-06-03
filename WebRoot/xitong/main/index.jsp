<%@ page language="java"  contentType="text/html; charset=utf-8" pageEncoding="utf-8" import="java.util.*"%>
<%@page import="com.jzero.util.*,com.jzero.core.MR"%>
<%
	MRecord mr=MSession.get();
	if(MCheck.isNull(mr)){
		MR.me().redirect("welcome");return;
	}
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>后台管理</title>
<base target="main" />
<%@include file="/comm/js/base.jsp" %>
<%@include file="/comm/js/dialog.jsp" %>
<style>
.li {
list-style: none;
cursor: default;
margin: 3px;
border-bottom: dashed 1px #666;
}
</style>
<%
	MRecord record=MR.me().getSessionAttr(Msg.OBJECT);
	boolean bool_sys=record.getBoolean("bool_sys");
	List<MRecord> first_lst=record.get("first");
	List<MRecord> second_lst=record.get("second");
	List<MRecord> three_lst=record.get("second");
 %>
<script type="text/JavaScript"> 
$(function(){ 
    $("[id^='left']").each(function(i,item){ 
      $(this).hide();
  });
})


function show_menu(num){
for(i=0;i<120;i++){       //先把节点全部隐藏,lio在最下面
	if(document.getElementById('li0'+i)){
	   document.getElementById('li0'+i).style.display='none';
	   document.getElementById('f0'+i).className='';
	 }
}
	  document.getElementById('li0'+num).style.display='block';//触发以后信息块    将选中的显示
	  document.getElementById('f0'+num).className='left02down01_xia_li';//触发以后TAG样式
}
//隐藏一级目录
function show_menuA(numB){

	if(document.getElementById('left'+numB)){   
		if(document.getElementById('left'+numB).style.display=='block'){
		  document.getElementById('left'+numB).style.display='none';
		 document.getElementById('Bf0'+numB).style.background='url(<%=MTool.getBase()%>images/01.gif)';
		}else {
		  document.getElementById('left'+numB).style.display='block';
		  document.getElementById('Bf0'+numB).style.background='url(<%=MTool.getBase()%>images/02.gif)';
		}
	}
}

  //显示本身，别的结点收起来
function show_menuB(numB){

	for(j=0;j<300;j++){
		 if(j!=numB){
			if(document.getElementById('Bli0'+j)){
		    document.getElementById('Bli0'+j).style.display='none';
		    document.getElementById('Bf0'+j).style.background='url(<%=MTool.getBase()%>images/01.gif)';
            document.getElementById(j).style.color="#000000";
	  	   }
		 }
	}
     
	if(document.getElementById('Bli0'+numB)){   
		if(document.getElementById('Bli0'+numB).style.display=='block'){
		  document.getElementById('Bli0'+numB).style.display='none';
		 document.getElementById('Bf0'+numB).style.background='url(<%=MTool.getBase()%>images/01.gif)';
       
         
		}else {
		  document.getElementById('Bli0'+numB).style.display='block';
		  document.getElementById('Bf0'+numB).style.background='url(<%=MTool.getBase()%>images/02.gif)';
          document.getElementById(numB).style.color="red";
         
		}
	}
}

//点击左边隐藏
var temp=0;
function show_menuC(){
		if (temp==0){
		 document.getElementById('LeftBox').style.display='none';
	  	 document.getElementById('RightBox').style.marginLeft='0';
		 document.getElementById('Mobile').style.background='url(<%=MTool.getBase()%>images/center.gif)';

		 temp=1;
		}else{
		document.getElementById('RightBox').style.marginLeft='222px';
	   	document.getElementById('LeftBox').style.display='block';
		document.getElementById('Mobile').style.background='url(<%=MTool.getBase()%>images/center0.gif)';

	   temp=0;
			}
	 }
	 <% if(bool_sys){%>
    $(function(){
      GetOrderCount()
      window.setInterval("GetOrderCount()",30*10*1000);//分钟刷新1次
    });
 function  GetOrderCount(){
        $.post("<%=MTool.getBase()%>welcome/check_audit", function(data){ 
                 var obj = eval('(' + data + ')');  //返回的json数据  
                             
                 var pic=obj['pic'];//首页图片
                 var content=obj['content'];//网站数据
                 var ad=obj['ad'];//广告

                 var total=parseInt(pic)+parseInt(content)+parseInt(ad);
                 if(total>0){
                     var msg='<ul><li style="padding:10px;border-bottom:1px dashed #000" ><b>【未审核信息共】:<font color="red" >('+total+')条</b></font></li><div class="clear" ></div></ul>';
                   	 //新闻动态
                     if(parseInt(pic)>0){
	                     msg+="<li class='li'  style='padding-left:15px'>--<a href='<%=MTool.getBase()%>backstage/audit/index/homephoto' target='main'><span class='icon_lightOn'>〖首页图片〗: <font color='red' >("+pic+")条</font></span></a></li><div class='clear'></div>";   
	                 }
	                 if(parseInt(content)>0){
	                  	 msg+="<li class='li'  style='padding-left:15px'>--<a href='<%=MTool.getBase()%>backstage/audit/index/content' target='main'><span class='icon_lightOn'>〖网站数据〗: <font color='red' >("+content+")条</font></span></a></li><div class='clear'></div>";
	                 }
	                 if(parseInt(ad)>0){
	                 	msg+="<li class='li'  style='padding-left:15px'>--<a href='<%=MTool.getBase()%>backstage/audit/index/ad' target='main'><span class='icon_lightOn'>〖网站广告〗: <font color='red' >("+ad+")条</font></span></a></li><div class='clear'></div>";
	                 }
                    
                 if(msg!=0){
                       //var  mp3url="<?=base_url()?>mp3/mm.mp3";
                           $.dialog({id: 'msg',title: '未审核提示',content:msg,width: 280, height: 160,left: '99%',top: '100%',fixed: true,drag: true,resize: true,
                               // mp3:mp3url
                            });
                 } ;
            }        
        });
    }
<%}%>

</script>

</head>

<body>
<div class="header">
	<div class="header03"></div>
	<div class="header01"></div>
	<div class="header02">网站管理后台 </div>
    <div class="header04"></div>
<div id="show_message">
</div>
</div>
<div class="left" id="LeftBox">
	<div class="left01">
		<div class="left01_right"></div>
		<div class="left01_left"></div>
		<div class="left01_c">欢迎<span class="red">【<%=MSession.get().getStr("dlm")%>】</span>的到来！ 
                <a href="<%=MTool.getBase()%>welcome/main" target="main" title="首页">后台首页</a>
        </div>
	</div>
	<% if(!MCheck.isNull(first_lst)){ for(MRecord first:first_lst){ %>
	<div class="left02" >
		<div class="left02top">
			<div class="left02top_right"></div>
			<div class="left02top_left"></div>
			<div class="left02top_c"><a  onclick="show_menuA(<%=first.getStr("id") %>)" style="cursor: pointer;" ><%=first.getStr("name")%></a></div>
		</div>
	  <div class="left02down" id="left<%=first.getStr("id")%>">
	  	<% if(!MCheck.isNull(second_lst)){ for(MRecord second:second_lst){ if(first.get("id").equals(second.get("pid"))){ %>
			<div class="left02down01"><a  onclick="show_menuB(<%=second.getStr("id")%>)" href="<%=MTool.getBase()%><%=second.getStr("url")%>" target="main" id="<%=second.getStr("id")%>"> 
                <div id="Bf0<%=second.getStr("id")%>" class="left02down01_img"></div><%=second.getStr("name")%></a></div>
        			<div class="left02down01_xia noneBox" id="Bli0<%=second.getStr("id")%>">
                        <% boolean bool=false; if(!MCheck.isNull(three_lst)){ 
                        for(MRecord three:three_lst){ 
                         if(second.get("id").equals(three.get("pid"))){if(!bool){ %>
                            <script>$(function(){$("#"+<%=second.getStr("id")%>).removeAttr("target").removeAttr("href")})</script>
                        <% bool=true;} %>
        				<ul>
        					<li  id="f0<%=three.getStr("id") %>"><a href="<%=MTool.getBase()%><%=three.getStr("url") %>" target="main" name="main"><%=three.getStr("name") %></a></li>
        				</ul>
                      <%}}} %>
        			</div>
        	<%}}} %>
		</div>
	</div>
 <%}} %>
	<div class="left01">
		<div class="left03_right"></div>
		<div class="left01_left"></div>
		<div class="left03_c"><a href="<%=MTool.getBase()%>xitong/renyuan/pass" target="main">修改密码</a></div>
	</div>
   	<div class="left01">
		<div class="left03_right"></div>
		<div class="left01_left"></div>
		<div class="left03_c"><a href="<%=MTool.getBase()%>welcome/clear" target="main">清理缓存</a></div>
	</div> 
	<div class="left01">
		<div class="left03_right"></div>
		<div class="left01_left"></div>
		<div class="left03_c"><a href="<%=MTool.getBase()%>xitong/login/logout" target="_top">安全退出</a></div>
	</div>
</div>

<div class="rrcc" id="RightBox">
	<div class="center" id="Mobile" onclick="show_menuC()"></div>
	<div class="right" id="li010">
		<div class="right01">
        <iframe width="100%" height="520px" scrolling="yes" frameborder="0" onload="SetCwinHeight(this);"  name="main" id="main" src="<%=MTool.getBase()%>welcome/main"></iframe></div>
	</div>
</div>


<script>
function SetCwinHeight(obj)
{
  var cwin=obj;
  if (document.getElementById){
	cwin.height =560;
  }
}
</script>
</body>
</html>
