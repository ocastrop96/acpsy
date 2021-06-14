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
        <input type="hidden" value="<?php echo $_SESSION["loginId"]; ?>" id="idUsFam">
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
                <label for="rgfAtencion">PACIENTE &nbsp;</label>
                <i class="fas fa-hospital-user"></i> *
                <select class="form-control" style="width: 100%;" id="rgfAtencion" name="rgfAtencion">
                  <option value="0">Ingrese apellidos o N° de cuenta de Paciente</option>
                </select>
                <input type="hidden" name="idAtencion" id="idAtencion">
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-3">
              <div class="form-group">
                <label for="rgfTdoc">Tipo Doc &nbsp;</label>
                <i class="fas fa-hashtag"></i> *
                <div class="input-group">
                  <select class="form-control" id="rgfTdoc" name="rgfTdoc">
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
                <label for="rgfNdoc">N° Doc &nbsp;</label>
                <i class="fas fa-hashtag"></i> *
                <div class="input-group">
                  <input type="text" name="rgfNdoc" id="rgfNdoc" class="form-control" placeholder="Ingrese N° Doc" required autocomplete="off" autofocus="autofocus">
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
          </div>
          <div class="row">
            <div class="col-9">
              <div class="form-group">
                <label for="rgfNomAp">Nombres y Apellidos de Familiar &nbsp;</label>
                <i class="fas fa-signature"></i> *
                <div class="input-group">
                  <input type="text" name="rgfNomAp" id="rgfNomAp" class="form-control" placeholder="Ingrese Nombres y Apellidos de Familiar" required autocomplete="off" autofocus="autofocus">
                </div>
              </div>
            </div>
            <div class="col-3">
              <div class="form-group">
                <label for="rgfSexo">Sexo &nbsp;</label>
                <i class="fas fa-venus-mars"></i> *
                <div class="input-group">
                  <select class="form-control" id="rgfSexo" name="rgfSexo">
                    <option value="0">Seleccione Sexo</option>
                    <?php
                    $sexFam = AtencionesControlador::ctrListarSexo();
                    foreach ($sexFam as $key => $value) {
                      echo '<option value="' . $value["idTipSexo"] . '">' . $value["detaTipSexo"] . '</option>';
                    }
                    ?>
                  </select>
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-4">
              <div class="form-group">
                <label for="rgfParent">Parentesco &nbsp;</label>
                <i class="fas fa-users"></i> *
                <div class="input-group">
                  <select class="form-control" name="rgfParent" id="rgfParent">
                    <option value="0">Seleccione Parentesco</option>
                    <?php
                    $parentesco = FamiliaresControlador::ctrListarParentesco();
                    foreach ($parentesco as $key => $value) {
                      echo '<option value="' . $value["idParentesco"] . '">' . $value["detaParentesco"] . '</option>';
                    }
                    ?>
                  </select>
                </div>
              </div>
            </div>
            <div class="col-3">
              <div class="form-group">
                <label for="rgfEdad">Edad Familiar &nbsp;</label>
                <i class="fas fa-id-card-alt"></i> *
                <div class="input-group">
                  <input type="text" name="rgfEdad" id="rgfEdad" class="form-control" placeholder="Ingrese edad" required autocomplete="off" autofocus="autofocus">
                </div>
              </div>
            </div>
            <div class="col-4">
              <div class="form-group">
                <label for="rgfTel">N° Teléfono o Celular &nbsp;</label>
                <i class="fas fa-phone"></i>&nbsp;<i class="fas fa-mobile-alt"></i> *
                <div class="input-group">
                  <input type="text" name="rgfTel" id="rgfTel" class="form-control" placeholder="Ingrese Tel/Cel" required autocomplete="off" autofocus="autofocus">
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="modal-footer justify-content-center">
          <button type="submit" class="btn btn-secondary" id="btnRegFam"><i class="fas fa-save"></i> Guardar</button>
          <button type="reset" class="btn btn-danger"><i class="fas fa-eraser"></i> Limpiar</button>
          <button type="button" class="btn btn-default" data-dismiss="modal"><i class="fas fa-times-circle"></i> Salir</button>
        </div>
        <?php
        $regFamiliar = new FamiliaresControlador();
        $regFamiliar->ctrRegistrarFamiliar();
        ?>
      </form>
    </div>
  </div>
</div>
<!-- Registrar Familiar -->