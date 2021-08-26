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
          <h4><strong>Supervisión:. Pacientes</strong></h4>
        </div>
        <div class="col-sm-6">
          <ol class="breadcrumb float-sm-right">
            <li class="breadcrumb-item"><a href="#">Supervisión</a></li>
            <li class="breadcrumb-item active">Pacientes</li>
          </ol>
        </div>
      </div>
    </div>
  </section>
  <section class="content">
    <input type="hidden" name="estatusLog" id="estatusLog" value="<?php echo $_SESSION["loginId"]; ?>">
    <div class="card">
      <div class="card-header">
        <h3 class="card-title">Módulo Seguimiento de Pacientes &nbsp;<i class="fas fa-procedures"></i></h3>
      </div>
      <div class="card-body">
        <div class="row">
          <div class="col-12 col-sm-12 col-md-12 col-lg-9 col-xl-9">
            <div class="form-group">
              <label>Ingrese DNI Paciente:</label>
              <div class="input-group">
                <select class="form-control" style="width: 100%;" id="pacBusqueda" name="pacBusqueda">
                  <option value="0">Ingrese N° de DNI,CE,PASS o Nombres del Paciente</option>
                </select>
              </div>
            </div>
          </div>
          <div class="col-12 col-sm-12 col-md-12 col-lg-1 col-xl-1">
            <div class="form-group">
              <label class="text-light">.</label>
              <div class="input-group">
                <button type="btn" class="btn bg-secondary pull-right" id="deshacer-filtro-PAC"><i class="fas fa-undo-alt"></i> Deshacer
                </button>
              </div>
            </div>
          </div>
          <div class="col-12 col-sm-12 col-md-12 col-lg-1 col-xl-1">
            <div class="form-group">
              <label class="text-light">.</label>
              <div class="input-group">
                <button type="btn" class="btn btn-danger" id="btnPDFPac" idPaciente=""><i class="fas fa-file-pdf"></i> Historial</button>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="card-body" id="dataHistorial">
        <!-- <table id="datatablesPacientesMont" class="table table-bordered table-hover dt-responsive datatablesPacientesMont">
          <thead>
            <tr>
              <th style="width: 10px">#</th>
              <th style="width: 10px">Fecha</th>
              <th>Tipo</th>
              <th>Motivo</th>
              <th>Profesional</th>
              <th style="width: 10px">¿Comunicación con familiar?</th>
              <th>Familiar</th>
              <th>Observaciones</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>1</td>
              <td>1</td>
              <td>1</td>
              <td>1</td>
              <td>1</td>
              <td>1</td>
              <td>1</td>
              <td>1</td>
            </tr>
          </tbody>
        </table> -->
      </div>
  </section>
</div>