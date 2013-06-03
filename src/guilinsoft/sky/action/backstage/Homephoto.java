package guilinsoft.sky.action.backstage;

import guilinsoft.sky.utils.MMsg;

import com.jzero.comm.MComm;
import com.jzero.core.MR;
import com.jzero.util.MRecord;
import com.jzero.util.MSession;
/**
 * 首页图片
 * wangujqw@gmail.com  
 */
public class Homephoto {
	public void index() {
		MComm.me().m_list(MMsg.WZ_HOME_PHOTO, new Object[]{"order by pubdate desc"});
	}
	public void add() {
		MComm.me().m_add();
	}

	public void save() {
		MRecord in=MR.me().getPara();
		in.set("publisher", MSession.getName());
		MComm.me().m_save(MMsg.WZ_HOME_PHOTO,in);
	}

	public void edit() {
		MComm.me().m_edit(MMsg.WZ_HOME_PHOTO,3);
	}

	public void update() {
		MComm.me().m_update_list(MMsg.WZ_HOME_PHOTO);
	}

	public void del() {
		MComm.me().m_del(MMsg.WZ_HOME_PHOTO,3);
	}

	public void batch() {
		MComm.me().m_batch_del(MMsg.WZ_HOME_PHOTO);
	}

	public void view() {
		MComm.me().m_view(MMsg.WZ_HOME_PHOTO,3);
	}

}
