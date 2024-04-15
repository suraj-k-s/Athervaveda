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
                <%                    String seQry = "select * from tbl_tips p inner join tbl_doctor st on st.doctor_id=p.doctor_id ";

                    int i = 0;

                    ResultSet rr = con.selectCommand(seQry);
                    while (rr.next()) {
                        i++;


                %>

                <td style="border: 1px solid black;padding: 10px" >

                    <table style="margin: 10px">
                        <tr>
                            <td>
                                <img src="../Assets/Files/<%=rr.getString("tips_photo")%>" width="120" height="120"/>
                            </td>

                        </tr>
                        <tr>
                            <td align="center"><%=rr.getString("tips_title")%></td>
                        </tr>
                        <tr>
                            <td align="center"><%=rr.getString("tips_details")%></td>
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