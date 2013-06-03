
package guilinsoft.sky.action.xitong;

import guilinsoft.sky.utils.MMsg;

import com.jzero.comm.MCommHelp;
import com.jzero.core.MR;
import com.jzero.core.MURI;
import com.jzero.db.core.M;
import com.jzero.render.MB;
import com.jzero.util.MCheck;
import com.jzero.util.MCnt;
import com.jzero.util.MEnum;
import com.jzero.util.MRecord;
import com.jzero.util.MTool;
import com.jzero.util.Msg;

/** 
 * 2012-10-25:权限管理
 * wangujqw@gmail.com
 */
public class Quanxian {

	public void menu_frame(){
		MB.me().getJspRender();
	}
	public void left(){
		MR.me().setAttr("YHZ_LST",  M.me().get_field("dm,mc", MMsg.XT_YHZ,"order by px desc")).setAttr("RY_LST",  M.me().get_field("yhzdm,bh,xm", MMsg.XT_USER));
        MB.me().getJspRender();
	}
	public void index(){
		String sql="SELECT id,pid,name,title,i_order,op_type FROM xt_cdb WHERE root_id!=0 and root_show!=0 ORDER BY i_order DESC";
		
		String dm=MURI.me().seg_str(3);
		String mc=MTool.decode(MURI.me().seg_str(4));
		String where=MCnt.me().and("dm", MEnum.EQ, dm).toStr();
		MRecord record=M.me().one_t(MMsg.XT_QXB, where);
		if(!MCheck.isNull(record)){
			MR.me().setAttr("cdid", MTool.lst_to_strs(record, "cdid"));
		}
		MR.me().setAttr("dm", dm).setAttr("mc", mc).setAttr(Msg.OUT_DATAS, M.me().sql(sql)); ////取出所有菜单信息
		MB.me().getJspRender();
	}
	public void add(){
		MRecord record=MR.me().getPara();
		String where=MCnt.me().and("dm", MEnum.EQ, record.get("dm")).toStr();
		boolean bool=M.me().check(MMsg.XT_QXB, where);
		String msg;
		if(bool){
			M.me().update(MMsg.XT_QXB, new MRecord().set("cdid", record.getStr("cdid")), MCnt.me().first("dm", MEnum.EQ, record.get("dm")).toStr());
			msg=Msg.MODIFY_SUCCESS;
		}else{
			M.me().insert(MMsg.XT_QXB, record);
			msg=Msg.INSERT_SUCCESS;
		}
		MCommHelp.outHTML("xitong/quanxian/index/"+record.getStr("dm")+"/"+record.getStr("mc"), msg);
	}
}
