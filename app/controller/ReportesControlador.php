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

    static public function ctrListarAteRegAnu($inicio, $fin)
    {
        $repuesta = ReportesModelo::mdlListarAteRegAnu($inicio, $fin);
        return $repuesta;
    }

    static public function ctrListarParentReg($inicio, $fin)
    {
        $repuesta = ReportesModelo::mdlListarParentReg($inicio, $fin);
        return $repuesta;
    }
    static public function ctrListarSexReg($inicio, $fin)
    {
        $repuesta = ReportesModelo::mdlListarSexReg($inicio, $fin);
        return $repuesta;
    }
}
