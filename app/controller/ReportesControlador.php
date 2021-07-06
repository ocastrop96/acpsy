<?php
class ReportesControlador
{
    static public function ctrListarWidgets()
    {
        $repuesta = ReportesModelo::mdlListarWidgets();
        return $repuesta;
    }

    static public function ctrListar10Diagnosticos()
    {
        $repuesta = ReportesModelo::mdlListar10Diagnosticos();
        return $repuesta;
    }
    static public function ctrListarSeguimientosMensual()
    {
        $repuesta = ReportesModelo::mdlListarSeguimientos();
        return $repuesta;
    }
}
