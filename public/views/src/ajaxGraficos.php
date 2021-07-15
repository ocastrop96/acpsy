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

    public $inicio4;
    public $fin4;
    public function ajaxSegRegs()
    {
        $start = $this->inicio4;
        $end = $this->fin4;
        $respuesta = ReportesControlador::ctrListarSegRegs($start, $end);
        echo json_encode($respuesta);
    }

    public $inicio5;
    public $fin5;
    public $profesional;

    public function ajaxSeguixProfesional()
    {
        $start = $this->inicio5;
        $end = $this->fin5;
        $profesional = $this->profesional;
        $respuesta = ReportesControlador::ctrListarSeguixProfesional($start, $end, $profesional);
        echo json_encode($respuesta);
    }

    public $inicio6;
    public $fin6;
    public $profesional1;

    public function ajaxSeguixTipo()
    {
        $start = $this->inicio6;
        $end = $this->fin6;
        $profesional = $this->profesional1;
        $respuesta = ReportesControlador::ctrListarSeguixTipo($start, $end, $profesional);
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

if (isset($_POST["param7"])) {
    $list7 = new AjaxGraficos();
    $list7->inicio4 = $_POST["inicio"];
    $list7->fin4 = $_POST["fin"];
    $list7->ajaxSegRegs();
}

if (isset($_POST["param8"])) {
    $list8 = new AjaxGraficos();
    $list8->inicio5 = $_POST["inicio"];
    $list8->fin5 = $_POST["fin"];
    $list8->profesional = $_POST["profesional"];
    $list8->ajaxSeguixProfesional();
}
if (isset($_POST["param9"])) {
    $list9 = new AjaxGraficos();
    $list9->inicio6 = $_POST["inicio"];
    $list9->fin6 = $_POST["fin"];
    $list9->profesional1 = $_POST["profesional"];
    $list9->ajaxSeguixTipo();
}
