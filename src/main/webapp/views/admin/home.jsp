<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Admin | Home</title>

  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="<c:url value='/templates/admin/plugins/fontawesome-free/css/all.min.css' />">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
  <!-- Tempusdominus Bootstrap 4 -->
  <link rel="stylesheet" href="<c:url value='/templates/admin/plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css'/>">
  <!-- iCheck -->
  <link rel="stylesheet" href="<c:url value='/templates/admin/plugins/icheck-bootstrap/icheck-bootstrap.min.css'/>">
  <!-- JQVMap -->
  <link rel="stylesheet" href="<c:url value='/templates/admin/plugins/jqvmap/jqvmap.min.css'/>">
  <!-- Theme style -->
  <link rel="stylesheet" href="<c:url value='/templates/admin/dist/css/adminlte.min.css'/>">
  <!-- overlayScrollbars -->
  <link rel="stylesheet" href="<c:url value='/templates/admin/plugins/overlayScrollbars/css/OverlayScrollbars.min.css'/>">
  <!-- Daterange picker -->
  <link rel="stylesheet" href="<c:url value='/templates/admin/plugins/daterangepicker/daterangepicker.css'/>">
  <!-- summernote -->
  <link rel="stylesheet" href="<c:url value='/templates/admin/plugins/summernote/summernote-bs4.min.css'/>">

</head>
<body class="hold-transition sidebar-mini layout-fixed">
<div class="wrapper">

  <!-- Preloader -->
  <div class="preloader flex-column justify-content-center align-items-center">
    <img class="animation__shake" src="<c:url value='/templates/admin/dist/img/AdminLTELogo.png'/>" alt="AdminLTELogo" height="60" width="60">
  </div>

  <!-- Navbar -->
  <nav class="main-header navbar navbar-expand navbar-white navbar-light">
    <!-- Left navbar links -->
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
      </li>
      <li class="nav-item d-none d-sm-inline-block">
        <a href="#" class="nav-link">Home</a>
      </li>
    </ul>

    <!-- Right navbar links -->
    <ul class="navbar-nav ml-auto">
      <!-- Navbar Search -->
      <li class="nav-item">
        <a class="nav-link" data-widget="navbar-search" href="#" role="button">
          <i class="fas fa-search"></i>
        </a>
        <div class="navbar-search-block">
          <form class="form-inline">
            <div class="input-group input-group-sm">
              <input class="form-control form-control-navbar" type="search" placeholder="Search" aria-label="Search">
              <div class="input-group-append">
                <button class="btn btn-navbar" type="submit">
                  <i class="fas fa-search"></i>
                </button>
                <button class="btn btn-navbar" type="button" data-widget="navbar-search">
                  <i class="fas fa-times"></i>
                </button>
              </div>
            </div>
          </form>
        </div>
      </li>
    </ul>
  </nav>
  <!-- /.navbar -->

   <!-- Main Sidebar Container -->
  <aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- Brand Logo -->
    <a href="#" class="brand-link">
     <img src="<c:url value='/templates/admin/dist/img/AdminLTELogo.png'/>" alt="AdminLTE Logo" class="brand-image img-circle elevation-3" style="opacity: .8">
      <span class="brand-text font-weight-light">Admin</span>
    </a>

    <!-- Sidebar -->
    <div class="sidebar">
      <!-- Sidebar user panel (optional) -->
      <div class="user-panel mt-3 pb-3 mb-3 d-flex">
        <div class="image">
          <img src="<c:url value='/template/user/img/netflixLogo.png'/>" width="100" height="100" class="img-circle elevation-2" alt="User Image">
        </div>
        <div class="info">
          <a href="#" class="d-block">${sessionScope.currentUser.username}</a>
        </div>
      </div>

      <!-- SidebarSearch Form -->
      <div class="form-inline">
        <div class="input-group" data-widget="sidebar-search">
          <input class="form-control form-control-sidebar" type="search" placeholder="Search" aria-label="Search">
          <div class="input-group-append">
            <button class="btn btn-sidebar">
              <i class="fas fa-search fa-fw"></i>
            </button>
          </div>
        </div>
      </div>


     <!-- Sidebar Menu -->
      <nav class="mt-2">
        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
          <!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
          <li class="nav-item menu-open">
            <a href="admin" class="nav-link active">
              <i class="nav-icon fas fa-tachometer-alt"></i>
              <p>
                Home
              </p>
            </a>
          </li>
          
          <li class="nav-item menu-open">
            <a href="admin/video?action=view" class="nav-link">
              <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-youtube" viewBox="0 0 20 20">
				 	<path d="M8.051 1.999h.089c.822.003 4.987.033 6.11.335a2.01 2.01 0 0 1 1.415 1.42c.101.38.172.883.22 1.402l.01.104.022.26.008.104c.065.914.073 1.77.074 1.957v.075c-.001.194-.01 1.108-.082 2.06l-.008.105-.009.104c-.05.572-.124 1.14-.235 1.558a2.01 2.01 0 0 1-1.415 1.42c-1.16.312-5.569.334-6.18.335h-.142c-.309 0-1.587-.006-2.927-.052l-.17-.006-.087-.004-.171-.007-.171-.007c-1.11-.049-2.167-.128-2.654-.26a2.01 2.01 0 0 1-1.415-1.419c-.111-.417-.185-.986-.235-1.558L.09 9.82l-.008-.104A31 31 0 0 1 0 7.68v-.123c.002-.215.01-.958.064-1.778l.007-.103.003-.052.008-.104.022-.26.01-.104c.048-.519.119-1.023.22-1.402a2.01 2.01 0 0 1 1.415-1.42c.487-.13 1.544-.21 2.654-.26l.17-.007.172-.006.086-.003.171-.007A100 100 0 0 1 7.858 2zM6.4 5.209v4.818l4.157-2.408z"/>
				</svg>
              <p>
                Video
                <i class="right fas fa-angle-left"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="admin/video?action=view" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Overview</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="admin/video?action=add" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>New or Edit</p>
                </a>
              </li>
            </ul>
          </li>
         
         <li class="nav-item menu-open">
            <a href="admin/user?action=view" class="nav-link">
              <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 20 20">
				  <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0"/>
				  <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8m8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1"/>
				</svg>
              <p>
                User
                <i class="right fas fa-angle-left"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="admin/user?action=view" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Overview</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="admin/user?action=add" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>New or Edit</p>
                </a>
              </li>
            </ul>
          </li>
          
        </ul>
      </nav>
      <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
  </aside>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0">Home</h1>
          </div><!-- /.col -->
          <div class="col-sm-12">
           
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <!-- Main content -->
    <section class="content">
      <div class="card">
              <div class="card-header">
                <h3 class="card-title">Favorites Statistic</h3>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                <table id="example1" class="table table-bordered table-striped">
                  <thead>
	                  <tr>
	                    <th>Title</th>
	                    <th>Href</th>
	                    <th>Total Like</th>
	                  </tr>
                  </thead>
                  <tbody>
	                  <c:forEach items="${videos}" var="item">
	                  		<tr>
	                  			<td>${item.title}</td>
	                  			<td><a href="video?action=watch&id=${item.href}">${item.href}</a></td>
	                  			<td>${item.totalLike}</td>
	                  		</tr>
	                  </c:forEach>
                  </tbody>
                </table>
              </div>
              <!-- /.card-body -->
            </div>
            
            
             <div class="card">
              <div class="card-header">
                <h3 class="card-title">Favorites Info</h3>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
              <div class="form-group">
                  <label>List Videos</label>
                  <select id="selectVideo" class="form-control">
                  	<option selected disabled>Select one</option>
                  	<c:forEach items="${videos}" var="item">
                  		<option value="${item.href}">${item.title}</option>
                  	</c:forEach>
                  </select>
                </div>
                <table id="example2" class="table table-bordered table-striped">
                  <thead>
	                  <tr>
	                    <th>Username</th>
	                    <th>Email</th>
	                  </tr>
                  </thead>
                  <tbody>
	                  
                  </tbody>
                </table>
              </div>
              <!-- /.card-body -->
            </div>
            
            
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
  <footer class="main-footer">
    <strong>Copyright @ by FPT Polytechnic</strong>	
    <div class="float-right d-none d-sm-inline-block">
      <b>Version</b> 1.0.0
    </div>
  </footer>

  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Control sidebar content goes here -->
  </aside>
  <!-- /.control-sidebar -->
</div>
<!-- ./wrapper -->

<!-- jQuery -->
<script src="<c:url value='/templates/admin/plugins/jquery/jquery.min.js'/>"></script>
<!-- jQuery UI 1.11.4 -->
<script src="<c:url value='/templates/admin/plugins/jquery-ui/jquery-ui.min.js'/>"></script>
<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
<script>
  $.widget.bridge('uibutton', $.ui.button)
</script>
<!-- Bootstrap 4 -->
<script src="<c:url value='/templates/admin/plugins/bootstrap/js/bootstrap.bundle.min.js'/>"></script>
<!-- ChartJS -->
<script src="<c:url value='/templates/admin/plugins/chart.js/Chart.min.js'/>"></script>
<!-- Sparkline -->
<script src="<c:url value='/templates/admin/plugins/sparklines/sparkline.js'/>"></script>
<!-- JQVMap -->
<script src="<c:url value='/templates/admin/plugins/jqvmap/jquery.vmap.min.js'/>"></script>
<script src="<c:url value='/templates/admin/plugins/jqvmap/maps/jquery.vmap.usa.js'/>"></script>
<!-- jQuery Knob Chart -->
<script src="<c:url value='/templates/admin/plugins/jquery-knob/jquery.knob.min.js'/>"></script>
<!-- daterangepicker -->
<script src="<c:url value='/templates/admin/plugins/moment/moment.min.js'/>"></script>
<script src="<c:url value='/templates/admin/plugins/daterangepicker/daterangepicker.js'/>"></script>
<!-- Tempusdominus Bootstrap 4 -->
<script src="<c:url value='/templates/admin/plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js'/>"></script>
<!-- Summernote -->
<script src="<c:url value='/templates/admin/plugins/summernote/summernote-bs4.min.js'/>"></script>
<!-- overlayScrollbars -->
<script src="<c:url value='/templates/admin/plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js'/>"></script>
<!-- AdminLTE App -->
<script src="<c:url value='/templates/admin/dist/js/adminlte.js'/>"></script>
<!-- AdminLTE for demo purposes -->

<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
<script src="<c:url value='/templates/admin/dist/js/pages/dashboard.js'/>"></script>



<!-- DataTables  & Plugins -->
<script src="<c:url value ='/templates/admin/plugins/datatables/jquery.dataTables.min.js'/>"></script>
<script src="<c:url value ='/templates/admin/plugins/datatables-bs4/js/dataTables.bootstrap4.min.js'/>"></script>
<script src="<c:url value ='/templates/admin/plugins/datatables-responsive/js/dataTables.responsive.min.js'/>"></script>
<script src="<c:url value ='/templates/admin/plugins/datatables-responsive/js/responsive.bootstrap4.min.js'/>"></script>
<script src="<c:url value ='/templates/admin/plugins/datatables-buttons/js/dataTables.buttons.min.js'/>"></script>
<script src="<c:url value ='/templates/admin/plugins/datatables-buttons/js/buttons.bootstrap4.min.js'/>"></script>
<script src="<c:url value ='/templates/admin/plugins/jszip/jszip.min.js'/>"></script>
<script src="<c:url value ='/templates/admin/plugins/pdfmake/pdfmake.min.js'/>"></script>
<script src="<c:url value ='/templates/admin/plugins/pdfmake/vfs_fonts.js'/>"></script>
<script src="<c:url value ='/templates/admin/plugins/datatables-buttons/js/buttons.html5.min.js'/>"></script>
<script src="<c:url value ='/templates/admin/plugins/datatables-buttons/js/buttons.print.min.js'/>"></script>
<script src="<c:url value ='/templates/admin/plugins/datatables-buttons/js/buttons.colVis.min.js'/>"></script>




<script>
  $(function () {
    $("#example1").DataTable({
      "responsive": true, "lengthChange": false, "autoWidth": false,
      "buttons": ["copy", "csv", "excel", "pdf", "print", "colvis"]
    }).buttons().container().appendTo('#example1_wrapper .col-md-6:eq(0)');
    
    $('#example2').DataTable({
      "paging": true,
      "lengthChange": false,
      "searching": false,
      "ordering": true,
      "info": true,
      "autoWidth": false,
      "responsive": true,
    });
  });
  
  
  
  
  $('#selectVideo').change(function(){
	 var videoHref = $(this).val();
	 $.ajax({
		 url: 'admin/favorites?href=' + videoHref,
		type: 'GET',
		contentType: 'application/json'
	 }).done(function(data){
		 $('#example2').dataTable({
			  destroy: true,
		      "paging": true,
		      "lengthChange": false,
		      "searching": false,
		      "ordering": true,
		      "info": true,
		      "autoWidth": false,
		      "responsive": true,
		      "aaData": data,
		      "columns": [{"data": "username"}, {"data": "email"}]
		  });
	 }).fail(function(error){
		 $('#example2').dataTable().fnClearTable();
	 });
  });
</script>


</body>
</html>
    