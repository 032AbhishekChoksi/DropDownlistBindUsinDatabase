<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="DropDownlistBindUsinDatabase.index" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>
  </title>
  <!-- plugins:css -->
  <!-- https://pictogrammers.github.io/@mdi/font/1.0.62/ -->
  <link rel="stylesheet" href="assets/css/materialdesignicons.min.css">
  <link rel="stylesheet" href="assets/css/vendor.bundle.base.css">
  <link rel="stylesheet" href="assets/css/dataTables.bootstrap4.css">
  <!-- endinject -->
  <!-- Plugin css for this page -->
  <link rel="stylesheet" href="assets/css/bootstrap-datepicker.min.css">
  <!-- End plugin css for this page -->
  <!-- inject:css -->
  <link rel="stylesheet" href="assets/css/style.css">
</head>
<body class="sidebar-light">
    <div class="container-scroller">
        <!-- partial:partials/_navbar.html -->
        <nav class="navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
            <div class="navbar-menu-wrapper d-flex align-items-stretch justify-content-between">
                <ul class="navbar-nav mr-lg-2 d-none d-lg-flex">
                    <li class="nav-item nav-toggler-item">
                        <button class="navbar-toggler align-self-center" type="button" data-toggle="minimize">
                            <span class="mdi mdi-menu"></span>
                        </button>
                    </li>

                </ul>
                <div class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-center">
                </div>
                <ul class="navbar-nav navbar-nav-right">

                    <li class="nav-item nav-profile dropdown">
                        <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown" id="profileDropdown">
                            <span class="nav-profile-name">Admin</span>
                        </a>
                        <div class="dropdown-menu dropdown-menu-right navbar-dropdown" aria-labelledby="profileDropdown">
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="logout.aspx">
                                <i class="mdi mdi-logout text-primary"></i>
                                Logout
                            </a>
                        </div>
                    </li>

                    <li class="nav-item nav-toggler-item-right d-lg-none">
                        <button class="navbar-toggler align-self-center" type="button" data-toggle="offcanvas">
                            <span class="mdi mdi-menu"></span>
                        </button>
                    </li>
                </ul>
            </div>
        </nav>
        <!-- partial -->
        <div class="container-fluid page-body-wrapper">
            <!-- partial:partials/_settings-panel.html -->
            <!-- partial -->
            <!-- partial:partials/_sidebar.html -->
            <nav class="sidebar sidebar-offcanvas" id="sidebar">
                <ul class="nav">
                    <li class="nav-item">
                        <a class="nav-link" href="index.aspx">
                            <i class="mdi mdi-view-quilt menu-icon"></i>
                            <span class="menu-title">Dashboard</span>
                        </a>
                    </li>
                </ul>
            </nav>
            <!-- partial -->
            <div class="main-panel">
                <div class="content-wrapper">
                    <div class="row">
                        <h1 class="grid_title ml10 ml15">Dish</h1>
                        <div class="col-12 grid-margin stretch-card">
                            <div class="card">
                                <div class="card-body">
                                    <form id="fo1" runat="server" class="forms-sample" method="post" enctype="multipart/form-data">
                                        <div class="form-group">
                                            <asp:Label ID="lblcategory" runat="server" Text="Category"></asp:Label>
                                            <asp:DropDownList ID="ddcategory_id" runat="server" class="form-control" name="category_id">
                                            </asp:DropDownList>
                                        </div>
                                        <div class="form-group">
                                            <asp:Label ID="lbldish" runat="server" Text="Dish"></asp:Label>
                                            <asp:TextBox ID="txtdish" runat="server" name="dish" class="form-control" placeholder="dish"></asp:TextBox>
                                            <div class="error mt8" id="errordishadded" runat="server" style="display: none">Dish already added</div>
                                        </div>
                                        <div class="form-group">
                                            <asp:Label ID="lbltype" runat="server" Text="Type"></asp:Label>
                                            <asp:DropDownList ID="ddtype" runat="server" class="form-control" name="type">
                                                <asp:ListItem Value="" Selected="True">Select Type</asp:ListItem>
                                                <asp:ListItem Value="veg">Veg</asp:ListItem>
                                                <asp:ListItem Value="non-veg">Non Veg</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                        <div class="form-group">
                                            <asp:Label ID="lbldishdetail" runat="server" Text="Dish Detail"></asp:Label>
                                            <asp:TextBox ID="txtdish_detail" runat="server" name="dish_detail" class="form-control" placeholder="Dish Detail" TextMode="MultiLine"></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                            <asp:Label ID="lbldishimage" runat="server" Text="Dish Image"></asp:Label>
                                            <asp:FileUpload ID="f1" accept="image/*"  runat="server" name="image" class="form-control" placeholder="Dish Image" />
                                            <asp:RegularExpressionValidator
                                                ID="FileUpLoadValidator" runat="server"
                                                ErrorMessage="Upload jpeg, jpe and png only."
                                                ValidationExpression="^(([a-zA-Z]:)|(\\{2}\w+)\$?)(\\(\w[\w].*))(.jpg|.JPG|.png|.PNG)$"
                                                ControlToValidate="f1" class="error mt8">  
                                            </asp:RegularExpressionValidator> 
                                        </div>



                                        <div class="form-group" id="dish_box1">
                                            <asp:Label ID="lbldishattribute" runat="server" Text="Dish Attributes"></asp:Label>

                                            <div class="row">
                                                <div class="col-4">
                                                    <input type="text" class="form-control" placeholder="Attribute" name="attribute">
                                                </div>
                                                <div class="col-3">
                                                    <input type="text" class="form-control" placeholder="Price" name="price">
                                                </div>
                                                <div class="col-3">
                                                    <select name="status" class="form-control">
                                                        <option value="1">Active</option>
                                                        <option value="0">Deactive</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="row mt8">
                                            </div>
                                        </div>



                                        <asp:Button ID="bttnsubmit" runat="server" class="btn btn-primary mr-2" Text="Submit" OnClick="bttnsubmit_Click" />
                                        <button type="button" class="btn badge-danger mr-2" onclick="add_more()">Add More</button>
                                    </form>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
                <input type="hidden" id="add_more" value="1" />
                <script>
                    function add_more() {
                        var add_more = jQuery('#add_more').val();
                        add_more++;
                        jQuery('#add_more').val(add_more);
                        var html = '<div class="row mt8" id="box' + add_more + '"><div class="col-4"><input type="text" class="form-control" placeholder="Attribute" name="attribute"></div><div class="col-3"><input type="text" class="form-control" placeholder="Price" name="price"></div><div class="col-3"><select name="status" class="form-control"><option value="1">Active</option><option value="0">Deactive</option></select></div><div class="col-2"><button type="button" class="btn badge-danger mr-2" onclick=remove_more("' + add_more + '")>Remove</button></div></div>';
                        jQuery('#dish_box1').append(html);
                    }

                    function remove_more(id) {
                        jQuery('#box' + id).remove();
                    }

                    function remove_more_new(id) {
                        var result = confirm('Are you sure?');
                        if (result == true) {
                            var cur_path = window.location.href;
                            window.location.href = cur_path + "&dish_details_id=" + id;
                        }
                    }
                </script>
                <!-- content-wrapper ends -->
                <!-- partial:partials/_footer.html -->
                <footer class="footer">
                    <div class="d-sm-flex justify-content-center justify-content-sm-between">
                        <span class="text-muted text-center text-sm-left d-block d-sm-inline-block">Copyright © 2021 <a href="" target="_blank">Billy</a>. All rights reserved.</span>
                    </div>
                </footer>
                <!-- partial -->
            </div>
            <!-- main-panel ends -->
        </div>
        <!-- page-body-wrapper ends -->
    </div>
    <!-- container-scroller -->

    <!-- plugins:js -->
    <script src="assets/js/vendor.bundle.base.js"></script>
    <script src="assets/js/jquery.dataTables.js"></script>
    <script src="assets/js/dataTables.bootstrap4.js"></script>
    <!-- endinject -->
    <!-- Plugin js for this page -->
    <script src="assets/js/Chart.min.js"></script>
    <script src="assets/js/bootstrap-datepicker.min.js"></script>
    <!-- End plugin js for this page -->
    <!-- inject:js -->
    <script src="assets/js/off-canvas.js"></script>
    <script src="assets/js/hoverable-collapse.js"></script>
    <script src="assets/js/template.js"></script>
    <script src="assets/js/settings.js"></script>
    <script src="assets/js/todolist.js"></script>
    <!-- endinject -->
    <!-- Custom js for this page-->
    <script src="assets/js/data-table.js"></script>
    <!-- End custom js for this page-->
</body>
</html>