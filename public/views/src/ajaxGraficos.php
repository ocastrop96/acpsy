<?php
require_once "../../../app/controller/ReportesControlador.php";
require_once "../../../app/model/ReportesModelo.php";


class AjaxGraficos
{
    public function ajaxCargaWid()
    {
        $respuesta = ReportesControlador::ctrListarWidgets();
        echo json_encode($respuesta);
    }
}


$list1 = new AjaxGraficos();
$list1->ajaxCargaWid();
