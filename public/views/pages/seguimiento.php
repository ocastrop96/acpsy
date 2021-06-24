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
              <th>N°Doc</th>
              <th>Nombres Paciente</th>
              <th>Tipo</th>
              <th>Profesional</th>
              <th style="width: 10px">¿Comunicación con familiar?</th>
              <th>Nombres Familiar</th>
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
          <h6 class="font-weight-bold">1. Tipo de Seguimiento y Personal de Salud. &nbsp;<i class="fas fa-hospital-user"></i></h6>
          <hr>
          <div class="row">
            <div class="col-12 col-sm-6 col-md-6 col-lg-6">
              <div class="form-group">
                <label for="rgSegTip">Tipo de Seguimiento: &nbsp;</label>
                <i class="fas fa-indent"></i> *
                <div class="input-group">
                  <select class="form-control" id="rgSegTip" name="rgSegTip">
                    <option value="0">Seleccione Tipo de Seguimiento</option>
                    <?php
                    $tipSeg = SeguimientosControlador::ctrListarTipoSeguimiento();
                    foreach ($tipSeg as $key => $value) {
                      echo '<option value="' . $value["idTipoSeguimiento"] . '">' . $value["detaTipSeguimiento"] . '</option>';
                    }
                    ?>
                  </select>
                </div>
              </div>
            </div>
            <div class="col-12 col-sm-6 col-md-6 col-lg-6">
              <div class="form-group">
                <label for="rgSegProf">Profesional que atiende: &nbsp;</label>
                <i class="fas fa-user-md"></i> *
                <div class="input-group">
                  <select class="form-control" id="rgSegProf" name="rgSegProf">
                    <option value="<?php echo $_SESSION["loginIdProf"]; ?>"><?php echo $_SESSION["loginNombProf"]; ?></option>
                  </select>
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-12 col-sm-6 col-md-6 col-lg-6">
              <div class="form-group">
                <label for="rgSegEta">Etapa : &nbsp;</label>
                <i class="fab fa-usps"></i> *
                <div class="input-group">
                  <select class="form-control" id="rgSegEta" name="rgSegEta">
                  <option value="0">Seleccione Etapa</option>
                    <?php
                    $etaSeg = SeguimientosControlador::ctrListarEtapaSeguimiento();
                    foreach ($etaSeg as $key => $value) {
                      echo '<option value="' . $value["idEtapSegui"] . '">' . $value["detaEtapSegui"] . '</option>';
                    }
                    ?>
                  </select>
                </div>
              </div>
            </div>
            <div class="col-12 col-sm-6 col-md-6 col-lg-6">
              <div class="form-group">
                <label for="rgSegMot">Motivo: &nbsp;</label>
                <i class="fas fa-book-medical"></i> *
                <div class="input-group">
                  <select class="form-control" id="rgSegMot" name="rgSegMot">
                    <option value="0">Seleccione Motivo</option>
                    <?php
                    $motSeg = SeguimientosControlador::ctrListarMotivoSeguimiento();
                    foreach ($motSeg as $key => $value) {
                      echo '<option value="' . $value["idMotSeguimiento"] . '">' . $value["detaMotivoSef"] . '</option>';
                    }
                    ?>
                  </select>
                </div>
              </div>
            </div>
          </div>
          <h6 class="font-weight-bold">2. Datos del paciente en seguimiento. &nbsp;<i class="fas fa-user-injured"></i></h6>
          <hr>
          <div class="row">
            <div class="col-12">
              <div class="form-group">
                <label for="rgSegPac">Paciente &nbsp;</label>
                <i class="fas fa-hospital-user"></i> *
                <div class="input-group">
                  <select class="form-control" style="width: 100%;" id="rgSegPac" name="rgSegPac">
                    <option value="0">Ingrese apellidos, N° DNI o HC del paciente</option>
                  </select>
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-12">
              <div class="form-group">
                <label for="rgSegDp1">Diagnóstico 1: <span class="text-danger">&nbsp;*</span></label>
                <i class="fas fa-stethoscope"></i>
                <div class="input-group">
                  <select class="form-control" id="rgSegDp1" name="rgSegDp1">
                    <option value="0">Seleccione Diagnóstico 1</option>
                    <?php
                    $item = null;
                    $val = null;
                    $diag1 = DiagnosticosControlador::ctrListarDiagnosticos($item, $val);
                    foreach ($diag1 as $key => $value) {
                      echo '<option value="' . $value["idDiagnostico"] . '">' . $value["cieDiagnostico"] . ' - ' . $value["detaDiagnostico"] . '</option>';
                    }
                    ?>
                  </select>
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-12">
              <div class="form-group">
                <label for="rgSegDp2">Actividad (OPCIONAL): &nbsp;</label>
                <i class="fas fa-stethoscope"></i>
                <div class="input-group">
                  <select class="form-control" id="rgSegDp2" name="rgSegDp2">
                    <option value="0">Seleccione Actividad (Opcional)</option>
                  </select>
                </div>
              </div>
            </div>
          </div>
          <div id="bloqueComFam" class="d-none">
            <h6 class="font-weight-bold">3. Comunicación con familiar. &nbsp;<i class="fas fa-hands-helping"></i></h6>
            <hr>
            <div class="row">
              <div class="col-12 col-sm-12 col-md-12 col-lg-6 col-xl-6">
                <label for="comFam">¿Se realiza comunicación con familiar?</label>
              </div>
              <div class="col-12 col-sm-12 col-md-12 col-lg-6 col-xl-6">
                <div class="input-group clearfix">
                  <div class="icheck-dark d-inline">
                    <input type="radio" id="comSi" name="comunicaFamilia" value="SI">
                    <label for="comSi">
                      SI
                    </label>
                  </div>
                  <div class="icheck-dark d-inline">
                    &nbsp;
                    <input type="radio" id="comNo" name="comunicaFamilia" value="NO" checked="">
                    <label for="comNo">
                      NO
                    </label>
                  </div>
                </div>
                <input type="hidden" name="comFami" id="comFami" value="SI">
              </div>
            </div>
            <hr>
            <div id="block1">
              <div class="row">
                <div class="col-12">
                  <div class="form-group">
                    <label for="rgSegFam">Familiar del Paciente: <span class="text-danger">&nbsp;*</span></label>
                    <i class="fas fa-chalkboard-teacher"></i>
                    <div class="input-group">
                      <select class="form-control" id="rgSegFam" name="rgSegFam">
                        <option value="0">Seleccione Familiar</option>
                      </select>
                    </div>
                  </div>
                </div>
              </div>
              <div class="row">
                <div class="col-12">
                  <div class="form-group">
                    <label for="rgSegDf1">Diagnóstico 1: <span class="text-danger">&nbsp;*</span></label>
                    <i class="fas fa-stethoscope"></i>
                    <div class="input-group">
                      <select class="form-control" id="rgSegDf1" name="rgSegDf1">
                        <option value="0">Seleccione Diagnóstico 1</option>
                        <?php
                        $item = null;
                        $val = null;
                        $diagf1 = DiagnosticosControlador::ctrListarDiagnosticos($item, $val);
                        foreach ($diagf1 as $key => $value) {
                          echo '<option value="' . $value["idDiagnostico"] . '">' . $value["cieDiagnostico"] . ' - ' . $value["detaDiagnostico"] . '</option>';
                        }
                        ?>
                      </select>
                    </div>
                  </div>
                </div>
              </div>
              <div class="row">
                <div class="col-12">
                  <div class="form-group">
                    <label for="rgSegDf2">Actividad (OPCIONAL): &nbsp;</label>
                    <i class="fas fa-stethoscope"></i>
                    <div class="input-group">
                      <select class="form-control" id="rgSegDf2" name="rgSegDf2">
                        <option value="0">Seleccione Actividad (Opcional)</option>
                      </select>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="modal-footer justify-content-center">
          <button type="submit" class="btn btn-secondary" id="btnRegSeg"><i class="fas fa-save"></i> Registrar</button>
          <button type="reset" class="btn btn-danger"><i class="fas fa-eraser"></i> Limpiar</button>
          <button type="button" class="btn btn-default" data-dismiss="modal"><i class="fas fa-times-circle"></i> Salir</button>
        </div>
      </form>
    </div>
  </div>
</div>
<!-- Registrar Seguimiento -->
<!-- Editar Seguimiento -->
<div id="modal-editar-seguimiento" class="modal fade" role="dialog" aria-modal="true" style="padding-right: 17px;">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <form action="" role="form" id="formEdtSeg" method="post">
        <div class="modal-header text-center" style="background: #5D646C; color: white">
          <h4 class="modal-title">Editar Seguimiento&nbsp; <i class="fas fa-diagnoses"></i></h4>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
        </div>
        <!-- <div class="modal-body">
          <h6 class="font-weight-bold">1. Tipo de Seguimiento y Personal de Salud. &nbsp;<i class="fas fa-hospital-user"></i></h6>
          <hr>
          <div class="row">
            <div class="col-12 col-sm-6 col-md-6 col-lg-6">
              <div class="form-group">
                <label for="rgSegTip">Tipo de Seguimiento: &nbsp;</label>
                <i class="fas fa-indent"></i> *
                <div class="input-group">
                  <select class="form-control" id="rgSegTip" name="rgSegTip">
                    <option value="0">Seleccione Tipo de Seguimiento</option>
                    <?php
                    $tipSeg = SeguimientosControlador::ctrListarTipoSeguimiento();
                    foreach ($tipSeg as $key => $value) {
                      echo '<option value="' . $value["idTipoSeguimiento"] . '">' . $value["detaTipSeguimiento"] . '</option>';
                    }
                    ?>
                  </select>
                </div>
              </div>
            </div>
            <div class="col-12 col-sm-6 col-md-6 col-lg-6">
              <div class="form-group">
                <label for="rgSegProf">Profesional que atiende: &nbsp;</label>
                <i class="fas fa-user-md"></i> *
                <div class="input-group">
                  <select class="form-control" id="rgSegProf" name="rgSegProf">
                    <option value="<?php echo $_SESSION["loginIdProf"]; ?>"><?php echo $_SESSION["loginNombProf"]; ?></option>
                  </select>
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-12 col-sm-6 col-md-6 col-lg-6">
              <div class="form-group">
                <label for="rgSegEta">Etapa : &nbsp;</label>
                <i class="fab fa-usps"></i> *
                <div class="input-group">
                  <select class="form-control" id="rgSegEta" name="rgSegEta">
                  <option value="0">Seleccione Etapa</option>
                    <?php
                    $etaSeg = SeguimientosControlador::ctrListarEtapaSeguimiento();
                    foreach ($etaSeg as $key => $value) {
                      echo '<option value="' . $value["idEtapSegui"] . '">' . $value["detaEtapSegui"] . '</option>';
                    }
                    ?>
                  </select>
                </div>
              </div>
            </div>
            <div class="col-12 col-sm-6 col-md-6 col-lg-6">
              <div class="form-group">
                <label for="rgSegMot">Motivo: &nbsp;</label>
                <i class="fas fa-book-medical"></i> *
                <div class="input-group">
                  <select class="form-control" id="rgSegMot" name="rgSegMot">
                    <option value="0">Seleccione Motivo</option>
                    <?php
                    $motSeg = SeguimientosControlador::ctrListarMotivoSeguimiento();
                    foreach ($motSeg as $key => $value) {
                      echo '<option value="' . $value["idMotSeguimiento"] . '">' . $value["detaMotivoSef"] . '</option>';
                    }
                    ?>
                  </select>
                </div>
              </div>
            </div>
          </div>
          <h6 class="font-weight-bold">2. Datos del paciente en seguimiento. &nbsp;<i class="fas fa-user-injured"></i></h6>
          <hr>
          <div class="row">
            <div class="col-12">
              <div class="form-group">
                <label for="rgSegPac">Paciente &nbsp;</label>
                <i class="fas fa-hospital-user"></i> *
                <div class="input-group">
                  <select class="form-control" style="width: 100%;" id="rgSegPac" name="rgSegPac">
                    <option value="0">Ingrese apellidos, N° DNI o HC del paciente</option>
                  </select>
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-12">
              <div class="form-group">
                <label for="rgSegDp1">Diagnóstico 1: <span class="text-danger">&nbsp;*</span></label>
                <i class="fas fa-stethoscope"></i>
                <div class="input-group">
                  <select class="form-control" id="rgSegDp1" name="rgSegDp1">
                    <option value="0">Seleccione Diagnóstico 1</option>
                    <?php
                    $item = null;
                    $val = null;
                    $diag1 = DiagnosticosControlador::ctrListarDiagnosticos($item, $val);
                    foreach ($diag1 as $key => $value) {
                      echo '<option value="' . $value["idDiagnostico"] . '">' . $value["cieDiagnostico"] . ' - ' . $value["detaDiagnostico"] . '</option>';
                    }
                    ?>
                  </select>
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-12">
              <div class="form-group">
                <label for="rgSegDp2">Actividad (OPCIONAL): &nbsp;</label>
                <i class="fas fa-stethoscope"></i>
                <div class="input-group">
                  <select class="form-control" id="rgSegDp2" name="rgSegDp2">
                    <option value="0">Seleccione Actividad (Opcional)</option>
                  </select>
                </div>
              </div>
            </div>
          </div>
          <div id="bloqueComFam" class="d-none">
            <h6 class="font-weight-bold">3. Comunicación con familiar. &nbsp;<i class="fas fa-hands-helping"></i></h6>
            <hr>
            <div class="row">
              <div class="col-12 col-sm-12 col-md-12 col-lg-6 col-xl-6">
                <label for="comFam">¿Se realiza comunicación con familiar?</label>
              </div>
              <div class="col-12 col-sm-12 col-md-12 col-lg-6 col-xl-6">
                <div class="input-group clearfix">
                  <div class="icheck-dark d-inline">
                    <input type="radio" id="comSi" name="comunicaFamilia" value="SI">
                    <label for="comSi">
                      SI
                    </label>
                  </div>
                  <div class="icheck-dark d-inline">
                    &nbsp;
                    <input type="radio" id="comNo" name="comunicaFamilia" value="NO" checked="">
                    <label for="comNo">
                      NO
                    </label>
                  </div>
                </div>
                <input type="hidden" name="comFami" id="comFami" value="SI">
              </div>
            </div>
            <hr>
            <div id="block1">
              <div class="row">
                <div class="col-12">
                  <div class="form-group">
                    <label for="rgSegFam">Familiar del Paciente: <span class="text-danger">&nbsp;*</span></label>
                    <i class="fas fa-chalkboard-teacher"></i>
                    <div class="input-group">
                      <select class="form-control" id="rgSegFam" name="rgSegFam">
                        <option value="0">Seleccione Familiar</option>
                      </select>
                    </div>
                  </div>
                </div>
              </div>
              <div class="row">
                <div class="col-12">
                  <div class="form-group">
                    <label for="rgSegDf1">Diagnóstico 1: <span class="text-danger">&nbsp;*</span></label>
                    <i class="fas fa-stethoscope"></i>
                    <div class="input-group">
                      <select class="form-control" id="rgSegDf1" name="rgSegDf1">
                        <option value="0">Seleccione Diagnóstico 1</option>
                        <?php
                        $item = null;
                        $val = null;
                        $diagf1 = DiagnosticosControlador::ctrListarDiagnosticos($item, $val);
                        foreach ($diagf1 as $key => $value) {
                          echo '<option value="' . $value["idDiagnostico"] . '">' . $value["cieDiagnostico"] . ' - ' . $value["detaDiagnostico"] . '</option>';
                        }
                        ?>
                      </select>
                    </div>
                  </div>
                </div>
              </div>
              <div class="row">
                <div class="col-12">
                  <div class="form-group">
                    <label for="rgSegDf2">Actividad (OPCIONAL): &nbsp;</label>
                    <i class="fas fa-stethoscope"></i>
                    <div class="input-group">
                      <select class="form-control" id="rgSegDf2" name="rgSegDf2">
                        <option value="0">Seleccione Actividad (Opcional)</option>
                      </select>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div> -->
        <div class="modal-footer justify-content-center">
          <button type="submit" class="btn btn-secondary" id="btnEdtSeg"><i class="fas fa-sync"></i> Actualizar</button>
          <button type="button" class="btn btn-default" data-dismiss="modal"><i class="fas fa-times-circle"></i> Salir</button>
        </div>
      </form>
    </div>
  </div>
</div>
<!-- Editar Seguimiento -->