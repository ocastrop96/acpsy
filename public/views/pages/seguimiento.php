<div class="content-wrapper">
  <section class="content-header">
    <div class="container-fluid">
      <div class="row mb-2">
        <div class="col-sm-6">
          <h4><strong>Acompañamiento:. Seguimiento de Atencion</strong></h4>
        </div>
        <div class="col-sm-6">
          <ol class="breadcrumb float-sm-right">
            <li class="breadcrumb-item"><a href="#">Acompañamiento</a></li>
            <li class="breadcrumb-item active">Seguimiento</li>
          </ol>
        </div>
      </div>
    </div>
  </section>
  <section class="content">
    <div class="card">
      <div class="card-header">
        <h3 class="card-title">Módulo Seguimiento de Atenciones &nbsp;<i class="fas fa-diagnoses"></i></h3>
      </div>
      <div class="card-body">
        <button type="btn" class="btn btn-secondary" data-toggle="modal" data-target="#modal-registrar-seguimiento"><i class="fas fa-diagnoses"></i> Registrar seguimiento
        </button>
      </div>
      <div class="card-body">
        <table id="datatableSeguimiento" class="table table-bordered table-hover dt-responsive datatableSeguimiento">
          <thead>
            <tr>
              <th style="width: 10px">#</th>
              <th style="width: 10px">Registro</th>
              <th style="width: 10px">N° Cuenta</th>
              <th>Paciente</th>
              <th>Tipo</th>
              <th>Motivo</th>
              <th>Etapa</th>
              <th>Profesional</th>
              <th style="width: 10px">¿Comunicación con familiar?</th>
              <th style="width: 10px">Familiar</th>
              <th>Estado</th>
              <th>Acciones</th>
            </tr>
          </thead>
        </table>
      </div>
    </div>
  </section>
</div>
<!-- Registrar Seguimiento -->
<div id="modal-registrar-seguimiento" class="modal fade" role="dialog" aria-modal="true" style="padding-right: 17px;">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <form action="" role="form" id="formRegSeg" method="post">
        <div class="modal-header text-center" style="background: #5D646C; color: white">
          <h4 class="modal-title">Registrar Seguimiento&nbsp; <i class="fas fa-diagnoses"></i></h4>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
        </div>
        <div class="modal-body">
          <div class="row">
            <div class="col-12">
              <div class="form-group">
                <label for="rgSegPac">Atención de Paciente &nbsp;</label>
                <i class="fas fa-hospital-user"></i> *
                <div class="input-group">
                  <select class="form-control" style="width: 100%;" id="rgSegPac" name="rgSegPac">
                    <option value="0">Ingrese apellidos o N° de cuenta de Paciente</option>
                  </select>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="modal-footer justify-content-center">
          <button type="submit" class="btn btn-secondary" id="btnRegDiag"><i class="fas fa-save"></i> Registrar</button>
          <button type="reset" class="btn btn-danger"><i class="fas fa-eraser"></i> Limpiar</button>
          <button type="button" class="btn btn-default" data-dismiss="modal"><i class="fas fa-times-circle"></i> Salir</button>
        </div>
        <?php
        $registroDiag = new DiagnosticosControlador();
        $registroDiag->ctrRegistrarDiagnostico();
        ?>
      </form>
    </div>
  </div>
</div>
<!-- Registrar Seguimiento -->
<!-- Editar Seguimiento -->

<!-- Editar Seguimiento -->