
package guilinsoft.sky.action.xitong;

import guilinsoft.sky.utils.MMsg;

import java.io.File;

import com.jzero.comm.MComm;
import com.jzero.comm.MCommHelp;
import com.jzero.core.MURI;
import com.jzero.db.back.MBackup;
import com.jzero.db.back.MysqlBack;
import com.jzero.db.core.M;
import com.jzero.upload.MUpload;
import com.jzero.util.MCnt;
import com.jzero.util.MEnum;
import com.jzero.util.MRecord;
import com.jzero.util.MTool;
import com.jzero.util.Msg;

/** 
 * 2012-10-24: 备份
 * wangujqw@gmail.com
 */
public class Beifen {

	public void index(){
		MComm.me().m_list(MMsg.XT_BFB);
	}
	public void add(){
		MBackup backup=new MysqlBack();
		MRecord record=backup.backup().set("path", "back");
		MComm.me().m_save_list(MMsg.XT_BFB,record);
	}
	public void view(){
		String filename=MURI.me().seg_str(3)+".sql";
		String filePath=MTool.back_path()+filename;
		try {
			MUpload.me().download(filename, filePath);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void del(){
		String filename=MURI.me().seg_str(3)+".sql";
		String where=MCnt.me().first("name", MEnum.EQ, filename).toStr();
		M.me().delete(MMsg.XT_BFB, where);
		String filePath=MTool.back_path()+filename;
		File file=new File(filePath);
		file.delete();
		MCommHelp.outHTML("xitong/beifen/index", Msg.DELETE_SUCCESS);
	}
}
