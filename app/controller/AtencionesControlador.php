<?php
class AtencionesControlador
{
    static public function ctrTraerDatosCuenta($IdCuentaAtencion)
    {
        $repuesta = AtencionesModelo::mdlTraerDatosCuenta($IdCuentaAtencion);
        return $repuesta;
    }
    static public function ctrListarAtenciones($item, $valor)
    {
        $rptListAten = AtencionesModelo::mdlListarAtenciones($item, $valor);
        return $rptListAten;
    }
}
