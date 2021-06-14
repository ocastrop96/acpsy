<div class='card card-olive'>
    <div class='card-header'>
        <h3 class='card-title'>Datos de Cuenta</h3>
    </div>
    <div class='card-body'>
        <div class='row'>
            <div class='col-12 col-sm-3 col-md-2 col-lg-2'><strong>
                    <i class='fas fa-hashtag mr-1'></i> N° Episodio</strong>
            </div>
            <div class='col-12 col-sm-3 col-md-2 col-lg-2'>
                <p class='text-muted'>E-101795</p>
            </div>
            <div class='col-12 col-sm-4 col-md-3 col-lg-3'><strong>
                    <i class='fas fa-book mr-1'></i> N° Historia Clínica</strong>
            </div>
            <div class='col-12 col-sm-3 col-md-2 col-lg-2'>
                <p class='text-muted'>1337232</p>
            </div>
        </div>
        <hr>
        <div class='row'>
            <div class='col-12 col-sm-3 col-md-2 col-lg-2'><strong>
                    <i class='fas fa-hashtag mr-1'></i> N° Doc</strong>
            </div>
            <div class='col-12 col-sm-4 col-md-3 col-lg-3'>
                <p class='text-muted'>DNI-70011740</p>
            </div>
            <div class='col-12 col-sm-12 col-md-3 col-lg-3'><strong>
                    <i class='fas fa-book mr-1'></i> Fecha de Ingreso</strong>
            </div>
            <div class='col-12 col-sm-4 col-md-3 col-lg-3'>
                <p class='text-muted'>26/05/2021</p>
            </div>
        </div>
        <hr>
        <strong><i class='fas fa-hospital-user mr-1'></i> Paciente</strong>
        <p class='text-muted'>ARTURO RONALD GALLARDO ANGULO</p>
        <hr>
        <strong><i class='fas fa-hospital-alt mr-1'></i> Servicio Ingreso</strong>
        <p class='text-muted'>CORONAVIRUS</p>
        <hr>
        <div class='row'>
            <div class='col-12 col-sm-4 col-md-3 col-lg-3'><strong>
                    <i class='fas fa-user-injured mr-1'></i> Estado Paciente</strong>
            </div>
            <div class='col-12 col-sm-4 col-md-3 col-lg-3'>
                <p class='text-muted'>HOSPITALIZADO</p>
            </div>
        </div>
    </div>
    <div class='card-footer'>
        <button type='button' class='btn btn-success btn-block border-5' idCuenta='' idEpisodio='' onclick='seleccionarAtencion()'><i class='fas fa-sync-alt'></i> &nbsp; Cargar Datos</button>
    </div>
</div>

<div class='alert alert-warning alert-dismissible'>
    <button type='button' class='close' data-dismiss='alert' aria-hidden='true'>×</button>
    <h5 class='font-weight-bold'><i class='icon fas fa-exclamation-triangle'></i> ¡Datos no encontrados!</h5>
    No se encontró data relacionada a la cuenta ingresada.
</div>



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
                  <select class="form-control" id="rgfTdoc" class="rgfTdoc">
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
      </form>
    </div>
  </div>
</div>