<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body  >
<%
request.setCharacterEncoding("GBK");
%>

<form action="insert.jsp" method="post" name="myform" enctype="multipart/form-data">
雇员编号<input type="text" id="id1" name="empno" ><br><br>
雇员姓名<input type="text" id="id2" name="ename" ><br><br>
雇员工作<input type="text" id="id3" name="job" ><br><br>
雇员日期<input type="text" id="id4" name="hiredate" ><br><br>
基本工资<input type="text" id="id5" name="sal"  ><br><br>
照片<input type="file" id="id6" name="photo"  value=""><br><br>

<input type="reset" value="重置"  >
<input type="submit" value="注册" >
</body>
</html>