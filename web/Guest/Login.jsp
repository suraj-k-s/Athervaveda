<%-- 
    Document   : Login
    Created on : 26 Feb, 2024, 11:58:11 AM
    Author     : rinub
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <%
        if (request.getParameter("btn_login") != null) {
            String email = request.getParameter("txt_email");
            String password = request.getParameter("txt_password");

            String selAdmin = "select * from tbl_admin where admin_email='" + email + "' and admin_password='" + password + "'";
            ResultSet rsAdmin = con.selectCommand(selAdmin);

            String selUser = "select * from tbl_user where user_email='" + email + "' and user_password='" + password + "'";
            ResultSet rsUser = con.selectCommand(selUser);
            
            String selDoctor = "select * from tbl_doctor where doctor_email='" + email + "' and doctor_password='" + password + "'";
            ResultSet rsDoctor = con.selectCommand(selDoctor);
            
            String selTrainer = "select * from tbl_trainer where trainer_email='" + email + "' and trainer_password='" + password + "'";
            ResultSet rsTrainer = con.selectCommand(selTrainer);

            if (rsAdmin.next()) {
                session.setAttribute("aid", rsAdmin.getString("admin_id"));
                session.setAttribute("aname", rsAdmin.getString("admin_name"));
                response.sendRedirect("../Admin/HomePage.jsp");

            } 
           else if (rsDoctor.next()) {
                session.setAttribute("did", rsDoctor.getString("doctor_id"));
                session.setAttribute("dname", rsDoctor.getString("doctor_name"));
                response.sendRedirect("../Doctor/HomePage.jsp");

            } else if (rsTrainer.next()) {
                session.setAttribute("tid", rsTrainer.getString("trainer_id"));
                session.setAttribute("tname", rsTrainer.getString("trainer_name"));
                response.sendRedirect("../Trainer/HomePage.jsp");

            } 
            else if (rsUser.next()) {
                session.setAttribute("uid", rsUser.getString("user_id"));
                session.setAttribute("uname", rsUser.getString("user_name"));
                response.sendRedirect("../User/HomePage.jsp");

            }else {
    %>
    <script>
        alert("Invalid Credentials");
        window.location = "Login.jsp";
    </script>
    <%
            }
        }
    %>
    <%@include file="Head.jsp" %>
    <body>
        <h2>Login</h2>
        <form name="frmLogin" method="post">
            <table border="1">
                <tr>
                    <td>Email</td>
                    <td><input type="email" name="txt_email" id="txt_email" autocomplete="off" required=""/></td>
                </tr>
                <tr>
                    <td>Password</td>
                    <td><input type="password" name="txt_password" id="txt_password" autocomplete="off" required=""/></td>

                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" name="btn_login" value="login"/>
                    </td>
                </tr>
            </table>
        </form>
    </body>
    <%@include file="Foot.jsp" %>
</html>
