package guilinsoft.sky.action.backstage;

import guilinsoft.sky.utils.MMsg;
import guilinsoft.sky.utils.Tools;

import java.util.List;

import com.jzero.comm.MComm;
import com.jzero.comm.MCommHelp;
import com.jzero.core.MR;
import com.jzero.core.MURI;
import com.jzero.db.core.M;
import com.jzero.render.MB;
import com.jzero.util.MCheck;
import com.jzero.util.MCnt;
import com.jzero.util.MDate;
import com.jzero.util.MRecord;
import com.jzero.util.MSession;
import com.jzero.util.MTool;
import com.jzero.util.Msg;

public class Content {

	public void menu_frame(){
		MB.me().getJspRender("/backstage/content/menu_frame.jsp");
	}
	
	public void left(){
		List<MRecord> cdDatas=M.me().get_where(MMsg.XT_CATEGORY,MCnt.me().first_eq("parent_id", 0).toStr());
		MR.me().setAttr("LEFT", cdDatas);
        MB.me().getJspRender("/backstage/content/left.jsp");
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
		MComm.me().m_list(MMsg.WZ_CONTENT,out_datas,where,new Object[]{"order by is_recommend ,pubdate desc "});
	}
	public void add(){
		MRecord out=add_edit_comm(get_fl());
		MComm.me().m_add(out);
	}
	public void save(){
		int result=update_add_comm(null);
		String msg=result>0?Msg.INSERT_SUCCESS:Msg.INSERT_ERROR;
		MR.me().setAttr(Msg.OUT_DATAS, add_edit_comm(get_fl())).setAttr(Msg.MESSAGE, msg);
		MB.me().getJspRender("/backstage/content/add.jsp");
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
	private int update_add_comm(Integer id){
		MRecord in=MR.me().getPara();
		String mrz=in.getStr("mrz[]");//如果存在默认值,则取第一个放入主表中显示
		String path[]=MR.me().getParaValues("path[]");//路径+名称
		String name[]=MR.me().getParaValues("name[]");//名称
		in.remove("mrz[]").remove("path[]").remove("name[]").set("path", mrz);
		int reid=0;
		int pid;
		in.set("category_name", in.getStr("category_name").replace("\u00a0","").replace("└", "").trim());
		if(MCheck.isNull(id)){
			in.set("pubdate", MDate.get_ymd_hms()).set("publisher", MSession.getName());
			pid=M.me().insert_reid(MMsg.WZ_CONTENT, in);
			reid=pid;
		}else{
			pid=id;
			String where=MCnt.me().first_eq("id",id).toStr();
			reid=M.me().update(MMsg.WZ_CONTENT, in, where);
		}
		
		//插入明细前先将明细表清除
		M.me().delete(MMsg.WZ_CONTENT_MX, MCnt.me().first_eq("pid", pid).toStr());
		
		MRecord mxMr=new MRecord().set("pid", pid);
		if(!MCheck.isNull(name)){
			for(int i=0;i<name.length;i++){
				mxMr.set("name", name[i]).set("path", path[i]);
				M.me().insert(MMsg.WZ_CONTENT_MX, mxMr);
			}
		}
		return reid;
	}
	public void edit(){
		MRecord out=add_edit_comm(get_fl(4));
		String where=MCnt.me().first_eq("pid", MURI.me().seg_int(3)).toStr();
		out.set("mxlst", M.me().get_where(MMsg.WZ_CONTENT_MX, where));
		MComm.me().m_edit(MMsg.WZ_CONTENT,out,3);
	}
	public void view(){
		MRecord out=get_fl(4);
		String where=MCnt.me().first_eq("pid", MURI.me().seg_int(3)).toStr();
		out.set("mxlst", M.me().get_where(MMsg.WZ_CONTENT_MX, where));
		MComm.me().m_edit(MMsg.WZ_CONTENT,out,3);		
	}
	public void update(){
		MRecord out=add_edit_comm(get_fl());
		int id=MR.me().getParaToInt("id");
		int result=update_add_comm(id);
		String msg=result>0?Msg.MODIFY_SUCCESS:Msg.MODIFY_ERROR;
		MR.me().setAttr(Msg.OUT_DATAS, out).setAttr(Msg.MESSAGE, msg);
		MCommHelp.outHTML("backstage/content/index/"+out.getStr("parent_id")+"/"+out.getStr("parent_name"),msg);
	}
	public void del(){
		MRecord out_datas=get_fl(4);
		String url="backstage/content/index/"+out_datas.getStr("parent_id")+"/"+out_datas.getStr("parent_name");
		//删除文件
		MComm.me().m_del(MMsg.WZ_CONTENT,url,3);
	}
}
