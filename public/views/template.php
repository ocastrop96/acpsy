<?php
session_start();
?>
<!DOCTYPE html>
<html lang="es">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <link rel="shortcut icon" type="image/x-icon" href="public/views/resources/img/acpsy-icono.ico" />
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>ACPSI-Web | HNSEB</title>
  <!-- CSS -->
  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Lato:ital,wght@0,300;0,400;0,700;1,400&display=swap">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="public/views/plugins/fontawesome-free/css/all.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
  <!-- Datatables -->
  <link rel="stylesheet" href="public/views/plugins/datatables-bs4/css/dataTables.bootstrap4.css">
  <link rel="stylesheet" href="public/views/plugins/datatables-responsive/css/responsive.bootstrap4.min.css">
  <link rel="stylesheet" href="public/views/plugins/datatables-bs4/css/dataTables.bootstrap4.css">
  <!-- Tempusdominus Bootstrap 4 -->
  <link rel="stylesheet" href="public/views/plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">
  <!-- iCheck -->
  <link rel="stylesheet" href="public/views/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
  <!-- Sweetalert -->
  <link rel="stylesheet" href="public/views/plugins/sweetalert2-theme-bootstrap-4/bootstrap-4.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="public/views/resources/css/adminlte.css">
  <!-- overlayScrollbars -->
  <link rel="stylesheet" href="public/views/plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
  <!-- Daterange picker -->
  <link rel="stylesheet" href="public/views/plugins/daterangepicker/daterangepicker.css">
  <!-- summernote -->
  <link rel="stylesheet" href="public/views/plugins/summernote/summernote-bs4.min.css">
  <!-- CSS -->
  <!-- JS -->
  <script src="public/views/plugins/jquery/jquery.min.js"></script>
  <!-- jQuery UI 1.11.4 -->
  <script src="public/views/plugins/jquery-ui/jquery-ui.min.js"></script>
  <!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
  <!-- Bootstrap 4 -->
  <script src="public/views/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
  <!-- Datatables -->
  <script src="public/views/plugins/datatables/jquery.dataTables.js"></script>
  <script src="public/views/plugins/datatables-bs4/js/dataTables.bootstrap4.js"></script>
  <script src="public/views/plugins/datatables-responsive/js/dataTables.responsive.min.js"></script>
  <script src="public/views/plugins/datatables-responsive/js/responsive.bootstrap4.min.js"></script>
  <!-- Sweetalert -->
  <script src="public/views/plugins/sweetalert2/sweetalert2.min.js"></script>
  <!-- daterangepicker -->
  <script src="public/views/plugins/moment/moment.min.js"></script>
  <script src="public/views/plugins/daterangepicker/daterangepicker.js"></script>
  <!-- Tempusdominus Bootstrap 4 -->
  <script src="public/views/plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js"></script>
  <!-- Summernote -->
  <script src="public/views/plugins/summernote/summernote-bs4.min.js"></script>
  <!-- overlayScrollbars -->
  <script src="public/views/plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js"></script>
  <!-- jquery-validation -->
  <script src="public/views/plugins/jquery-validation/jquery.validate.min.js"></script>
  <script src="public/views/plugins/jquery-validation/additional-methods.min.js"></script>
  <!-- AdminLTE App -->
  <script src="public/views/resources/js/adminlte.js"></script>
  <!-- JS -->
</head>

<body class="hold-transition sidebar-mini layout-fixed">
  <?php
  if (isset($_SESSION["loginACPSY"]) && $_SESSION["loginACPSY"] == "ok") {
    echo '<div class="wrapper">';
    include('pages/header.php');
    include('pages/menu.php');

    if (isset($_GET["ruta"])) {
      if (
        $_GET["ruta"] == "dashboard" ||
        $_GET["ruta"] == "usuarios" ||
        $_GET["ruta"] == "profesionales" ||
        $_GET["ruta"] == "diagnosticos" ||
        $_GET["ruta"] == "atenciones" ||
        $_GET["ruta"] == "familiares" ||
        $_GET["ruta"] == "seguimiento" ||
        $_GET["ruta"] == "reporte-general" ||
        $_GET["ruta"] == "reporte-jefatura" ||
        $_GET["ruta"] == "reporte-profesional" ||
        $_GET["ruta"] == "logout"
      ) {
        include "pages/" . $_GET["ruta"] . ".php";
      } else {
        include "pages/404.php";
      }
    } else {
      include "pages/dashboard.php";
    }
    include('pages/footer.php');
    echo '</div>';
  } else {
    include "pages/login.php";
  }
  ?>
  <!-- Scripts JS Propios -->
  <script type="text/javascript" src="public/js/main.js"></script>
  <script type="text/javascript" src="public/js/login.js"></script>
  <script type="text/javascript" src="public/js/usuarios.js"></script>
  <script type="text/javascript" src="public/js/profesionales.js"></script>
  <script type="text/javascript" src="public/js/diagnosticos.js"></script>
  <script type="text/javascript" src="public/js/atenciones.js"></script>
  <script type="text/javascript" src="public/js/familiares.js"></script>
  <script type="text/javascript" src="public/js/seguimiento.js"></script>


  <!-- Scripts JS Propios -->
</body>

</html>