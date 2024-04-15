<%-- 
    Document   : Place
    Created on : May 5, 2021, 2:10:22 PM
    Author     : Pro-TECH
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Place</title>

        <%@include file="Header.jsp" %>
    </head>

    <%
        if (request.getParameter("btn_save") != null) {
            String insQry = "insert into tbl_trainer(trainer_name,trainer_email,trainer_password)"
                    + "values('" + request.getParameter("txt_name") + "','" + request.getParameter("txt_email") + "','" + request.getParameter("txt_password") + "')";
            con.executeCommand(insQry);
            response.sendRedirect("Trainer.jsp");

        }
        if (request.getParameter("del") != null) {
            String delQry = "delete from tbl_trainer where trainer_id='" + request.getParameter("del") + "'";
            con.executeCommand(delQry);
            response.sendRedirect("Trainer.jsp");
        }
    %>
    <body>
        <section class="main_content dashboard_part">
            <div class="main_content_iner ">
                <div class="container-fluid p-0">
                    <div class="row justify-content-center">
                        <div class="col-12">
                            <div class="QA_section">
                                <div class="white_box_tittle list_header">
                                    <div class="col-lg-12">
                                        <div class="white_box mb_30">
                                            <div class="box_header ">
                                                <div class="main-title">
                                                    <h3 class="mb-0" >Table Trainer</h3>
                                                </div>
                                            </div>
                                            <form>
                                                <div class="form-group">
                                                    <label>Name</label>
                                                    <input required="" type="text" class="form-control" id="txt_name" name="txt_name">
                                                </div>
                                                <div class="form-group">
                                                    <label>Email</label>
                                                    <input required="" type="text" class="form-control" id="txt_email" name="txt_email">
                                                </div>
                                                <div class="form-group">
                                                    <label>Password</label>
                                                    <input required="" type="text" class="form-control" id="txt_password" name="txt_password">
                                                </div>
                                                <div class="form-group" align="center">
                                                    <input type="submit" class="btn-dark" name="btn_save" style="width:100px; border-radius: 10px 5px " value="Save">
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                                <div class="QA_table mb_30">
                                    <table class="table lms_table_active">
                                        <thead>
                                            <tr style="background-color: #74CBF9">
                                                <td align="center" scope="col">Sl.No</td>
                                                <td align="center" scope="col">Name</td>
                                                <td align="center" scope="col">Action</td>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%                                                int i = 0;
                                                String selQry = "select * from tbl_trainer";
                                                ResultSet rs = con.selectCommand(selQry);
                                                while (rs.next()) {

                                                    i++;
                                            %>
                                            <tr>    
                                                <td align="center"><%=i%></td>
                                                <td align="center"><%=rs.getString("trainer_name")%></td>
                                                <td align="center"> 
                                                    <a href="Trainer.jsp?del=<%=rs.getString("trainer_id")%>" class="status_btn">Delete</a> 
                                                </td> 
                                            </tr>
                                            <%                      }


                                            %>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </body>
    <%@include file="Footer.jsp" %>
</html>
