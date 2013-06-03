package guilinsoft.sky.action;

import guilinsoft.sky.utils.MMsg;

import java.util.List;

import com.jzero.comm.MCommHelp;
import com.jzero.core.MR;
import com.jzero.db.cache.MCache;
import com.jzero.db.core.M;
import com.jzero.json.JSONObj;
import com.jzero.render.MB;
import com.jzero.util.MCheck;
import com.jzero.util.MCnt;
import com.jzero.util.MPro;
import com.jzero.util.MRecord;

public class Welcome {
	public void index() {
		MR.me().redirect("xitong/login/index");
	}
	public void main(){
		//在这里创建地图坐标
		StringBuffer mapStr=new StringBuffer();
		mapStr.append("map = new GMaps({")
			  .append("div:").append("'#map',")
			  .append("lat:").append(MPro.me().getStr("latitude")).append(",")//中心纬度
			  .append("lng:").append(MPro.me().getStr("longitude")).append(",")			//中心经度
			  .append("zoom:").append(10) 							//显示的距离
			  .append("});");
		     
		mapStr.append(addMarker());
		MR.me().setAttr(MMsg.OBJECT, mapStr.toString());
		MB.me().getJspRender("/xitong/main/main.jsp");
	}
	private StringBuffer addMarker(){
		List<MRecord> lst=M.me().get_table_n(MMsg.XT_TERMINAL);
		StringBuffer sb=new StringBuffer();
		if(!MCheck.isNull(lst)){
			for(MRecord row:lst){
				sb.append("map.addMarker({")
				  .append(" lat:").append(row.getStr("latitude")).append(",")		//纬度
				  .append(" lng:").append(row.getStr("longitude")).append(",");		//经度
				  if("false".equalsIgnoreCase(row.getStr("online"))){//不在线,则灰色		
					  sb.append(" icon: 'http://chart.apis.google.com/chart?chst=d_map_pin_letter&chld="+row.getStr("zdbh")+"|8E8E8E|000000'").append(",");  //前面的是背景颜色,后面是字体颜色
				  }
				sb.append(" title:'").append("终端:"+row.getStr("zdbh"))	.append("',")		//终端编号
				  .append(" infoWindow: {")
				  .append(" content:'").append("<div class=overlay><p>终端名称:[").append(row.getStr("zdbh")).append("]</p>")
				  					  	.append("<p>IP:[").append(row.getStr("ip")).append("]</p>")
				  					    .append("<p>最后登录时间:[").append(row.getStr("logintime")).append("]</p></div>'")
				  .append("}")
				  .append("});");
			}
		}
		return sb;
	}
	public void top(){
		MB.me().getJspRender("/xitong/main/top.jsp");
	}
	//清理缓存
	public void clear(){
		MCache.me().deleta_all_cache();
		MR.me().redirect("welcome/main");
	}
	//右下角提示的未审核信息
	public void check_audit(){
		MRecord out=new MRecord();
		//广告
		out.set("ad", M.me().get_count(MMsg.WZ_ADVERTISING,MCnt.me().and_eq("is_audit",0).toStr()));
		//首页图片
		out.set("pic", M.me().get_count(MMsg.WZ_HOME_PHOTO,MCnt.me().and_eq("is_audit",0).toStr()));
		//网站数据
		out.set("content", M.me().get_count(MMsg.WZ_CONTENT,MCnt.me().and_eq("is_audit",0).toStr()));
		MCommHelp.outHTML(JSONObj.toJSONString(out));
		
	}
	
	
}
