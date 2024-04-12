<%@page import ="project.ConnectionProvider" %>
<%@page import ="java.sql.*" %>
<%
String course=request.getParameter("course");
String branch=request.getParameter("branch");
String rollno=request.getParameter("rollno");
String name=request.getParameter("name");
String fatherName=request.getParameter("fatherName");
String gender=request.getParameter("gender");

try {
    Connection con = ConnectionProvider.getCon();
    System.out.println(course);
    String query = "INSERT INTO student (course, branch, rollno, name, fatherName, gender) VALUES (?, ?, ?, ?, ?, ?)";
    PreparedStatement ps = con.prepareStatement(query);
    ps.setString(1, course);
    ps.setString(2, branch);
    ps.setString(3, rollno != null ? rollno : "");
    ps.setString(4, name);
    ps.setString(5, fatherName);
    ps.setString(6, gender);
    ps.executeUpdate();
    
    response.sendRedirect("adminHome.jsp");
} catch(SQLException e) {
	if (e.getMessage().contains("Duplicate entry")) {
        out.println("Duplicate entry for primary key. Please check your data.");
    } else {
        out.println(e);
    }
}

%>