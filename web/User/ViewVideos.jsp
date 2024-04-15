<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="Head.jsp" %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    </head>
    <body>

        <table  align="center">


            <tr>
                <%                    String seQry = "select * from tbl_video p inner join tbl_trainer st on st.trainer_id=p.trainer_id ";

                    int i = 0;

                    ResultSet rr = con.selectCommand(seQry);
                    while (rr.next()) {
                        i++;


                %>

                <td style="border: 1px solid black;padding: 10px" >

                    <table style="margin: 10px">
                        <tr>
                            <td>
                                <video width="320" height="240" controls>
                                    <source src="../Assets/Files/<%=rr.getString("video_file")%>" type="video/mp4">
                                    Your browser does not support the video tag.
                                </video>
                            </td>

                        </tr>
                        <tr>
                            <td align="center"><%=rr.getString("video_title")%></td>
                        </tr>
                        <tr>
                            <td align="center"><%=rr.getString("video_details")%></td>
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