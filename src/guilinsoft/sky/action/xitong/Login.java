package guilinsoft.sky.action.xitong;

import guilinsoft.sky.action.backstage.Poll;
import guilinsoft.sky.server.MRecordServer;
import guilinsoft.sky.utils.MMsg;

import com.jzero.aop.Uncheck;
import com.jzero.core.MR;
import com.jzero.db.core.M;
import com.jzero.render.MB;
import com.jzero.util.MCheck;
import com.jzero.util.MCnt;
import com.jzero.util.MDate;
import com.jzero.util.MEnum;
import com.jzero.util.MMD5;
import com.jzero.util.MRecord;
import com.jzero.util.MSession;
import com.jzero.util.MTool;
import com.jzero.util.Msg;

/**
 * 2012-10-15: 登录操作 wangujqw@gmail.com
 */
@Uncheck
public class Login {
	private static boolean bool_server_start=false;

	public void index() {
		MB.me().getJspRender("login.jsp");
	}

	public void login() {
		boolean verify = randVerify();
		if (verify) {
			String name = MR.me().getPara("username");
			String pass = MR.me().getPara("userpass");
			if (MCheck.isNull(name) || MCheck.isNull(pass)) {
				MB.me().getJspRender("login.jsp");
				return;
			}
			String where = MCnt.me().and("xm", MEnum.EQ, name).and("mm",
					MEnum.EQ, MMD5.StrToMD5(pass)).toStr();
			MRecord user = M.me().one_t_n(MMsg.XT_USER, where);
			if (!MCheck.isNull(user)) {
				MSession.save(user);
				login_info();
				if(!bool_server_start){
					ServerListen server=new ServerListen();
					server.start();
					PollListen	poll=new PollListen();
					poll.start();
					bool_server_start=true;
				}
				menu();
			} else {
				MR.me().setAttr(Msg.MESSAGE, Msg.USER_PASS_ERROR);
				MB.me().getJspRender("login.jsp");
				return;
			}
		}else{
			MB.me().getJspRender("login.jsp");
		}
	}
	//开启服务监听
	class ServerListen extends Thread {
		@Override
		public void run() {
			MRecordServer.me().start();//开启服务监听
		}
	}
	//开启定时轮训
	class PollListen extends Thread {
		@Override
		public void run() {
			Poll.me().start();	//定时轮训
		}
	}
	private boolean randVerify() {
		boolean verify=true;
		String rand=MR.me().getSessionAttr("rand");
		String input=MR.me().getPara("rand");
		if(MCheck.isNull(rand)||MCheck.isNull(input)){
			MR.me().setAttr(Msg.MESSAGE, Msg.AUTH_NULL);
			verify=false;
		}
		if(!MCheck.isNull(rand)&&!rand.equals(input)){//不相等时
			MR.me().setAttr(Msg.MESSAGE, Msg.AUTH_ERROR);
			verify=false;
		}
		return verify;
	}
	private void login_info() {
		MRecord in = new MRecord();
		in.set("time", MDate.get_ymd_hms()).set("username", MSession.getName())
				.set("loginIp", MTool.getIp()).set("event", "登录");
		M.me().insert(MMsg.XT_JLB, in);
	}

	private void logout_info() {
		MRecord in = new MRecord();
		in.set("time", MDate.get_ymd_hms()).set("username", MSession.getName())
				.set("loginIp", MTool.getIp()).set("event", "退出");
		M.me().insert(MMsg.XT_JLB, in);
	}

	private void menu() {
		String cdid = null;
		MRecord record = M.me()
				.one_t_n(
						MMsg.XT_QXB,
						MCnt.me().and("dm", MEnum.EQ, MSession.get().get("bh"))
								.toStr());
		if (MCheck.isNull(record)) {
			record = M.me().one_t(
					MMsg.XT_QXB,
					MCnt.me().and("dm", MEnum.EQ, MSession.get().get("yhzdm"))
							.toStr());
			cdid = MCheck.isNull(record) ? "0" : record.getStr("cdid");
		} else {
			cdid = record.getStr("cdid");
		}
		cdid = cdid.replace("-", ",");// 由于在解析json时,不能识别多,,分隔的cdid,所以当前改成-分隔,因此需要在此进行转换　2012-11-3
		String first_sql = "SELECT id ,name FROM xt_cdb WHERE pid=0 AND root_id!=0 AND  FIND_IN_SET(id,'"
				+ cdid + "') ORDER BY i_order DESC";
		String second_sql = "SELECT id,url,name,title,pid FROM xt_cdb WHERE pid!=0 AND FIND_IN_SET(id,'"
				+ cdid + "') AND root_show!=0 ORDER BY i_order";
//		String three_sql = "SELECT id,url,name,title,pid FROM xt_cdb WHERE pid!=0 AND FIND_IN_SET(id,'"
//				+ cdid + "') AND root_show!=0 ORDER BY i_order";

		MRecord out = new MRecord();
		out.set("first", M.me().sql(first_sql)).set("second",
				M.me().sql(second_sql));//.set("three", M.me().sql(three_sql))
		String where = MCnt.me().and("yhzdm", MEnum.EQ, MMsg.SYS).and("bh",
				MEnum.EQ, MSession.get().get("bh")).toStr();
		out.set("bool_sys", M.me().check(MMsg.XT_USER, where));

		MR.me().setSessionAttr(Msg.OBJECT, out);
		MB.me().getJspRender("/xitong/main/index.jsp");
	}

	public void logout() {
		logout_info();
		MSession.clear();
		MR.me().redirect("xitong/login/index");
	}

}
