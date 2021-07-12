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
        <div class="card-tools">
          <a href="public/views/docs/rp-audatenciones.php?reporte=reporte" class="rg2">
            <button type="btn" class="btn btn-danger"><i class="fas fa-file-excel"></i> Auditoría Atenciones
            </button>
          </a>
          <a href="public/views/docs/rp-audfamiliares.php?reporte=reporte" class="rg1">
            <button type="btn" class="btn btn-secondary"><i class="fas fa-file-excel"></i> Auditoría Familiares
            </button>
          </a>
          <!-- <button type="button" class="btn btn-tool" data-card-widget="collapse">
            <i class="fas fa-minus"></i>
          </button>
          <button type="button" class="btn btn-tool" data-card-widget="remove">
            <i class="fas fa-times"></i>
          </button> -->
        </div>
      </div>

      <div class="card-body">
        <div class="row">
          <div class="col-12 col-sm-12 col-md-12 col-lg-7 col-xl-7">
            <div class="form-group">
              <label>Selecciona un rango de fecha:</label>
              <div class="input-group">
                <div class="input-group-prepend">
                  <span class="input-group-text">
                    <i class="far fa-calendar-alt"></i>
                  </span>
                </div>
                <input type="text" class="form-control float-right" id="rango-rg" name="rango-rg" readonly>
                <button type="btn" class="ml-2 btn bg-success pull-right" id="deshacer-filtro-RG"><i class="fas fa-undo-alt"></i> Deshacer filtro
                </button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="row">
      <div class="col-md-6">
        <div class="card card-gray">
          <div class="card-header">
            <h3 class="card-title font-weight-bold">Atenciones Registradas y Anuladas</h3>
          </div>
          <div class="card-body">
            <div class="position-relative mb-4">
              <canvas id="sales-chart" height="200"></canvas>
            </div>

            <div class="d-flex flex-row justify-content-end">
              <span class="mr-2">
                <i class="fas fa-clipboard-list text-primary"></i>
                <i class="fas fa-square text-primary"></i> Registradas
              </span>
              <span>
                <i class="fas fa-ban text-gray"></i>
                <i class="fas fa-square text-gray"></i> Anuladas
              </span>
            </div>
          </div>
        </div>
      </div>
      <div class="col-md-6">
        <div class="card card-gray">
          <div class="card-header">
            <h3 class="card-title font-weight-bold">Familiares Registradas y Eliminados</h3>
          </div>
          <div class="card-body">
            <!-- <div class="chart">
              <canvas id="rgg1" width="400" height="400"></canvas>
            </div> -->
          </div>
        </div>
      </div>
    </div>
    <div class="row">
      <div class="col-md-6">
        <div class="card card-gray">
          <div class="card-header">
            <h3 class="card-title font-weight-bold">Seguimientos Registrados y Anulados</h3>
          </div>
          <div class="card-body">
            <!-- <div class="chart">
              <canvas id="rgg1" width="400" height="400"></canvas>
            </div> -->
          </div>
        </div>
      </div>
      <div class="col-md-6">
        <div class="card card-gray">
          <div class="card-header">
            <h3 class="card-title font-weight-bold">Tipo de Parentesco</h3>
          </div>
          <div class="card-body">
            <!-- <div class="chart">
              <canvas id="rgg1" width="400" height="400"></canvas>
            </div> -->
          </div>
        </div>
      </div>
    </div>
    <div class="row">
      <div class="col-md-6">
        <div class="card card-gray">
          <div class="card-header">
            <h3 class="card-title font-weight-bold">Edad</h3>
          </div>
          <div class="card-body">
            <!-- <div class="chart">
              <canvas id="rgg1" width="400" height="400"></canvas>
            </div> -->
          </div>
        </div>
      </div>
      <div class="col-md-6">
        <div class="card card-gray">
          <div class="card-header">
            <h3 class="card-title font-weight-bold">Sexo</h3>
          </div>
          <div class="card-body">
            <!-- <div class="chart">
              <canvas id="rgg1" width="400" height="400"></canvas>
            </div> -->
          </div>
        </div>
      </div>
    </div>
  </section>
</div>