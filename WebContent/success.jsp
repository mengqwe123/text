<%@ page language="java" contentType="text/html; charset=GBK"  pageEncoding="GBK"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.jspsmart.upload.*" %>
<%@  page import="ip.IPTimeStamp"%>
<%@ page import="java.text.*"%> 
<%@ page import="java.io.*"%>
<%@ page import="java.io.File" %>
<%@ page import="java.nio.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>雇员显示</title>
</head>
<body>
<%!
public static final String DBDRIVER = "org.gjt.mm.mysql.Driver";
public static final String DBURL = "jdbc:mysql://localhost:3306/text?useUnicode=true&characterEncoding=utf8&serverTimezone=GMT%2B8&useSSL=false";
public static final String DBUSER = "root";	//MySQL数据库的连接用户名
public static final String DBPASS = "287396";	//MySQL数据库的连接密码
String path;
String fileName;
String pp="";
%>

<%
SmartUpload smart=new SmartUpload();
smart.initialize(pageContext);
smart.upload();
String a=smart.getRequest().getParameter("empno");
String b=smart.getRequest().getParameter("ename");
String c=smart.getRequest().getParameter("job");
String d=smart.getRequest().getParameter("hiredate");
String f=smart.getRequest().getParameter("sal");
String g=smart.getFiles().getFile(0).getFileName();
if(g==null|| g.length() <= 0)
{
	fileName="0.jpg";
	path="F:"+File.separator+"workspace"+File.separator+"demo06"+File.separator+"WebContent"+File.separator+"upload";
}
else{
	fileName=smart.getFiles().getFile(0).getFileName();

	path="F:"+File.separator+"workspace"+File.separator+"demo06"+File.separator+"WebContent"+File.separator+"upload";
}

out.print("上传成功！！！");	
%>
<br><br>
<%

Connection conn = null;	//数据库连接
Statement st=null;
	ResultSet rs=null;  
        Class.forName(DBDRIVER).newInstance();//加载数据库驱动    
        conn = DriverManager.getConnection(DBURL, DBUSER, DBPASS);//连接    
        st = conn.createStatement(); 
        
        st.executeQuery("SET NAMES UTF8");
        pp=path+File.separator+fileName;

  		String sql="update  empp  set empno='"+a+"',ename='"+b+"',job='"+c+"',hiredate='"+d+"',sal='"+f+"',photo='"+fileName+"' WHERE empno='"+a+"' ";
  		
  		String query_sql = "select * from empp";
  		try { 
  			st.execute(sql); 
  			}catch(Exception e) { 
  			e.printStackTrace(); 
  			} 
  			try { 
	 rs = st.executeQuery(query_sql); 

  			}catch(Exception e) { 
  			e.printStackTrace(); 
  			} 
  			try{
  			rs.close(); 
  			st.close(); 
  			conn.close(); 
  			}catch (Exception e) { 
  			e.printStackTrace(); 
  			} 

%>	
<h2>修改后雇员信息：</h2><br><br>
照片:<br><br>
<img src="F:\workspace\demo06\WebContent\upload\<%=fileName%>"> 
<br><br>
照片路径<%=pp %><br><br>
雇员编号<%=a %><br><br>
雇员姓名<%=b %><br><br>
雇员工作<%=c %><br><br>
雇员日期<%=d %><br><br>
基本工资<%=f %><br><br>
</body>
</html>