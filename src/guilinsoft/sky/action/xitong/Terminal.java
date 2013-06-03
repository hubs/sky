package guilinsoft.sky.action.xitong;

import guilinsoft.sky.utils.MMsg;

import com.jzero.comm.MComm;

/**
 *终端信息表
 */
public class Terminal {
	public void index() {
		MComm.me().m_list(MMsg.XT_TERMINAL, new Object[] { "order by logintime desc" });
	}

	public void find() {
		MComm.me().m_find(MMsg.XT_TERMINAL, new Object[] { "order by logintime desc" });
	}

	public void add() {
		MComm.me().m_add();
	}

	public void save() {
		MComm.me().m_save(MMsg.XT_TERMINAL);
	}

	public void edit() {
		MComm.me().m_edit(MMsg.XT_TERMINAL, 3);
	}

	public void update() {
		MComm.me().m_update_list(MMsg.XT_TERMINAL);
	}

	public void del() {
		MComm.me().m_del(MMsg.XT_TERMINAL, 3);
	}

	public void view() {
		MComm.me().m_view(MMsg.XT_TERMINAL, 3);
	}

	public void batch() {
		MComm.me().m_batch_del(MMsg.XT_TERMINAL);
	}
}
