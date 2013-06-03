
package guilinsoft.sky.action.xitong;

import guilinsoft.sky.utils.MMsg;

import com.jzero.comm.MComm;

/** 
 * 2012-10-29: 用户组
 * wangujqw@gmail.com
 */
public class Yhz {

	public void index(){
		MComm.me().m_list(MMsg.XT_YHZ);
	}
	public void add(){
		MComm.me().m_add();
	}
	public void save(){
		MComm.me().m_save(MMsg.XT_YHZ);
	}
	public void del(){
		MComm.me().m_del(MMsg.XT_YHZ,3);
	}
	public void edit(){
		MComm.me().m_edit(MMsg.XT_YHZ,3);
	}
	public void update(){
		MComm.me().m_update_list(MMsg.XT_YHZ);
	}
}
