
package guilinsoft.sky.utils;

import com.jzero.db.core.M;
import com.jzero.util.MCnt;
import com.jzero.util.MSession;
import com.jzero.util.MTool;

/** 
 * 2012-11-1: 
 * wangujqw@gmail.com
 */
public class Tools extends MTool {
	//2012-11-1 判断当前用户是否是管理员
	public static boolean is_admin(){
		String where=MCnt.me().and_eq("yhzdm",MMsg.SYS).and_eq("bh",MSession.get().get("bh")).toStr();
		return M.me().check(MMsg.XT_USER, where);
	}
	//判断当前用户是否已审核,如果已审核,则只有管理员可以删除与信息,否则只能查看 2012-11-12
	public static boolean is_audit(String shzt,boolean is_admin){
		return shzt.equals("未审核")?true:is_admin?true:false;
	}

	public static String repeat(Object str,String src_str){
		String repeat_str="";
		int num=src_str.split("-").length-2;
		if(str instanceof Integer){//整数则相乘
			repeat_str=num+"";
		}else if(str instanceof String){
			repeat_str="";
			if(num>0){
				repeat_str=str.toString();
				for(int i=1;i<num;i++){
					repeat_str+=str;
				}
			}
		}
		return repeat_str;
	}
}
