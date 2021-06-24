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
    // Listar Diagnostico no Seleccionado
    public $existe;
    public function ajaxListarDiagnosticosNoSeleccionado()
    {
        $existeb = $this->existe;
        $datosDiag = DiagnosticosControlador::ctrListarNoSeleccionado($existeb);
        $totalDiag = count($datosDiag);

        if ($totalDiag > 0) {
            $html = "<option value='0'>Seleccione Actividad (Opcional)</option>";
            foreach ($datosDiag as $key => $value) {
                $html .= "<option value='$value[idDiagnostico]'>$value[cieDiagnostico] -  $value[detaDiagnostico]</option>";
            }
        } else {
            $html = "<option value='0'>No hay actividades existentes</option>";
        }

        echo $html;
    }

    // public $existe2;
    // public function ajaxListarDiagnosticosNoSeleccionado2()
    // {
    //     $existeb = $this->existe2;
    //     $datosDiag = DiagnosticosControlador::ctrListarNoSeleccionado($existeb);
    //     $totalDiag = count($datosDiag);

    //     if ($totalDiag > 0) {
    //         $html = "<option value='0'>Seleccione Actividad (Opcional)</option>";
    //         foreach ($datosDiag as $key => $value) {
    //             $html .= "<option value='$value[idDiagnostico]'>$value[cieDiagnostico] -  $value[detaDiagnostico]</option>";
    //         }
    //     } else {
    //         $html = "<option value='0'>No hay actividades existentes</option>";
    //     }

    //     echo $html;
    // }
    // Listar Diagnostico no Seleccionado
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
// Listar Diag no seleccionado
if (isset($_POST["existe"])) {
    $list3 = new ajaxDiagnosticos();
    $list3->existe = $_POST["existe"];
    $list3->ajaxListarDiagnosticosNoSeleccionado();
}
// if (isset($_POST["existe2"])) {
//     $list4 = new ajaxDiagnosticos();
//     $list4->existe2 = $_POST["existe2"];
//     $list4->ajaxListarDiagnosticosNoSeleccionado2();
// }
// Listar Diag no seleccionado