<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%
String rollNo=request.getParameter("rollNo");
String s1=request.getParameter("s1");
String s2=request.getParameter("s2");
String s3=request.getParameter("s3");
String s4=request.getParameter("s4");
String s5=request.getParameter("s5");
String s6=request.getParameter("s6");
String s7=request.getParameter("s7");

try{
	Connection con =ConnectionProvider.getCon();
	Statement st=con.createStatement();
	st.executeUpdate("UPDATE result SET s1='"+s1+"', s2='"+s2+"', s3='"+s3+"', s4='"+s4+"', s5='"+s5+"', s6='"+s6+"', s7='"+s7+"' WHERE rollNo='"+rollNo+"'");
	response.sendRedirect("adminHome.jsp");
}
catch(Exception e)
{
	out.println(e);}
%>