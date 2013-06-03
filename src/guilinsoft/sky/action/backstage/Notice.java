
package guilinsoft.sky.action.backstage;

import guilinsoft.sky.utils.MMsg;

import com.jzero.comm.MComm;
import com.jzero.core.MR;
import com.jzero.util.MDate;
import com.jzero.util.MRecord;
import com.jzero.util.MSession;

/** 
 * 2012-11-15: 公告信息
 * wangujqw@gmail.com
 */
public class Notice {

	public void index(){
		MComm.me().m_list(MMsg.WZ_NOTICE, new Object[]{"order by inserttime desc"});
	}
	public void find(){
		MComm.me().m_find(MMsg.WZ_NOTICE, new Object[]{"order by inserttime desc"});
	}
	public void add(){
		MComm.me().m_add();
	}
	public void save(){
		MRecord in=MR.me().getPara();
		in.set("lrrq", MDate.get_ymd_hms()).set("lrry", MSession.getName());
		MComm.me().m_save(MMsg.WZ_NOTICE,in);
	}
	public void edit(){
		MComm.me().m_edit(MMsg.WZ_NOTICE,3);
	}
	public void update(){
		MComm.me().m_update(MMsg.WZ_NOTICE);
	}
	public void del(){
		MComm.me().m_del(MMsg.WZ_NOTICE,3);
	}
	public void view(){
		MComm.me().m_view(MMsg.WZ_NOTICE,3);
	}
	public void batch(){
		MComm.me().m_batch_del(MMsg.WZ_NOTICE);
	}
}
