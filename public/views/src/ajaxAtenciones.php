<?php
require_once "../../../app/controller/AtencionesControlador.php";
require_once "../../../app/controller/SeguimientosControlador.php";
require_once "../../../app/model/AtencionesModel.php";
require_once "../../../app/model/SeguimientosModelo.php";


class ajaxAtenciones
{
    // Listar Atención
    public $idAtencion;
    public function ajaxListarAtencion()
    {
        $item = "idAtencion";
        $valor = $this->idAtencion;
        $respuesta = AtencionesControlador::ctrListarAtenciones($item, $valor);
        echo json_encode($respuesta);
    }
    // Listar Atención
    // Validar Cuenta existente
    public $validaCuenta;
    public function ajaxValidarCuenta()
    {
        $item = "cuentaAtencion";
        $valor = $this->validaCuenta;
        $respuesta = AtencionesControlador::ctrListarAtenciones($item, $valor);
        echo json_encode($respuesta);
    }
    // Validar Cuenta existente
    // Listar Historial Pacientes
    // Listar Historial Pacientes
    public $idPac;
    public function ajaxHistorialPac()
    {
        $valor = $this->idPac;
        $datosPac = SeguimientosControlador::ctrListarrHistorialAtencion($valor);
        $totalData = count($datosPac);
        if ($totalData > 0) {
            $data = "<div class='alert alert-success alert-dismissible'>
            <button type='button' class='close' data-dismiss='alert' aria-hidden='true'>×</button>
            <h5 class='font-weight-bold'><i class='icon fas fa-exclamation-triangle'></i> ÉXITO</h5>
            INFORMACIÓN ENCONTRADA.
        </div>";
        } else {
            $data = "<div class='alert alert-danger alert-dismissible'>
            <button type='button' class='close' data-dismiss='alert' aria-hidden='true'>×</button>
            <h5 class='font-weight-bold'><i class='icon fas fa-exclamation-triangle'></i> ¡Datos no encontrados!</h5>
            No se encontró data relacionada al N° de DNI o Historia ingresados.
        </div>";
        }
        echo $data;
    }
}
// Listar Atención
if (isset($_POST["idAtencion"])) {
    $list1 = new ajaxAtenciones();
    $list1->idAtencion = $_POST["idAtencion"];
    $list1->ajaxListarAtencion();
}
// Listar Atención
// Valida cuenta
if (isset($_POST["cuentaAtencion"])) {
    $valida1 = new ajaxAtenciones();
    $valida1->validaCuenta = $_POST["cuentaAtencion"];
    $valida1->ajaxValidarCuenta();
}
// ValidaCuenta

// Listar Historial Pacientes
if (isset($_POST["idPac"])) {
    $valida12 = new ajaxAtenciones();
    $valida12->idPac = $_POST["idPac"];
    $valida12->ajaxHistorialPac();
}
// Listar Historial Pacientes