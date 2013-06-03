package guilinsoft.sky.action.backstage;

import guilinsoft.sky.utils.MMsg;

import java.net.InetAddress;
import java.net.InetSocketAddress;
import java.net.Socket;
import java.util.List;
import java.util.TimerTask;

import com.jzero.db.core.M;
import com.jzero.log.Log;
import com.jzero.util.MCheck;
import com.jzero.util.MCnt;
import com.jzero.util.MPrint;
import com.jzero.util.MPro;
import com.jzero.util.MRecord;

/**
 *2013-3-20:轮询判断是否在线 
 */
public class Poll {
	private static Poll poll=new Poll();
	private Poll(){}
	public static Poll me(){
		return poll;
	}
	/**
	 * 只取一次
	 */
	public void index(){
		List<MRecord> lst=M.me().get_table(MMsg.XT_TERMINAL);
		if(!MCheck.isNull(lst)){
			for(MRecord row:lst){
				boolean isReach=isReachable(row.getStr("ip"), null, 5000);//2秒钟?
				int online=isReach?1:0;
				M.me().update(MMsg.XT_TERMINAL, new MRecord().set("online", online), MCnt.me().first_eq("ip", row.getStr("ip")).toStr());
			}
		}
	}
	/**
	 * 指定时间论询一次
	 */
	public void start(){
		MPrint.print("已开记轮训.");
//		Timer timer = new HashedWheelTimer();
//		timer.newTimeout(new TimerTask() {
//			public void run(Timeout timeout) throws Exception {
//				index();
//			}
//		}, MPro.me().getInt("wait_time"), TimeUnit.MINUTES);
		Long wait_time=MPro.me().getInt("wait_time")*1000*60L;
		java.util.Timer timer=new java.util.Timer();
		timer.scheduleAtFixedRate(new TimerTask() {
			@Override
			public void run() {
				index();
			}
		}, 0,wait_time);
	}
	 private static boolean isReachable(String ip, String port, int timeout) {
	        boolean reachable = false;
	        // 如果端口为空，使用 isReachable 检测，非空使用 socket 检测
	        if(port == null) {
	            try {
	                InetAddress address = InetAddress.getByName(ip);
	                reachable = address.isReachable(timeout);//timeout毫秒
	            } catch (Exception e) {
	            	Log.me().write(e.getMessage());
	                reachable = false;
	            }
	        } else {
	            Socket socket = new Socket();
	            try {
	                socket.connect(new InetSocketAddress(ip, Integer.parseInt(port)), timeout);
	                reachable = true;
	            } catch (Exception e) {
	            	Log.me().write(e.getMessage());
	                reachable = false;
	            } finally {
	                try {
	                    if(socket != null) socket.close();
	                }catch (Exception e) {}
	            }
	        }
	        return reachable;
	    }
}
