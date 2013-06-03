
package guilinsoft.sky.action.backstage;

import guilinsoft.sky.utils.MMsg;

import com.jzero.comm.MCommHelp;
import com.jzero.core.MR;
import com.jzero.render.MB;
import com.jzero.util.MTool;
import com.jzero.util.Msg;

/** 
 * 这个类主要负责文件的操作
 * wangujqw@gmail.com
 */
public class Text {
	//联系我们
	public void index_contact(){
		MR.me().setAttr("content", MTool.read(MMsg.TXT_CONTACT));
		MB.me().getJspRender("/backstage/text/contact.jsp");
	}
	public void save_contact(){
		MTool.write(MMsg.TXT_CONTACT,MR.me().getPara("content"));
		MCommHelp.outHTML("backstage/text/index_contact", Msg.SAVE_SUCCESS);
	}
	
	//公告信息
	public void index_notice(){
		MR.me().setAttr("content", MTool.read(MMsg.TXT_NOTICE));
		MB.me().getJspRender("/backstage/text/notice.jsp");		
	}
	public void save_notice(){
		MTool.write(MMsg.TXT_NOTICE,MR.me().getPara("content"));
		MCommHelp.outHTML("backstage/text/index_notice", Msg.SAVE_SUCCESS);		
	}
	
}
