<div class="content-wrapper">
  <section class="content-header">
    <div class="container-fluid">
      <div class="row mb-2">
        <div class="col-sm-6">
          <h4><strong>Acompañamiento:. Atenciones</strong></h4>
        </div>
        <div class="col-sm-6">
          <ol class="breadcrumb float-sm-right">
            <li class="breadcrumb-item"><a href="#">Acompañamiento</a></li>
            <li class="breadcrumb-item active">Atenciones</li>
          </ol>
        </div>
      </div>
    </div>
  </section>
  <section class="content">
    <div class="card">
      <div class="card-header">
        <h3 class="card-title">Módulo Atenciones &nbsp;<i class="fas fa-archive"></i></h3>
      </div>
      <div class="card-body">
        <button type="btn" class="btn btn-secondary" data-toggle="modal" data-target="#modal-registrar-atencion"><i class="fas fa-archive"></i> Registrar Atención
        </button>
      </div>
      <div class="card-body">
        <!-- <?php
              $valorCuenta  = 1901318;
              $cuenta = AtencionesControlador::ctrTraerDatosCuenta($valorCuenta);
              var_dump($cuenta);
              ?> -->
        <table id="datatableAtenciones" class="table table-bordered table-hover dt-responsive datatableAtenciones">
          <thead>
            <tr>
              <th style="width: 10px">#</th>
              <th>Correlativo</th>
              <th>F.Registro</th>
              <th>N°Cuenta</th>
              <th>N°HC</th>
              <th>N°Doc</th>
              <th>F.Ingreso</th>
              <th>Estado Paciente</th>
              <th>Apellidos y Nombres</th>
              <th>Servicio</th>
              <th>Financiamiento</th>
              <th>Estado</th>
              <th>Acciones</th>
            </tr>
          </thead>
        </table>
      </div>
    </div>
  </section>
</div>
<!-- Registrar Atención -->
<div id="modal-registrar-atencion" class="modal fade" role="dialog" aria-modal="true" style="padding-right: 17px;">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <form action="" role="form" id="formRegAte" method="post">
        <div class="modal-header text-center" style="background: #5D646C; color: white">
          <h4 class="modal-title">Registrar Atención de Paciente&nbsp; <i class="fas fa-hospital-user"></i></h4>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
        </div>
        <div class="modal-body">
          <div class="row">
            <div class="col-3">
              <div class="form-group">
                <label for="">CIE 10 &nbsp;</label>
                <i class="fas fa-hashtag"></i> *
                <div class="input-group">
                  <input type="text" name="" id="" class="form-control" placeholder="Ingrese N° Cuenta" required autocomplete="off" autofocus="autofocus">
                </div>
              </div>
            </div>
            <div class="col-9">
              <div class="form-group">
                <label for="rgdDescripcion">Descripción de Diagnóstico &nbsp;</label>
                <i class="fas fa-laptop-medical"></i> *
                <div class="input-group">
                  <input type="text" name="rgdDescripcion" id="rgdDescripcion" class="form-control" placeholder="Ingrese detalle de diagnóstico" required autocomplete="off" autofocus="autofocus">
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="modal-footer justify-content-center">
          <button type="submit" class="btn btn-secondary" id=""><i class="fas fa-save"></i> Guardar</button>
          <button type="reset" class="btn btn-danger"><i class="fas fa-eraser"></i> Limpiar</button>
          <button type="button" class="btn btn-default" data-dismiss="modal"><i class="fas fa-times-circle"></i> Salir</button>
        </div>
      </form>
    </div>
  </div>
</div>
<!-- Registrar Atención -->