<?php
class AtencionesControlador
{
    static public function ctrTraerDatosCuenta($IdCuentaAtencion)
    {
        $repuesta = AtencionesModelo::mdlTraerDatosCuenta($IdCuentaAtencion);
        return $repuesta;
    }
    static public function ctrCargarDatosCuenta($IdCuentaAtencion,$IdEpisodio)
    {
        $repuesta = AtencionesModelo::mdlCargarDatosCuenta($IdCuentaAtencion,$IdEpisodio);
        return $repuesta;
    }
    static public function ctrListarAtenciones($item, $valor)
    {
        $rptListAten = AtencionesModelo::mdlListarAtenciones($item, $valor);
        return $rptListAten;
    }
    static public function ctrListarSexo(){
        $rptSexo = AtencionesModelo::mdlListarSexo();
        return $rptSexo;
    }
    static public function ctrListarEstadosPaciente(){
        $rptEstadoPac = AtencionesModelo::mdlListarEstadoPac();
        return $rptEstadoPac;
    }
}
