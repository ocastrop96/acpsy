<div class="content-wrapper">
  <section class="content-header">
    <div class="container-fluid">
      <div class="row mb-2">
        <div class="col-sm-6">
          <h4><strong>Acompañamiento:. Familiares</strong></h4>
        </div>
        <div class="col-sm-6">
          <ol class="breadcrumb float-sm-right">
            <li class="breadcrumb-item"><a href="#">Acompañamiento</a></li>
            <li class="breadcrumb-item active">Familiares</li>
          </ol>
        </div>
      </div>
    </div>
  </section>
  <section class="content">
    <div class="card">
      <div class="card-header">
        <h3 class="card-title">Módulo Familiares de Paciente &nbsp;<i class="fas fa-chalkboard-teacher"></i></h3>
      </div>
      <div class="card-body">
        <button type="btn" class="btn btn-secondary" data-toggle="modal" data-target="#modal-registrar-familiar"><i class="fas fa-chalkboard-teacher"></i> Registrar familiar
        </button>
      </div>
      <div class="card-body">
        <table id="datatableFamiliares" class="table table-bordered table-hover dt-responsive datatableFamiliares">
          <thead>
            <tr>
              <th style="width: 10px">#</th>
              <th>F.Registro</th>
              <th>N°Cuenta</th>
              <th>N°HC</th>
              <th>Paciente</th>
              <th>N°Doc Familiar</th>
              <th>Familiar</th>
              <th>Parentesco</th>
              <th>Tel/Cel</th>
              <th>Acciones</th>
            </tr>
          </thead>
        </table>
      </div>
    </div>
  </section>
</div>
<!-- Registrar Familiar -->
<div id="modal-registrar-familiar" class="modal fade" role="dialog" aria-modal="true" style="padding-right: 17px;">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <form action="" role="form" id="formRegFam" method="post">
        <div class="modal-header text-center" style="background: #5D646C; color: white">
          <h4 class="modal-title">Registrar Familiar&nbsp; <i class="fas fa-chalkboard-teacher"></i></h4>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
        </div>
        <div class="modal-body">
          <div class="row">
            <div class="col-12">
              <div class="form-group">
                <label for="">PACIENTE &nbsp;</label>
                <i class="fas fa-hospital-user"></i> *
                <!-- <input type="text" name="" id="" class="form-control" placeholder="Seleccione Paciente" required autocomplete="off" autofocus="autofocus" readonly> -->
                <select class="form-control" style="width: 100%;" id="pacienteFam" name="pacienteFam">
                  <option value="0">Ingrese apellidos o N° de cuenta de Paciente</option>
                </select>
                <input type="hidden" name="idAtencion" id="idAtencion">
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-3">
              <div class="form-group">
                <label for="">Tipo Doc &nbsp;</label>
                <i class="fas fa-hashtag"></i> *
                <div class="input-group">
                  <select class="form-control">
                    <option value="0">Seleccione T. Doc</option>
                    <option value="DNI" selected>DNI</option>
                    <option value="CE">CE</option>
                    <option value="PASS">PASS</option>
                  </select>
                </div>
              </div>
            </div>
            <div class="col-3">
              <div class="form-group">
                <label for="">N° Doc &nbsp;</label>
                <i class="fas fa-hashtag"></i> *
                <div class="input-group">
                  <input type="text" name="" id="" class="form-control" placeholder="Ingrese N° Doc" required autocomplete="off" autofocus="autofocus">
                </div>
              </div>
            </div>
            <div class="col-4">
              <div class="form-group">
                <label>Buscar DNI:<span class="text-danger">&nbsp;*</span></label>
                <div class="input-group">
                  <button type="button" class="btn btn-block btn-info" id="btnDNIFam"><i class="fas fa-search"></i> Consultar Datos DNI</button>
                </div>
              </div>
            </div>
            <!-- <div class="col-9">
              <div class="form-group">
                <label for="rgdDescripcion">Descripción de Diagnóstico &nbsp;</label>
                <i class="fas fa-laptop-medical"></i> *
                <div class="input-group">
                  <input type="text" name="rgdDescripcion" id="rgdDescripcion" class="form-control" placeholder="Ingrese detalle de diagnóstico" required autocomplete="off" autofocus="autofocus">
                </div>
              </div>
            </div> -->
          </div>
        </div>
        <div class="modal-footer justify-content-center">
          <button type="submit" class="btn btn-secondary" id="btnRegFam"><i class="fas fa-save"></i> Guardar</button>
          <button type="reset" class="btn btn-danger"><i class="fas fa-eraser"></i> Limpiar</button>
          <button type="button" class="btn btn-default" data-dismiss="modal"><i class="fas fa-times-circle"></i> Salir</button>
        </div>
      </form>
    </div>
  </div>
</div>
<!-- Registrar Familiar -->