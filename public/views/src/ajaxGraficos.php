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
    public function ajaxCarga10Diag()
    {
        $respuesta = ReportesControlador::ctrListar10Diagnosticos();
        echo json_encode($respuesta);
    }

    public function ajaxCargaMensualSeg()
    {
        $respuesta = ReportesControlador::ctrListarSeguimientosMensual();
        echo json_encode($respuesta);
    }
}

if (isset($_POST["param1"])) {
    $list1 = new AjaxGraficos();
    $list1->ajaxCargaWid();
}
if (isset($_POST["param2"])) {
    $list2 = new AjaxGraficos();
    $list2->ajaxCarga10Diag();
}

if (isset($_POST["param3"])) {
    $list3 = new AjaxGraficos();
    $list3->ajaxCargaMensualSeg();
}
