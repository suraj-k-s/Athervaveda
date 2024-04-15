<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="Head.jsp" %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%
            if (request.getParameter("id") != null) {

                String ins = "INSERT INTO `tbl_packagebooking` (`packagebooking_date`, `package_id`, `user_id`) VALUES (curdate(),'" + request.getParameter("id") + "','" + session.getAttribute("uid") + "')";
                if (con.executeCommand(ins)) {
        %>
        <script>
            alert("Request Sended");
            window.location = 'ViewPackages.jsp';
        </script>
        <%
                }
            }


        %>
    </head>
    <body>

        <table  align="center">


            <tr>
                <%                    String seQry = "select * from tbl_package p inner join tbl_servicetype st on st.servicetype_id=p.servicetype_id ";

                    int i = 0;

                    ResultSet rr = con.selectCommand(seQry);
                    while (rr.next()) {
                        i++;


                %>

                <td style="border: 1px solid black;padding: 10px" >

                    <table style="margin: 10px">
                        <tr>
                            <td><img src="../Assets/Files/<%=rr.getString("package_photo")%>" width="120" height="120" style="border-radius: 50%"></td>

                        </tr>
                        <tr>
                            <td align="center"><%=rr.getString("package_title")%></td>
                        </tr>
                        <tr>
                            <td align="center"><%=rr.getString("package_details")%></td>
                        </tr>
                        <tr>
                            <td align="center"><%=rr.getString("package_amount")%></td>
                        </tr>
                        <tr>

                            <td align="center">
                                <a href="ViewPackages.jsp?id=<%=rr.getString("package_id")%>">Send Request</a>
                            </td>
                        </tr>
                    </table>
                </td>
                <%
                        if (i == 3) {
                            i = 0;
                            out.println("</tr><tr>");
                        }

                    }
                %>

            </tr>
        </table>

    </body>
    <%@include file="Foot.jsp" %>


</html>