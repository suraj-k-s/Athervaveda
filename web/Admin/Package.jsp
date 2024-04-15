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
       
        if (request.getParameter("del") != null) {
            String delQry = "delete from tbl_package where package_id='" + request.getParameter("del") + "'";
            con.executeCommand(delQry);
            response.sendRedirect("Package.jsp");
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
                                                    <h3 class="mb-0" >Table Package</h3>
                                                </div>
                                            </div>
                                            <form method="post" action="../Assets/ActionPages/PackageUploadAction.jsp" enctype="multipart/form-data">
                                                <div class="form-group">
                                                    <label for="sel_type">Select Type</label>
                                                    <select required="" class="form-control" name="sel_type" id="sel_type">
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
                                                </div>
                                                <div class="form-group">
                                                    <label>Title</label>
                                                    <input required="" type="text" class="form-control" id="txt_title" name="txt_title">
                                                </div>
                                                <div class="form-group">
                                                    <label>Details</label>
                                                    <textarea required="" class="form-control" id="txt_details" name="txt_details"></textarea>
                                                </div>
                                                <div class="form-group">
                                                    <label>Amount</label>
                                                    <input required="" type="text" class="form-control" id="txt_amount" name="txt_amount">
                                                </div>
                                                <div class="form-group">
                                                    <label>Photo</label>
                                                    <input required="" type="file" class="form-control" id="file_photo" name="file_photo">
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
                                                <td align="center" scope="col">Title</td>
                                                <td align="center" scope="col">Action</td>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%                                                int i = 0;
                                                String selQry = "select * from tbl_package";
                                                ResultSet rs = con.selectCommand(selQry);
                                                while (rs.next()) {

                                                    i++;
                                            %>
                                            <tr>    
                                                <td align="center"><%=i%></td>
                                                <td align="center"><%=rs.getString("package_title")%></td>
                                                <td align="center"> 
                                                    <a href="Package.jsp?del=<%=rs.getString("package_id")%>" class="status_btn">Delete</a> 
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
