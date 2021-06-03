<?php
require_once "../../../app/controller/DiagnosticosControlador.php";
require_once "../../../app/model/DiagnosticosModelo.php";

class ajaxDiagnosticos
{
    // Validar CIE repetido
    public $validarCie;
    public function ajaxCIERepetido()
    {
        $item = "cieDiagnostico";
        $valor = $this->validarCie;
        $respuesta = DiagnosticosControlador::ctrListarDiagnosticos($item, $valor);
        echo json_encode($respuesta);
    }
    // Validar CIE repetido
    // Listar Diagnosticos
    public $idDiagnostico;
    public function ajaxListarDiagnosticos()
    {
        $item = "idDiagnostico";
        $valor = $this->idDiagnostico;
        $respuesta = DiagnosticosControlador::ctrListarDiagnosticos($item, $valor);
        echo json_encode($respuesta);
    }
    // Listar Diagnosticos
}
// Validar CIE repetido
if (isset($_POST["validarCie"])) {
    $validar = new ajaxDiagnosticos();
    $validar->validarCie = $_POST["validarCie"];
    $validar->ajaxCIERepetido();
}
// Validar CIE repetido
// Listar Diagnosticos
if (isset($_POST["idDiagnostico"])) {
    $list1 = new ajaxDiagnosticos();
    $list1->idDiagnostico = $_POST["idDiagnostico"];
    $list1->ajaxListarDiagnosticos();
}
// Listar Diagnosticos