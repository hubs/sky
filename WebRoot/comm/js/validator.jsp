<%@ page language="java" import="com.jzero.tag.T" pageEncoding="UTF-8"%>
<%=T.css("js/formValidator/validationEngine.jquery.css") %>
<%=T.js("js/formValidator/jquery.validationEngine.js") %>
<%=T.js("js/formValidator/jquery.validationEngine-cn.js") %>
<script type="text/javascript">
	    $(function(){ $("#niceform").validationEngine(); onlyNumber();})
</script>