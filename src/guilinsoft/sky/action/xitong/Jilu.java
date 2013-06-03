
package guilinsoft.sky.action.xitong;

import guilinsoft.sky.utils.MMsg;

import com.jzero.comm.MComm;
import com.jzero.comm.MCommHelp;
import com.jzero.core.MR;
import com.jzero.db.core.M;
import com.jzero.util.MCnt;
import com.jzero.util.Msg;

/** 
 * 2012-10-21: 操作日志系统启示录信息
 * wangujqw@gmail.com
 */
public class Jilu {

	public void index(){
		MComm.me().m_list(MMsg.XT_JLB,new Object[]{"order by time desc"});
	}
	public void find(){
		MComm.me().m_find_t(MMsg.XT_JLB,"time",new Object[]{"order by time desc"});
	}

	public void delete(){
		String begin=MR.me().getPara("start");
		String end=MR.me().getPara("end");
		String where=MCnt.me().between("time", begin, end).toStr();
		M.me().delete(MMsg.XT_JLB, where);
		MCommHelp.outHTML("xitong/jilu/index", Msg.DELETE_SUCCESS);
	}
}
