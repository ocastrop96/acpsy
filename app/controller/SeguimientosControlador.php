<?php
class SeguimientosControlador
{
    static public function ctrListarSeguimientos($item, $valor)
    {
        $rptListSeg = SeguimientosModelo::mdlListarSeguimientos($item, $valor);
        return $rptListSeg;
    }
    static public function ctrListarTipoSeguimiento()
    {
        $rptSexo = SeguimientosModelo::mdlListarTiposSeguimiento();
        return $rptSexo;
    }
    static public function ctrListarMotivoSeguimiento()
    {
        $rptSexo = SeguimientosModelo::mdlListarMotivoSeguimiento();
        return $rptSexo;
    }
    static public function ctrListarEtapaSeguimiento()
    {
        $rptSexo = SeguimientosModelo::mdlListarEtapaSeguimiento();
        return $rptSexo;
    }
}