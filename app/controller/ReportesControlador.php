<?php
class ReportesControlador
{
    static public function ctrListarWidgets()
    {
        $repuesta = ReportesModelo::mdlListarWidgets();
        return $repuesta;
    }
}
