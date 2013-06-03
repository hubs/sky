
package guilinsoft.sky.action.xitong;

import guilinsoft.sky.utils.MMsg;

import java.util.List;

import com.jzero.comm.MComm;
import com.jzero.core.MR;
import com.jzero.core.MURI;
import com.jzero.db.core.M;
import com.jzero.render.MB;
import com.jzero.util.MCheck;
import com.jzero.util.MCnt;
import com.jzero.util.MEnum;
import com.jzero.util.MRecord;
import com.jzero.util.Msg;

/** 
 * 2012-10-15: 菜单管理控制类
 * wangujqw@gmail.com
 */
public class Menu{

	//加载主框架
	public void menu_frame() {
		MB.me().getJspRender("/xitong/menu/menu_frame.jsp");
	}
	//左边树
	public void left() {
		List<MRecord> cdDatas=M.me().get_table(MMsg.XT_MENU, new Object[]{"order by i_order desc"});
		MR.me().setAttr("LEFT", cdDatas);
        MB.me().getJspRender("/xitong/menu/left.jsp");
	}
	//显示右边内容列表
	public void index() {
		MRecord record=get_comm(3);
		record.set("parent_name",getParentName(record.getStr("mid")));
		String where="";
		if(!MCheck.isNull(record.get("mid"))){
			where=MCnt.me().and("pid", MEnum.EQ, record.get("mid")).toStr();
		}
		MComm.me().m_list(MMsg.XT_MENU,record,where,new Object[]{"order by i_order desc"});
	}
	public void add() {
		MRecord record=get_comm(3);
		record.set("parent_name", getParentName(record.getStr("mid")));
		MComm.me().m_add(record);
	}
	
	public void save() {
		//输出值
		MRecord out_datas=get_comm(3);
		out_datas.set("parent_name", getParentName(out_datas.getStr("mid")));
		//录入值
		MRecord in_datas=MR.me().getPara();
		in_datas.set("title", in_datas.getStr("name"));
		
		//插入返回当前ID
		int reId=M.me().insert_reid(MMsg.XT_MENU,in_datas);
		
		//更新值
		MRecord up_datas=new MRecord().set("op_url", reType(reId, out_datas.getStr("mid")));
		String where=MCnt.me().first("id", MEnum.EQ, reId).toStr();
		M.me().update(MMsg.XT_MENU, up_datas,where );
		
		//跳转
		MR.me().setAttr(Msg.MESSAGE, Msg.INSERT_SUCCESS);
		MComm.me().m_add(out_datas);
	}


	public void edit() {
		MRecord out_datas=get_comm(4);
		out_datas.set("parent_name", getParentName(out_datas.getStr("mid")));
		MComm.me().m_edit(MMsg.XT_MENU,"edit",out_datas,3);
	}
	
	public void update() {
		MRecord out_datas=get_comm(3);
		int id=MR.me().getParaToInt("id");
		MRecord in_datas=MR.me().getPara();
		
		//级联更新
		String sql=" UPDATE xt_cdb SET root_show ='"+in_datas.getStr("root_show")+"' WHERE pid='"+id+"'";
		M.me().execute(sql);
		
		//更新节点
		M.me().update(MMsg.XT_MENU, new MRecord().set("op_url",reType(id, out_datas.getStr("mid"))), MCnt.me().first("id", MEnum.EQ, id).toStr());
		
		String url="xitong/menu/index/"+out_datas.getStr("mid")+"/"+out_datas.getStr("pid")+"/"+out_datas.getStr("root_id");
		MComm.me().m_update(MMsg.XT_MENU,url,in_datas,true);
	}
	
	public void delete() {
		MRecord out_datas=get_comm(4);
		String url="xitong/menu/index/"+out_datas.getStr("mid")+"/"+out_datas.getStr("pid")+"/"+out_datas.getStr("root_id");
		MComm.me().m_del(MMsg.XT_MENU,url,3);
	}
	private MRecord get_comm(Integer seg){
		MRecord record=new MRecord();
		record.set("mid", MURI.me().seg_str(seg));
		record.set("pid", MURI.me().seg_str(seg+1));
		record.set("root_id",MURI.me().seg_str(seg+2));
		return record;
	}
	
	private Object getParentName(String id){
		if(!MCheck.isNull(id)){
			MRecord record=M.me().one_t(MMsg.XT_MENU, MCnt.me().and("id", MEnum.EQ, id).toStr());
			return MCheck.isNull(record)?"根菜单":record.get("name");
		}
		return "根菜单";
	}
	
	//判断是叶子还是节点
	private String reType(int id,String pid) {
		String is_type=MR.me().getPara("is_type");
		String op_url="xitong/menu/edit/"+id+"/"+pid; //操作类型：是节点,则说下它下面还有数据,返回一个列表,叶子就跳到它的修改页面
		if("节点".equals(is_type)){
			op_url="xitong/menu/index/"+id+"/"+pid;
		}
		return op_url;
	}
}
