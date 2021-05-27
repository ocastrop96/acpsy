<div class="content-wrapper">
  <section class="content-header">
    <div class="container-fluid">
      <div class="row mb-2">
        <div class="col-sm-6">
          <h4><strong>Complementos:. Diagnósticos</strong></h4>
        </div>
        <div class="col-sm-6">
          <ol class="breadcrumb float-sm-right">
            <li class="breadcrumb-item"><a href="#">Complementos</a></li>
            <li class="breadcrumb-item active">Diagnósticos</li>
          </ol>
        </div>
      </div>
    </div>
  </section>
  <section class="content">
    <div class="card">
      <div class="card-header">
        <h3 class="card-title">Módulo Diagnósticos &nbsp;<i class="fas fa-stethoscope"></i></h3>
      </div>
      <div class="card-body">
        <button type="btn" class="btn btn-secondary" data-toggle="modal" data-target="#modal-registrar-diagnostico"><i class="fas fa-stethoscope"></i> Registrar Diagnóstico
        </button>
      </div>
      <div class="card-body">
        <table id="datatableDiagnosticos" class="table table-bordered table-hover dt-responsive datatableDiagnosticos">
          <thead>
            <tr>
              <th style="width: 10px">#</th>
              <th>Cie 10</th>
              <th>Detalle de Diagnóstico</th>
              <th>Acciones</th>
            </tr>
          </thead>
        </table>
      </div>
    </div>
  </section>
</div>
<!-- Registro de Diagnóstico -->
<div id="modal-registrar-diagnostico" class="modal fade" role="dialog" aria-modal="true" style="padding-right: 17px;">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <form action="" role="form" id="formRegDiag" method="post">
        <div class="modal-header text-center" style="background: #5D646C; color: white">
          <h4 class="modal-title">Registrar Diagnóstico</h4>
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
                  <input type="text" name="" id="" class="form-control" placeholder="Ingrese CIE 10" required autocomplete="off" autofocus="autofocus">
                </div>
              </div>
            </div>
            <div class="col-9">
              <div class="form-group">
                <label for="">Descripción de Diagnóstico &nbsp;</label>
                <i class="fas fa-laptop-medical"></i> *
                <div class="input-group">
                  <input type="text" name="" id="" class="form-control" placeholder="Ingrese detalle de diagnóstico" required autocomplete="off" autofocus="autofocus">
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="modal-footer justify-content-center">
          <button type="submit" class="btn btn-secondary" id="btnRegDiag"><i class="fas fa-save"></i> Guardar</button>
          <button type="reset" class="btn btn-danger"><i class="fas fa-eraser"></i> Limpiar</button>
          <button type="button" class="btn btn-default" data-dismiss="modal"><i class="fas fa-times-circle"></i> Salir</button>
        </div>
      </form>
    </div>
  </div>
</div>
<!-- Registro de Diagnóstico -->
<!-- Editar de Diagnóstico -->
<div id="modal-editar-diagnostico" class="modal fade" role="dialog" aria-modal="true" style="padding-right: 17px;">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <form action="" role="form" id="formEdtDiag" method="post">
        <div class="modal-header text-center" style="background: #5D646C; color: white">
          <h4 class="modal-title">Editar Diagnóstico</h4>
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
                  <input type="text" name="" id="" class="form-control" required autocomplete="off" autofocus="autofocus">
                </div>
              </div>
            </div>
            <div class="col-9">
              <div class="form-group">
                <label for="">Descripción de Diagnóstico &nbsp;</label>
                <i class="fas fa-laptop-medical"></i> *
                <div class="input-group">
                  <input type="text" name="" id="" class="form-control" required autocomplete="off" autofocus="autofocus">
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="modal-footer justify-content-center">
          <button type="submit" class="btn btn-secondary" id="btnEdtDiag"><i class="fas fa-save"></i> Guardar</button>
          <button type="button" class="btn btn-default" data-dismiss="modal"><i class="fas fa-times-circle"></i> Cancelar</button>
        </div>
      </form>
    </div>
  </div>
</div>
<!-- Editar de Diagnóstico -->