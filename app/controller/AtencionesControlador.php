<?php
class AtencionesControlador
{
    static public function ctrTraerDatosCuenta($IdCuentaAtencion)
    {
        $repuesta = AtencionesModelo::mdlTraerDatosCuenta($IdCuentaAtencion);
        return $repuesta;
    }
}
