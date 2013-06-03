<%@ page language="java" import="java.util.*,com.jzero.util.MTool" pageEncoding="UTF-8"%>
<%@ page import="com.jzero.util.*,com.jzero.tag.*,com.jzero.core.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>main</title>
<base target="_self"/>
<%=T.js("js/jquery.js") %>
<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=true"></script>
<%=T.js("js/gmaps/gmaps.js") %>
<%=T.css("js/gmaps/examples.css") %>
<%String gmaps=MR.me().getAttr(Msg.OBJECT);%>
<script type="text/javascript">
var map;
    $(document).ready(function(){
    	<%=gmaps%>
    });
</script>
</head>
<body>
<div id="map" style="height: 520px"></div>
</body>
</html>