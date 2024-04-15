<%-- 
    Document   : User
    Created on : 26 Feb, 2024, 11:57:53 AM
    Author     : rinub
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User</title>
    </head><%@include file="Head.jsp" %>
    <%
        if (request.getParameter("del") != null) {
            String delQry = "delete from tbl_tips where tips_id='" + request.getParameter("del") + "'";
            con.executeCommand(delQry);
            response.sendRedirect("Tips.jsp");
        }
    %>
    <body>
        <h2>Tips</h2>
        <form method="POST" action="../Assets/ActionPages/TipsUploadAction.jsp" enctype="multipart/form-data">
            <table border="1">
                <tr>
                    <td>Title</td>
                    <td><input type="text" name="txt_title"  autocomplete="off" required=""/></td>
                </tr>
                <tr>
                    <td>Details</td>
                    <td><textarea name="txt_details" ></textarea></td>
                </tr>
                <tr>
                    <td>Photo</td>
                    <td><input type="file" name="file_photo"  required=""/></td>
                </tr>
                <tr>
                    <td colspan="2" align="center"><input type="submit" name="btn_save" value="submit"/></td>
                </tr>
            </table>
        </form>
        <br><br><br>
        <table>
            <tr>
                <th>#</th>
                <th>Title</th>
                <th>Details</th>
                <th>Photo</th>
                <th>Action</th>
            </tr>
            <%
            int i=0;
            String selQry = "select * from tbl_tips where doctor_id='"+session.getAttribute("did")+"'";
            ResultSet rs = con.selectCommand(selQry);
            while(rs.next())
            {
                i++;
                %>
                <tr>
                    <td><%=i%></td>
                    <td><%=rs.getString("tips_title")%></td>
                    <td><%=rs.getString("tips_details")%></td>
                    <td><img src="../Assets/Files/<%=rs.getString("tips_photo")%>" width="120" height="120"/></td>
                    <td><a href="Tips.jsp?del=<%=rs.getString("tips_id")%>">Delete</a></td>
                </tr>
                <%
            }
            
            %>
        </table>
    </body>
    <%@include file="Foot.jsp" %>
</html>

