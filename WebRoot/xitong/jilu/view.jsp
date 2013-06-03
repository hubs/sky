<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>显示页面</title>
<? require_once(COMM_BASE)?>
</head>
<body>
<? 
   // $BACK_URL="xitong/jilu/show_find";
    include(COMM_VIEW)
?>

<table width="98%" border="0" cellpadding="2" align="center" cellspacing="1" align="center" bgcolor="#d1ddaa" class="other" align="center" style="margin-top:8px">
<tr bgcolor="#E7E7E7">
	<td colspan="2"  class="title">【显示页面】</td>
</tr>   

<tr>
	<td >记录时间:</td>
	<td ><?=$data->time?></td>

</tr>
<tr>
	<td >事件:</td>
	<td><?=$data->event?></td>
</tr> 
<tr>
	<td >操作用户:</td>
	<td><?=$data->username?></td>
</tr> 
<tr>
	<td >登记IP:</td>
	<td><?=$data->loginIp?></td>
</tr> 
<tr>
	<td ><label for="beizhu">原始值:</label></td>
	<td ><textarea  cols="60" rows="3" ><?=$data->oldvalue?></textarea></td>
</tr> 
<tr>
	<td ><label for="beizhu">操作值:</label></td>
	<td ><textarea cols="60" rows="3" ><?=$data->newvalue?></textarea></td>
</tr> 
<tr >
	<td height="8" colspan="2" class="title" ></td>
</tr>
</table>



</body>
</html>