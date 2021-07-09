<?php
if ($_SESSION["loginPerfil"] == 3) {
  echo '<script>
    window.location = "dashboard";
  </script>';
  return;
}
?>
<div class="content-wrapper">
  <section class="content-header">
    <div class="container-fluid">
      <div class="row mb-2">
        <div class="col-sm-6">
          <h4><strong>Reportes:. General</strong></h4>
        </div>
        <div class="col-sm-6">
          <ol class="breadcrumb float-sm-right">
            <li class="breadcrumb-item"><a href="#">Reportes</a></li>
            <li class="breadcrumb-item active">General</li>
          </ol>
        </div>
      </div>
    </div>
  </section>
  <section class="content">
    <div class="card">
      <div class="card-header">
        <h3 class="card-title">Módulo Reporte General &nbsp;<i class="fas fa-chart-pie"></i></h3>
      </div>
      <div class="card-body">
        <input type="hidden" value="<?php echo $_SESSION["loginId"]; ?>" id="idAtencionUsuario">
        <button type="btn" class="btn btn-danger"><i class="fas fa-file-excel"></i> Auditoría Atenciones
        </button>
        <button type="btn" class="btn btn-secondary"><i class="fas fa-file-excel"></i> Auditoría Familiares
        </button>
        <button type="btn" class="ml-2 btn btn-success float-right" id="deshacer-filtro-RG"><i class="fas fa-undo-alt"></i> Deshacer filtro
        </button>
        <button type="button" class="btn btn-default float-right" id="rango-rg">
          <span>
            <i class="far fa-calendar-alt"></i>
            <?php
            if (isset($_GET["fechaInicialRG"])) {

              echo $_GET["fechaInicialRG"] . " - " . $_GET["fechaFinalRG"];
            } else {

              echo 'Seleccione Rango de fecha';
            }
            ?>
          </span>
          <i class="fas fa-caret-down"></i>
        </button>
      </div>
    </div>
  </section>
</div>