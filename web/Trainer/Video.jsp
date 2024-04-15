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
            String delQry = "delete from tbl_video where video_id='" + request.getParameter("del") + "'";
            con.executeCommand(delQry);
            response.sendRedirect("Video.jsp");
        }
    %>
    <body>
        <h2>Video</h2>
        <form method="POST" action="../Assets/ActionPages/VideoUploadAction.jsp" enctype="multipart/form-data">
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
                    <td>Type</td>
                    <td><select required=""  name="sel_type" id="sel_type">
                            <option value="" >Select</option>
                            <%
                                String disQry = "select * from tbl_servicetype";
                                ResultSet rs1 = con.selectCommand(disQry);
                                while (rs1.next()) {
                            %>
                            <option value="<%=rs1.getString("servicetype_id")%>" ><%=rs1.getString("servicetype_name")%></option>
                            <%
                                }

                            %>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Video</td>
                    <td><input type="file" id="videoFile" name="file_photo" accept="video/mp4, video/webm, video/ogg"></td>
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
            <%                int i = 0;
                String selQry = "select * from tbl_video where trainer_id='" + session.getAttribute("tid") + "'";
                ResultSet rs = con.selectCommand(selQry);
                while (rs.next()) {
                    i++;
            %>
            <tr>
                <td><%=i%></td>
                <td><%=rs.getString("video_title")%></td>
                <td><%=rs.getString("video_details")%></td>
                <td>
                    <video width="320" height="240" controls>
                        <source src="../Assets/Files/<%=rs.getString("video_file")%>" type="video/mp4">
                        Your browser does not support the video tag.
                    </video>
                </td>
                <td><a href="Video.jsp?del=<%=rs.getString("video_id")%>">Delete</a></td>
            </tr>
            <%
                }

            %>
        </table>
    </body>
    <%@include file="Foot.jsp" %>
</html>

