package vo;

import java.sql.Connection;
import java.sql.DriverManager;
public class Databasecon {
	private static final String DBDRIVER = "org.gjt.mm.mysql.Driver";
	private static final String DBURL = "jdbc:mysql://localhost:3306/text?useUnicode=true&characterEncoding=utf8&serverTimezone=GMT%2B8&useSSL=false";
	private static final String DBUSER = "root";	//MySQL数据库的连接用户名
	private static final String DBPASS = "287396";
	private Connection conn=null;
	public Databasecon()throws Exception{
		try {
			Class.forName(DBDRIVER);
			this.conn=DriverManager.getConnection(DBURL, DBUSER, DBPASS);
		
			
		}catch(Exception e)
		{
			throw e;
		}
	}
	public Connection getConnection() {
			
			return this.conn;
		}
		public void close() throws Exception{
			
			if(this.conn!=null)
			{
				try{
				
				this.conn.close();
				
			}catch(Exception e)
			{throw e;
				
			}
		}
		
	}
}