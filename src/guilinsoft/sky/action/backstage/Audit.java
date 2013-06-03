
package guilinsoft.sky.action.backstage;

import guilinsoft.sky.utils.MMsg;

import com.jzero.comm.MComm;
import com.jzero.comm.MCommHelp;
import com.jzero.core.MR;
import com.jzero.core.MURI;
import com.jzero.db.cache.MCache;
import com.jzero.db.core.M;
import com.jzero.render.MB;
import com.jzero.util.MCheck;
import com.jzero.util.MCnt;
import com.jzero.util.MRecord;
import com.jzero.util.MTool;
import com.jzero.util.Msg;

/** 
 * 审核信息
 * wangujqw@gmail.com
 */
public class Audit {

	public void index(){
		String tp=MTool.decode(MURI.me().seg_str(3));
		tp=MCheck.isNull(tp)?"ALL":tp;
		MRecord out=new MRecord().set("tp", tp);
		MComm.me().m_list_sql(get_sql(tp), out);
	}
	private String get_sql(String types){
		String SQL="SELECT * FROM ("+
				"SELECT id,title,concat('网站数据-',parent_name) AS tp,'content' as types,pubdate,publisher,'wz_content' tb FROM "+MMsg.WZ_CONTENT+" WHERE is_audit=0"+
				"  UNION ALL  "+
				"  SELECT id,title,'首页图片' AS tp,'homephoto' as types,pubdate,publisher,'wz_homephoto' tb FROM "+MMsg.WZ_HOME_PHOTO+" WHERE is_audit=0"+
				"  UNION ALL "+
				"  SELECT id,title,concat('分类广告-',parent_name) as tp,'ad' as types,pubdate,publisher,'wz_advertising' tb from "+MMsg.WZ_ADVERTISING+" where is_audit=0"+
			"  )a  ";
		if(!types.equals("ALL")){
			SQL+="  WHERE types='"+types+"'  ";
		}
		Object [] obj=MCommHelp.getOrderBy(4);
		if(!MCheck.isNull(obj)){
			SQL+=obj[0];
		}
		return SQL;
	}
	//单条审核
	public void audit(){
		String id=MURI.me().seg_str(3);//表ID
		String tb=MURI.me().seg_str(4);//表名
		String types=MURI.me().seg_str(5);
		String shzt=MTool.decode(MURI.me().seg_str(7));//同意,不同意
		
		MRecord in=new MRecord().set("is_audit", shzt.equals("同意")?1:2);
		String where=MCnt.me().first_eq("id",id).toStr();
		int result=M.me().update(tb, in, where);
		
		String msg=result>0?Msg.AUDIT_SUCCESS:Msg.AUDIT_ERROR;
		
		String toURI="backstage/audit/index";
		toURI=MCheck.isNull(types)?toURI:toURI+"/"+types;
		MCommHelp.outHTML(toURI, msg);
	}
	//多条审核
	public void batch(){
		String shzt=MTool.decode(MURI.me().seg_str(6));//同意,不同意
		
		MRecord in=new MRecord().set("is_audit", shzt.equals("同意")?1:2);
		String[] ids=MR.me().getParaValues("select[]");
		String[] tbs=MR.me().getParaValues("tb[]");
		String where=null;
		if(!MCheck.isNull(ids)){
			for(int i=0;i<ids.length;i++){
				where=MCnt.me().first_eq("id", ids[i]).toStr();
				M.me().update(tbs[i], in, where);
			}
		}
		MCache.me().deleta_all_cache();
		MCommHelp.outHTML("backstage/audit",Msg.BATCH_AUDIT_SUCCESS);
	}
	
	public void view(){
		String id=MURI.me().seg_str(3);//ID
		String tb=MURI.me().seg_str(4);//表名
		String where=MCnt.me().and_eq("id",id).toStr();
		MR.me().setAttr(Msg.OBJECT, M.me().one_t(tb, where));
		String toURI="";
		if(tb.equalsIgnoreCase(MMsg.WZ_HOME_PHOTO)){
			toURI="/backstage/homephoto/view.jsp";
		}else if(tb.equalsIgnoreCase(MMsg.WZ_CONTENT)){
			//------------子表的图片
			where=MCnt.me().first_eq("pid", id).toStr();
			MRecord out=new MRecord().set("mxlst", M.me().get_where(MMsg.WZ_CONTENT_MX, where));
			MR.me().setAttr(Msg.OUT_DATAS, out);
			//------------子表的图片
			toURI="/backstage/content/view.jsp";
		}
		MB.me().getJspRender(toURI);	
	}
}
