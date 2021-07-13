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

    public $inicio;
    public $fin;
    public function ajaxAteRegAnu()
    {
        $start = $this->inicio;
        $end = $this->fin;
        $respuesta = ReportesControlador::ctrListarAteRegAnu($start, $end);
        echo json_encode($respuesta);
    }

    public $inicio2;
    public $fin2;
    public function ajaxParentReg()
    {
        $start = $this->inicio2;
        $end = $this->fin2;
        $respuesta = ReportesControlador::ctrListarParentReg($start, $end);
        echo json_encode($respuesta);
    }

    public $inicio3;
    public $fin3;
    public function ajaxSexReg()
    {
        $start = $this->inicio3;
        $end = $this->fin3;
        $respuesta = ReportesControlador::ctrListarSexReg($start, $end);
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
if (isset($_POST["param4"])) {
    $list4 = new AjaxGraficos();
    $list4->inicio = $_POST["inicio"];
    $list4->fin = $_POST["fin"];
    $list4->ajaxAteRegAnu();
}

if (isset($_POST["param5"])) {
    $list5 = new AjaxGraficos();
    $list5->inicio2 = $_POST["inicio"];
    $list5->fin2 = $_POST["fin"];
    $list5->ajaxParentReg();
}

if (isset($_POST["param6"])) {
    $list6 = new AjaxGraficos();
    $list6->inicio3 = $_POST["inicio"];
    $list6->fin3 = $_POST["fin"];
    $list6->ajaxSexReg();
}
