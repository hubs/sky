package guilinsoft.sky.server;

import guilinsoft.sky.utils.MMsg;
import io.netty.channel.ChannelHandlerContext;
import io.netty.channel.ChannelInboundMessageHandlerAdapter;

import java.util.List;

import com.jzero.db.core.M;
import com.jzero.util.MCheck;
import com.jzero.util.MCnt;
import com.jzero.util.MDate;
import com.jzero.util.MEnum;
import com.jzero.util.MPrint;
import com.jzero.util.MRecord;
import com.jzero.util.MTool;

public class MRecordServerHandler extends ChannelInboundMessageHandlerAdapter<MRecord> {
	/**
	 * 1、判断是同步全部信息还是只更新指定时间后面的信息
	 * 2、更新终端表的登录状态(IP,时间)
	 * 3、读取数据进行发送
	 */
	@Override
	protected void messageReceived(ChannelHandlerContext ctx, MRecord msg) throws Exception {
		
		//先判断当前设备号是否存在,如果不存在,则返回错误信息
		String serno=msg.getStr(MMsg.SERNO);
		boolean isExist=checkisExistSerno(serno);
		MRecord send_datas=null;
		if(isExist){//存在
			String head=msg.get(MMsg.COMMEND);
			MPrint.print("接收到客户端信息:"+head);
			if(head.equals(MMsg.READ_ALL)){//更新全部
				send_datas=readAll();
			}else{
				String begin_time=msg.getStr(MMsg.UPDATETIME);//返回年月日
				boolean read_category=msg.getBoolean(MMsg.CATEGORY);//是否需要同步目录表
				boolean read_contact=msg.getBoolean(MMsg.CONTACT);//是否读取联系我们
				boolean read_notice	=msg.getBoolean(MMsg.NOTICE);//是否读取公告信息
				
				send_datas=read(begin_time,read_category,read_contact,read_notice);
			}
			//更新终端表
			update_terminal(serno,ctx.channel().remoteAddress().toString());
		}else{//不存在
			send_datas=new MRecord().set(MMsg.COMMEND, "NO").set("MSG", "serno is not exist");
		}
		ctx.write(send_datas);
		
	}
	/**
	 *判断当前终端是否存在 
	 */
	private boolean checkisExistSerno(String serno) {
		return M.me().check(MMsg.XT_TERMINAL, MCnt.me().and_eq("zdbh", serno).toStr());
	}
	
	/**
	 * 更新终端状态
	 * 传过来的ip格式为/192.168.1.119:2767
	 */
	private void update_terminal(String serno,String ipStr) {
		String ip=null,port=null;
		if(!MCheck.isNull(ipStr)){
			String ipAddr[]=ipStr.split(":");
			if(ipAddr.length>0){
				ip=ipAddr[0].substring(1);
				port=ipAddr[1];
			}
		}
		ip=MCheck.isNull(ip)?ipStr:ip;
		MRecord inDatas=new MRecord().set("logintime", MDate.get_ymd_hms()).set("ip", ip).set("port", port);
		String where=MCnt.me().first_eq("zdbh",serno).toStr();
		M.me().update(MMsg.XT_TERMINAL, inDatas, where);
	}
	/**
	 * 只读取指定时间以后的数据
	 * 1、wz_advertising:广告表
	 * 2、wz_content:网站数据内容表
	 * 3、wz_content_mx:存表图片明细表
	 * 4、xt_category:目录表(这个表每次更新)
	 * @param readCategory 
	 * @param readNotice 
	 * @param readContact 
	 * @return
	 */
	private MRecord read(String ymd, boolean readCategory, boolean readContact, boolean readNotice) {
		String where=MCnt.me().first("endtime", MEnum.GT_E, MDate.get_ymd()).and_eq("is_audit", 1).and("pubdate", MEnum.GT_E, ymd).toStr();
		//1、读取所有未过期且在ymd之后的的广告信息表
		List<MRecord> advertisingLst=M.me().get_where(MMsg.WZ_ADVERTISING, where);
		
		//2、读取网站数据内容表且在ymd之后的
		List<MRecord> contentLst=M.me().get_where(MMsg.WZ_CONTENT, where);
		
		//3、读取网站图片明细表
		String sql="SELECT * FROM "+MMsg.WZ_CONTENT_MX+" WHERE pid IN (SELECT id FROM "+MMsg.WZ_CONTENT+" WHERE endtime> "+MDate.get_ymd()+" AND is_audit=1 AND pubdate>='"+ymd+"' )";
		List<MRecord> contentMxLst=M.me().sql(sql);
		
		//4、读取目录表
		List<MRecord> categoryLst=null;
		if(readCategory){
			categoryLst=M.me().get_table(MMsg.XT_CATEGORY);
		}
		//5、读取联系我们
		String contact=null;
		if(readContact){
			contact= MTool.read(MMsg.TXT_CONTACT);
		}
		
		//6、读取公告信息
		String notice=null;
		if(readNotice){
			notice=MTool.read(MMsg.TXT_NOTICE);
		}
		MRecord mRecord=new MRecord().set(MMsg.COMMEND, "OK").set(LST.ADVERTISING.name(), advertisingLst).set(LST.CONTENT.name(), contentLst).set(LST.CONTENTMX.name(), contentMxLst).set(LST.CATEGORY.name(), categoryLst).set(MMsg.CONTACT, contact).set(MMsg.NOTICE,notice);
		return mRecord;
	}
	/**
	 * 终端拥有
	 * 	1、wz_advertising:广告表
	 *  2、wz_content:网站数据内容表
	 *  3、wz_content_mx:存表图片明细表
	 *  4、xt_category:目录表
	 */
	private MRecord readAll() {
		String where=MCnt.me().first("endtime", MEnum.GT_E, MDate.get_ymd()).and_eq("is_audit", 1).toStr();
		//1、读取所有未过期的广告信息表
		List<MRecord> advertisingLst=M.me().get_where(MMsg.WZ_ADVERTISING, where);
		
		//2、读取网站数据内容表
		List<MRecord> contentLst=M.me().get_where(MMsg.WZ_CONTENT, where);
		
		//3、读取网站图片明细表
		String sql="SELECT * FROM "+MMsg.WZ_CONTENT_MX+" WHERE pid IN (SELECT id FROM "+MMsg.WZ_CONTENT+" WHERE endtime>= '"+MDate.get_ymd()+"' AND is_audit=1 )";
		List<MRecord> contentMxLst=M.me().sql(sql);
		
		//4、读取目录表
		List<MRecord> categoryLst=M.me().get_table(MMsg.XT_CATEGORY);
		
		//5、读取联系我们
		String contact= MTool.read(MMsg.TXT_CONTACT);
		
		//6、读取公告信息
		String notice=MTool.read(MMsg.TXT_NOTICE);
		
		MRecord mRecord=new MRecord().set(MMsg.COMMEND, "OK").set(LST.ADVERTISING.name(), advertisingLst).set(LST.CONTENT.name(), contentLst).set(LST.CONTENTMX.name(), contentMxLst).set(LST.CATEGORY.name(), categoryLst).set(MMsg.CONTACT, contact).set(MMsg.NOTICE,notice);
		return mRecord;
	}

	@Override
	public void exceptionCaught(ChannelHandlerContext ctx, Throwable cause)
			throws Exception {
		MRecord send_datas=new MRecord().set("COMMEND", "NO").set("MSG", "serno is not exist");
		ctx.write(send_datas);
		MPrint.print("Server Hander error"+cause.getLocalizedMessage());
		ctx.close();
	}


}
