
package guilinsoft.sky.action;

import java.util.List;

import com.jzero.core.MR;
import com.jzero.core.MURI;
import com.jzero.db.core.M;
import com.jzero.render.MB;
import com.jzero.upload.MUpload;
import com.jzero.util.MCheck;
import com.jzero.util.MCnt;
import com.jzero.util.MEnum;
import com.jzero.util.MRecord;
import com.jzero.util.Msg;

/** 
 * 2012-10-26: 
 * wangujqw@gmail.com
 */
public class Common {

	public void check_is_exist(){
		String table=MR.me().getPara("t_str");//查询的表名
		String qStr=MR.me().getPara("qStr");//要查询的字段值
		String fieldStr=MR.me().getPara("nStr");//要查询的字段
		String where=MCnt.me().and(fieldStr, MEnum.EQ, qStr).toStr();
		String qStr2=MR.me().getPara("q2Str");
		if(!MCheck.isNull(qStr2)){
			String fieldStr2=MR.me().getPara("n2Str");//要查询的字段
			where+=MCnt.me().and(fieldStr2, MEnum.EQ, qStr2).toStr();
		}
		MB.me().getJsonRender(String.valueOf(M.me().check(table, where)));
	}
	//跳转到上传文件页面
	public void to_mulimg(){
		MR.me().setAttr(Msg.CON_MUL_IMG, "");
		MB.me().getJspRender("/comm/mulimg.jsp");
	}
	public void mulimg(){
		List<MRecord> lst=MUpload.me().mulupload();
		MR.me().setAttr(Msg.CON_MUL_IMG, lst);
		MB.me().getJspRender("/comm/mulimg.jsp");
	}
	
	//跳转到上传图片页面
	public void to_upimg(){
		MURI uri=MURI.me();
		MR.me().setAttr(Msg.CON_IMG, "").setAttr("HID", uri.seg_str(2)).setAttr("IMGID",uri.seg_str(3));
		MB.me().getJspRender("/comm/upImg.jsp");
	}
	//图片上传
	public void upimg(){
		MRecord record=MUpload.me().upload();
		MR.me().setAttr(Msg.CON_IMG, record.get("userfile")).setAttr("HID",record.get("hid")).setAttr("IMGID",record.get("imgid"));
		MB.me().getJspRender("/comm/upImg.jsp");
	}
}
