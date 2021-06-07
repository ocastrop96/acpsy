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
        <table id="datatableAtenciones" class="table table-bordered table-hover dt-responsive datatableAtenciones">
          <thead>
            <tr>
              <th style="width: 10px">#</th>
              <th>N° Ficha</th>
              <th style="width: 10px">F.Registro</th>
              <th style="width: 10px">N° Cuenta</th>
              <th>N° HC</th>
              <th>Tip N° Doc</th>
              <th>F.Ingreso</th>
              <th>Est.Pac</th>
              <th>Apellidos y Nombres</th>
              <th>F.Financ</th>
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
                <label for="">N° de Cuenta &nbsp;</label>
                <i class="fas fa-hashtag"></i> *
                <div class="input-group">
                  <input type="text" name="" id="" class="form-control" placeholder="Ingrese N° Cuenta" required autocomplete="off" autofocus="autofocus">
                  <input type="hidden" name="usuRegAte" id="usuRegAte" value="<?php echo $_SESSION["loginId"]; ?>">
                </div>
              </div>
            </div>
            <div class="col-2" id="btnCuentaPac1">
              <div class="form-group">
                <label>Búsqueda:<span class="text-danger">&nbsp;*</span></label>
                <div class="input-group">
                  <button type="button" class="btn btn-block btn-info" data-toggle="modal" data-target="#modal-busqueda-cuenta" id="btnCuentaPac"><i class="fas fa-search"></i> Consultar</button>
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-12 col-sm-3 col-md-3 col-lg-3">
              <div class="form-group">
                <label for="">N° de Historia &nbsp;</label>
                <i class="fas fa-file-medical-alt"></i> *
                <div class="input-group">
                  <input type="text" name="" id="" class="form-control" placeholder="Ingrese N° HC" required autocomplete="off" autofocus="autofocus">
                </div>
              </div>
            </div>
            <div class="col-12 col-sm-3 col-md-3 col-lg-3">
              <div class="form-group">
                <label for="">F.Nacimiento</label>
                <i class="fas fa-calendar-alt"></i>
                <div class="input-group">
                  <input type="text" name="" id="" class="form-control" placeholder="Ingrese F. Nacimiento" required autocomplete="off" autofocus="autofocus">
                </div>
              </div>
            </div>
            <div class="col-12 col-sm-3 col-md-3 col-lg-3">
              <div class="form-group">
                <label for="">T.Doc &nbsp;</label>
                <i class="fas fa-id-card"></i> *
                <div class="input-group">
                  <input type="text" name="" id="" class="form-control" placeholder="Ingrese N° HC" required autocomplete="off" autofocus="autofocus">
                </div>
              </div>
            </div>
            <div class="col-12 col-sm-3 col-md-3 col-lg-3">
              <div class="form-group">
                <label for="">N.Doc &nbsp;</label>
                <i class="fas fa-id-card"></i> *
                <div class="input-group">
                  <input type="text" name="" id="" class="form-control" placeholder="Ingrese N° HC" required autocomplete="off" autofocus="autofocus">
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-12 col-sm-4 col-md-4 col-lg-4">
              <div class="form-group">
                <label for="">Apellido Paterno &nbsp;</label>
                <i class="fas fa-file-medical-alt"></i> *
                <div class="input-group">
                  <input type="text" name="" id="" class="form-control" placeholder="Ingrese N° HC" required autocomplete="off" autofocus="autofocus">
                </div>
              </div>
            </div>
            <div class="col-12 col-sm-4 col-md-4 col-lg-4">
              <div class="form-group">
                <label for="">Apellido Materno &nbsp;</label>
                <i class="fas fa-file-medical-alt"></i> *
                <div class="input-group">
                  <input type="text" name="" id="" class="form-control" placeholder="Ingrese N° HC" required autocomplete="off" autofocus="autofocus">
                </div>
              </div>
            </div>
            <div class="col-12 col-sm-4 col-md-4 col-lg-4">
              <div class="form-group">
                <label for="">Nombres &nbsp;</label>
                <i class="fas fa-file-medical-alt"></i> *
                <div class="input-group">
                  <input type="text" name="" id="" class="form-control" placeholder="Ingrese N° HC" required autocomplete="off" autofocus="autofocus">
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-12 col-sm-2 col-md-2 col-lg-2">
              <div class="form-group">
                <label for="">Edad</label>
                <i class="fas fa-file-medical-alt"></i> *
                <div class="input-group">
                  <input type="text" name="" id="" class="form-control" placeholder="Ingrese N° HC" required autocomplete="off" autofocus="autofocus">
                </div>
              </div>
            </div>
            <div class="col-12 col-sm-3 col-md-3 col-lg-3">
              <div class="form-group">
                <label for="">Sexo &nbsp;</label>
                <i class="fas fa-file-medical-alt"></i> *
                <div class="input-group">
                  <select class="form-control" style="width: 100%;" name="rgPerfil" id="rgPerfil">
                    <option value="0">Seleccione Sexo</option>
                    <option value="0">MASCULINO</option>
                    <option value="0">FEMENINO</option>
                  </select>
                </div>
              </div>
            </div>
            <div class="col-12 col-sm-3 col-md-3 col-lg-3">
              <div class="form-group">
                <label for="">Financimiento &nbsp;</label>
                <i class="fas fa-file-medical-alt"></i> *
                <div class="input-group">
                  <input type="text" name="" id="" class="form-control" placeholder="Ingrese N° HC" required autocomplete="off" autofocus="autofocus">
                </div>
              </div>
            </div>
            <div class="col-12 col-sm-4 col-md-4 col-lg-4">
              <div class="form-group">
                <label for="">Distrito &nbsp;</label>
                <i class="fas fa-file-medical-alt"></i> *
                <div class="input-group">
                  <input type="text" name="" id="" class="form-control" placeholder="Ingrese N° HC" required autocomplete="off" autofocus="autofocus">
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-12 col-sm-3 col-md-3 col-lg-3">
              <div class="form-group">
                <label for="">Estado Paciente &nbsp;</label>
                <i class="fas fa-file-medical-alt"></i> *
                <div class="input-group">
                  <select class="form-control" style="width: 100%;" name="rgPerfil" id="rgPerfil">
                    <option value="0">Seleccione Estado</option>
                    <option value="0">MASCULINO</option>
                    <option value="0">FEMENINO</option>
                  </select>
                </div>
              </div>
            </div>
            <div class="col-12 col-sm-5 col-md-5 col-lg-5">
              <div class="form-group">
                <label for="">Servicio Ing. &nbsp;</label>
                <i class="fas fa-file-medical-alt"></i> *
                <div class="input-group">
                  <input type="text" name="" id="" class="form-control" placeholder="Ingrese N° HC" required autocomplete="off" autofocus="autofocus">
                </div>
              </div>
            </div>
            <div class="col-12 col-sm-4 col-md-4 col-lg-4">
              <div class="form-group">
                <label for="">Cama &nbsp;</label>
                <i class="fas fa-file-medical-alt"></i> *
                <div class="input-group">
                  <input type="text" name="" id="" class="form-control" placeholder="Ingrese N° HC" required autocomplete="off" autofocus="autofocus">
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="modal-footer justify-content-center">
          <button type="submit" class="btn btn-secondary" id=""><i class="fas fa-save"></i> Seleccionar</button>
          <button type="reset" class="btn btn-danger"><i class="fas fa-eraser"></i> Limpiar</button>
          <button type="button" class="btn btn-default" data-dismiss="modal"><i class="fas fa-times-circle"></i> Salir</button>
        </div>
      </form>
    </div>
  </div>
</div>
<!-- Registrar Atención -->
<!-- Busqueda de cuentas -->
<div id="modal-busqueda-cuenta" class="modal fade" role="dialog" aria-modal="true" style="padding-right: 17px;">
  <div class="modal-dialog">
    <div class="modal-content">
      <form action="" role="form" id="formBusCuenta" method="post">
        <div class="modal-header text-center" style="background: #7EB2C2; color: white">
          <h4 class="modal-title">Búsqueda de Paciente&nbsp; <i class="fas fa-hospital-user"></i></h4>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
        </div>
        <div class="modal-body">
          <div class="row">
            <!-- <div class="col-3">
              <div class="form-group">
                <label for="">N° de Cuenta &nbsp;</label>
                <i class="fas fa-hashtag"></i> *
                <div class="input-group">
                  <input type="text" name="" id="" class="form-control" placeholder="Ingrese N° Cuenta" required autocomplete="off" autofocus="autofocus">
                </div>
              </div>
            </div>
            <div class="col-2" id="btnCuentaPac1">
              <div class="form-group">
                <label>Búsqueda:<span class="text-danger">&nbsp;*</span></label>
                <div class="input-group">
                  <button type="button" class="btn btn-block btn-info" id="btnCuentaPac"><i class="fas fa-search"></i> Consultar</button>
                </div>
              </div>
            </div> -->
          </div>
        </div>
        <div class="modal-footer justify-content-center">
          <button type="button" class="btn btn-secondary" id=""><i class="fas fa-save"></i> Seleccionar</button>
          <button type="button" class="btn btn-default" data-dismiss="modal"><i class="fas fa-times-circle"></i> Salir</button>
        </div>
      </form>
    </div>
  </div>
</div>
<!-- Busqueda de cuentas -->