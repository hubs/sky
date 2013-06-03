package guilinsoft.sky.action.backstage;

import guilinsoft.sky.utils.MMsg;
import guilinsoft.sky.utils.Tools;

import java.util.List;

import com.jzero.comm.MComm;
import com.jzero.core.MR;
import com.jzero.core.MURI;
import com.jzero.db.core.M;
import com.jzero.render.MB;
import com.jzero.util.MCnt;
import com.jzero.util.MDate;
import com.jzero.util.MRecord;
import com.jzero.util.MSession;
import com.jzero.util.MTool;
/**
 * 广告管理
 * @author Administrator
 */
public class Ad{

	public void menu_frame(){
		MB.me().getJspRender("/backstage/ad/menu_frame.jsp");
	}
	
	public void left(){
		List<MRecord> cdDatas=M.me().get_where(MMsg.XT_CATEGORY,MCnt.me().first_eq("parent_id", 0).toStr());
		MR.me().setAttr("LEFT", cdDatas);
        MB.me().getJspRender("/backstage/ad/left.jsp");
	}
	private MRecord get_fl(int seg){
		return new MRecord().set("parent_id", MURI.me().seg_str(seg)).set("parent_name",  MTool.decode(MURI.me().seg_str(seg+1)));
	}
	private MRecord get_fl(){
		return get_fl(3);
	}
	
	public void index(){
		MRecord out_datas=get_fl();
		String where=MCnt.me().and_eq("parent_id",out_datas.get("parent_id")).toStr();
		MComm.me().m_list(MMsg.WZ_ADVERTISING,out_datas,where,new Object[]{"order by is_recommend  "});
	}
	public void add(){
		MRecord out=add_edit_comm(get_fl());
		MComm.me().m_add(out);
	}
	public void save(){
		MRecord out=add_edit_comm(get_fl());
		MRecord in=MR.me().getPara();
		in.set("pubdate", MDate.get_ymd_hms()).set("publisher", MSession.getName());
		in.set("category_name", in.getStr("category_name").replace("\u00a0","").replace("└", "").trim());
		MComm.me().m_save(MMsg.WZ_ADVERTISING,in,out);
	}
	private MRecord add_edit_comm(MRecord out){
		String where=MCnt.me().first_eq("root_id",out.get("parent_id")).toStr();
		List<MRecord> lst=M.me().get_data("id dm,name mc,path ph", MMsg.XT_CATEGORY, where, new Object[]{"order by path asc"});
		for(MRecord row:lst){
			row.set("mc",Tools.repeat("&nbsp;&nbsp;", row.getStr("ph"))+"└"+row.getStr("mc"));
		}
		out.set("category", lst);
		return out;
	}

	public void edit(){
		MRecord out=add_edit_comm(get_fl(4));
		MComm.me().m_edit(MMsg.WZ_ADVERTISING,out,3);
	}
	public void view(){
		MRecord out=get_fl(4);
		MComm.me().m_view(MMsg.WZ_ADVERTISING,3,out);		
	}
	public void update(){
		MRecord out=get_fl();
		String url="backstage/ad/index/"+out.getStr("parent_id")+"/"+out.getStr("parent_name");
		MComm.me().m_update(MMsg.WZ_ADVERTISING, url);
	}
	public void del(){
		MRecord out_datas=get_fl(4);
		String url="backstage/ad/index/"+out_datas.getStr("parent_id")+"/"+out_datas.getStr("parent_name");
		MComm.me().m_del(MMsg.WZ_ADVERTISING,url,3);
	}
}
