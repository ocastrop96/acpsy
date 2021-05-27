<div class="content-wrapper">
  <section class="content-header">
    <div class="container-fluid">
      <div class="row mb-2">
        <div class="col-sm-6">
          <h4><strong>Complementos:. Profesionales</strong></h4>
        </div>
        <div class="col-sm-6">
          <ol class="breadcrumb float-sm-right">
            <li class="breadcrumb-item"><a href="#">Complementos</a></li>
            <li class="breadcrumb-item active">Profesionales</li>
          </ol>
        </div>
      </div>
    </div>
  </section>
  <section class="content">
    <div class="card">
      <div class="card-header">
        <h3 class="card-title">Módulo Profesionales &nbsp;<i class="fas fa-id-card-alt"></i></h3>
      </div>
      <div class="card-body">
        <button type="btn" class="btn btn-secondary" data-toggle="modal" data-target="#modal-registrar-profesional"><i class="fas fa-id-card-alt"></i> Registrar Profesional
        </button>
      </div>
      <div class="card-body">
        <table id="datatableProfesionales" class="table table-bordered table-hover dt-responsive datatableProfesionales">
          <thead>
            <tr>
              <th style="width: 10px">#</th>
              <th>DNI N°</th>
              <th>CPsP N°</th>
              <th>Nombres</th>
              <th>Apellidos</th>
              <th>Condición Laboral</th>
              <th>Acciones</th>
            </tr>
          </thead>
        </table>
      </div>
    </div>
  </section>
</div>
<!-- Registro de Profesionales -->
<div id="modal-registrar-profesional" class="modal fade" role="dialog" aria-modal="true" style="padding-right: 17px;">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <form action="" role="form" id="formRegProf" method="post">
        <div class="modal-header text-center" style="background: #5D646C; color: white">
          <h4 class="modal-title">Registrar Profesional</h4>
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
          <button type="submit" class="btn btn-secondary" id="btnRegProf"><i class="fas fa-save"></i> Guardar</button>
          <button type="reset" class="btn btn-danger"><i class="fas fa-eraser"></i> Limpiar</button>
          <button type="button" class="btn btn-default" data-dismiss="modal"><i class="fas fa-times-circle"></i> Salir</button>
        </div>
      </form>
    </div>
  </div>
</div>
<!-- Registro de Profesionales -->

<!-- Editar Profesionales -->
<div id="modal-editar-profesional" class="modal fade" role="dialog" aria-modal="true" style="padding-right: 17px;">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <form action="" role="form" id="formEdtProf" method="post">
        <div class="modal-header text-center" style="background: #5D646C; color: white">
          <h4 class="modal-title">Editar Profesional</h4>
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
          <button type="submit" class="btn btn-secondary" id="btnEdtProf"><i class="fas fa-save"></i> Guardar</button>
          <button type="reset" class="btn btn-danger"><i class="fas fa-eraser"></i> Limpiar</button>
          <button type="button" class="btn btn-default" data-dismiss="modal"><i class="fas fa-times-circle"></i> Salir</button>
        </div>
      </form>
    </div>
  </div>
</div>
<!-- Editar Profesionales -->