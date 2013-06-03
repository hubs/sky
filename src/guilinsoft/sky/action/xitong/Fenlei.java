package guilinsoft.sky.action.xitong;

import guilinsoft.sky.utils.MMsg;
import guilinsoft.sky.utils.Tools;

import java.util.List;

import com.jzero.comm.MComm;
import com.jzero.comm.MCommHelp;
import com.jzero.core.MR;
import com.jzero.db.core.M;
import com.jzero.util.MCheck;
import com.jzero.util.MCnt;
import com.jzero.util.MRecord;
import com.jzero.util.Msg;

public class Fenlei {

	public void index(){
        MComm.me().m_list_no_page(MMsg.XT_CATEGORY,100, new Object[]{"order by path asc"});
	}
	public void add(){
		MRecord out_datas=new MRecord().set("category",getCatagory());
		MComm.me().m_add(out_datas);
	}
	private List<MRecord> getCatagory(){
		List<MRecord> lst=M.me().get_field("id dm,name mc,path ph", MMsg.XT_CATEGORY,new Object[]{"order by path asc"});
		for(MRecord row:lst){
			row.set("mc",Tools.repeat("&nbsp;&nbsp;&nbsp;&nbsp;", row.getStr("ph"))+"└"+row.getStr("mc"));
		}
		return lst;
	}
	
	public void save(){
		MRecord inData=MR.me().getPara();
		if(MCheck.isNull(inData)){
			MCommHelp.outHTML("xitong/fenlei/index","数据不能为空");
		}else{
		
			int reid=M.me().insert_reid(MMsg.XT_CATEGORY, inData);
			String parent_id=inData.get("parent_id");
			if(parent_id.equals("0")){
				inData.set("path", "-0-"+reid+"-").set("root_id", 0);
			}else{
				MRecord parObj=M.me().one_t(MMsg.XT_CATEGORY, MCnt.me().and_eq("id", parent_id).toStr());
				inData.set("path", parObj.getStr("path")+reid+"-").set("root_id", parObj.getStr("root_id"));
			}
			int result=M.me().update(MMsg.XT_CATEGORY, inData, MCnt.me().first_eq("id", reid).toStr());
			String msg=result>0?Msg.INSERT_SUCCESS:Msg.INSERT_ERROR;
			String path="xitong/fenlei/index";
			MCommHelp.outHTML(path,msg);
		}
	}
	public void update(){
		MRecord inData=MR.me().getPara();
		if(MCheck.isNull(inData)){
			MCommHelp.outHTML("xitong/fenlei/index","数据不能为空");
		}else{
			String reId=inData.getStr("id");
			String parent_id=inData.get("parent_id");
			if(parent_id.equals("0")){
				inData.set("path", "-0-"+reId+"-").set("root_id", 0);
			}else{
				MRecord parObj=M.me().one_t(MMsg.XT_CATEGORY, MCnt.me().and_eq("id", parent_id).toStr());
				inData.set("path", parObj.getStr("path")+reId+"-").set("root_id", parObj.getStr("root_id"));
			}
			
			int result=M.me().update(MMsg.XT_CATEGORY, inData, MCnt.me().first_eq("id", reId).toStr());
			String msg=result>0?Msg.MODIFY_SUCCESS:Msg.MODIFY_ERROR;
			String path="xitong/fenlei/index";
			MCommHelp.outHTML(path,msg);
		}
	}
	public void edit(){
		MRecord out_datas=new MRecord().set("category",getCatagory());
		MComm.me().m_edit(MMsg.XT_CATEGORY,out_datas,3);
	}
	public void del(){
		MComm.me().m_del(MMsg.XT_CATEGORY,3);
	}
}
