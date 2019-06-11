<%@ page language="java" contentType="text/html; charset=GBK"  pageEncoding="GBK"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.jspsmart.upload.*" %>
<%@  page import="ip.IPTimeStamp"%>
<%@ page import="java.text.*"%> 
<%@ page import="java.io.*"%>
<%@ page import="java.nio.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>¹ÍÔ±ÏÔÊ¾</title>
</head>
<body>
<%!
public static final String DBDRIVER = "org.gjt.mm.mysql.Driver";
public static final String DBURL = "jdbc:mysql://localhost:3306/text?useUnicode=true&characterEncoding=utf8&serverTimezone=GMT%2B8&useSSL=false";
public static final String DBUSER = "root";	//MySQLÊý¾Ý¿âµÄÁ¬½ÓÓÃ»§Ãû
public static final String DBPASS = "287396";	//MySQLÊý¾Ý¿âµÄÁ¬½ÓÃÜÂë
public static final String path="";
String nm="";
%>
<%
Connection conn=null;
PreparedStatement pstmt=null;
ResultSet rs=null;
int no=0;
String name=null;
String job=null;
String hiredate=null;
String sal=null;
String photo=null;
int uid=Integer.parseInt(request.getParameter("id"));
%>
<%=uid %><br><br>
<%
try{
	Class.forName(DBDRIVER);
	conn=DriverManager.getConnection(DBURL, DBUSER, DBPASS);
	String sql="SELECT * FROM EMPP WHERE empno='"+uid+"'";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();

%>
<%
while(rs.next()){
	no=rs.getInt(1);
	name=rs.getString(2);
	job=rs.getString(3);
	hiredate=rs.getString(4);
	sal=rs.getString(5);
	photo=rs.getString(6);
}

%>

<%
}catch(Exception e){
	System.out.print(e);
}finally{
	rs.close();
	pstmt.close();
	conn.close();
}
%>
<%

%>
<form action="success.jsp" method="post"  enctype="multipart/form-data">
    &nbsp;&nbsp;
   ¹ÍÔ±±àºÅ(²»¿ÉÐÞ¸Ä):<input  type="text"  name="empno" value=<%=uid %> ><br><br>
    &nbsp;&nbsp;
   ¹ÍÔ±ÐÕÃû£º<input type="text"  name="ename" value=<%=name %>><br><br>
    &nbsp;&nbsp;
    ¹ÍÔ±¹¤×÷£º<input  type="text"  name="job" value=<%=job %>><br><br>
        &nbsp;&nbsp;
        ¹ÍÔ±ÈÕÆÚ<input type="text"  name="hiredate" value=<%=hiredate %> ><br><br>
        &nbsp;&nbsp;
»ù±¾¹¤×Ê<input type="text" name="sal" value=<%=sal %> ><br><br>
    ¹ÍÔ±ÕÕÆ¬£º<input  type="file"  name="ufile"><br><br>
     &nbsp;&nbsp;
     ¹ÍÔ±ÕÕÆ¬£º 
     <img src="F:\workspaceworkspace\demo06\WebContent\upload\<%=photo%>"> 
     
<input type="submit" value="Ìá½»">


</form>
</body>
</html>