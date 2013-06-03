
package guilinsoft.sky.action.xitong;

import guilinsoft.sky.utils.MMsg;

import com.jzero.comm.MComm;
import com.jzero.core.MR;
import com.jzero.core.MURI;
import com.jzero.db.core.M;
import com.jzero.render.MB;
import com.jzero.util.MCnt;
import com.jzero.util.MEnum;
import com.jzero.util.MMD5;
import com.jzero.util.MRecord;
import com.jzero.util.MSession;
import com.jzero.util.MTool;
import com.jzero.util.Msg;

/** 
 * 2012-10-25: 人员管理
 * wangujqw@gmail.com
 */
public class Renyuan {

	public void menu_frame(){
		MB.me().getJspRender();
	}
	public void left(){
		MR.me().setAttr("YHZ_LST",  M.me().get_field("dm,mc", MMsg.XT_YHZ,"order by px desc"));
        MB.me().getJspRender();
	}
	private MRecord get_comm(int seg){
		return new MRecord().set("yhzdm", MURI.me().seg_str(seg)).set("yhzmc",MTool.decode(MURI.me().seg_str(seg+1)));
	}
	public void index(){
		MRecord record=get_comm(3);
		String where=MCnt.me().and("yhzdm", MEnum.EQ, record.get("yhzdm")).toStr();
		MComm.me().m_list(MMsg.XT_USER, record, 5, where, "order by px desc");
	}
	public void add(){
		MRecord record=get_comm(3);
		MComm.me().m_add(record);
		
	}
	public void save(){
		MRecord in=MR.me().getPara();
		MRecord out=get_comm(3);
		in.set("mm", MMD5.StrToMD5("123"));
		MComm.me().m_save(MMsg.XT_USER,"add", in,out);
	}
	public void edit(){
		MRecord out=get_comm(4);
		MComm.me().m_edit(MMsg.XT_USER, out,3);
	}
	public void update(){
		MRecord  out=get_comm(3);
		MComm.me().m_update(MMsg.XT_USER,"xitong/renyuan/index/"+out.getStr("yhzdm")+"/"+out.getStr("yhzmc"));
	}
	public void del(){
		MRecord out=get_comm(4);
		MComm.me().m_del(MMsg.XT_USER, "xitong/renyuan/index/"+out.getStr("yhzdm")+"/"+out.getStr("yhzmc"), 3);
	}
	//指锁定与解锁用户
	public void batch(){
		String strV=MTool.decode(MURI.me().seg_str(3));
		MRecord out=get_comm(4);
		if(strV.equals("解锁")){
			strV="使用";
		}
		MRecord inDatas=new MRecord().set("yhzt", strV);
		MComm.me().m_batch_update(MMsg.XT_USER, "xitong/renyuan/index/"+out.getStr("yhzdm")+"/"+out.getStr("yhzmc"),inDatas);
	}
	public void view(){
		MComm.me().m_view(MMsg.XT_USER,3);
	}
	public void pass(){
		MB.me().getJspRender();
	}
	public void save_pass(){
		String old=MR.me().getPara("oldpass");
		String news=MR.me().getPara("newpass");
		String qrpass=MR.me().getPara("qrpass");
		if(!news.equals(qrpass)){
			MR.me().setAttr(Msg.MESSAGE, "新密码必须和确认密码一致");
			MB.me().getJspRender("pass.jsp");
			return;
		}
		String where=MCnt.me().and("xm", MEnum.EQ, MSession.getName()).and("mm", MEnum.EQ, MMD5.toMD5(old)).toStr();
		boolean bool=M.me().check(MMsg.XT_USER, where);
		if(bool){
			MComm.me().m_save(MMsg.XT_USER,"pass",new MRecord().set("mm", MMD5.toMD5(news)));
		}else{
			MR.me().setAttr(Msg.MESSAGE, "旧密码输入错误");
			MB.me().getJspRender("pass.jsp");
		}
	}
}
