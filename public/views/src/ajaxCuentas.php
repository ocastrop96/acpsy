<?php
require_once "../../../app/controller/AtencionesControlador.php";
require_once "../../../app/model/AtencionesModel.php";

class ajaxDatosCuenta
{
    public $dato;
    public $filtro;
    public function ajaxListarDatosCuenta()
    {
        $datob = $this->dato;
        $filtrob = $this->filtro;
        $datosCuenta = AtencionesControlador::ctrTraerDatosCuenta($filtrob, $datob);
        $totalData = count($datosCuenta);
        if ($totalData > 0) {
            $data = "";
            foreach ($datosCuenta as $key => $value) {
                $data .= "<div class='card card-olive'>
                    <div class='card-header'>
                        <h3 class='card-title'>Datos de Atención N° " . ($key + 1) . "</h3>
                    </div>
                    <div class='card-body'>
                        <div class='row'>
                            <div class='col-12 col-sm-3 col-md-2 col-lg-2'><strong>
                                    <i class='fas fa-hashtag mr-1'></i> N° Cuenta</strong>
                            </div>
                            <div class='col-12 col-sm-3 col-md-2 col-lg-2'>
                                <p class='text-muted'>$value[IdCuentaAtencion]</p>
                            </div>
                            <div class='col-12 col-sm-4 col-md-3 col-lg-3'><strong>
                                    <i class='fas fa-book mr-1'></i> N° Historia Clínica</strong>
                            </div>
                            <div class='col-12 col-sm-3 col-md-2 col-lg-2'>
                                <p class='text-muted'>$value[NroHistoriaClinica]</p>
                            </div>
                        </div>
                        <hr>
                        <div class='row'>
                            <div class='col-12 col-sm-3 col-md-2 col-lg-2'><strong>
                                    <i class='fas fa-hashtag mr-1'></i> N° Doc</strong>
                            </div>
                            <div class='col-12 col-sm-4 col-md-3 col-lg-3'>
                                <p class='text-muted'>$value[DescripcionAbrev]-$value[NroDocumento]</p>
                            </div>
                            <div class='col-12 col-sm-12 col-md-3 col-lg-3'><strong>
                                    <i class='fas fa-book mr-1'></i> Fecha de Ingreso</strong>
                            </div>
                            <div class='col-12 col-sm-4 col-md-3 col-lg-3'>
                                <p class='text-muted'>$value[FechaIngreso]</p>
                            </div>
                        </div>
                        <hr>
                        <strong><i class='fas fa-hospital-user mr-1'></i> Paciente</strong>
                        <p class='text-muted'>$value[PrimerNombre] $value[SegundoNombre] $value[TercerNombre] $value[ApellidoPaterno] $value[ApellidoMaterno]</p>
                        <hr>
                        <strong><i class='fas fa-hospital-alt mr-1'></i> Servicio Ingreso</strong>
                        <p class='text-muted'>$value[Nombre] - $value[TIPO_SERVICIO]</p>
                    </div>
                    <div class='card-footer'>
                        <button type='button' class='btn btn-info btn-block border-5' id='btncarga1' onclick='ValidarCuentaExistente($value[IdCuentaAtencion])'><i class='fas fa-sync-alt'></i> &nbsp; Cargar Datos</button>
                    </div>
                </div>";
            }
            $data .= "";
        } else {
            $data = "<div class='alert alert-warning alert-dismissible'>
                <button type='button' class='close' data-dismiss='alert' aria-hidden='true'>×</button>
                <h5 class='font-weight-bold'><i class='icon fas fa-exclamation-triangle'></i> ¡Datos no encontrados!</h5>
                No se encontró data relacionada a la cuenta ingresada.
            </div>";
        }
        echo $data;
    }
    
    public $idCuenta2;
    public function ajaxCargarDatosCuenta()
    {
        $valor = $this->idCuenta2;
        $respuesta = AtencionesControlador::ctrCargarDatosCuenta($valor);
        echo json_encode($respuesta);
    }
}
if (isset($_POST["dato"])) {
    $list1 = new ajaxDatosCuenta();
    $list1->dato = $_POST["dato"];
    $list1->filtro = $_POST["filtro"];
    $list1->ajaxListarDatosCuenta();
}
if (isset($_POST["idCuenta"])) {
    $list2 = new ajaxDatosCuenta();
    $list2->idCuenta2 = $_POST["idCuenta"];
    $list2->ajaxCargarDatosCuenta();
}
