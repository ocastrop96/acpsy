<?php
class FamiliaresControlador
{
    static public function ctrListarFamiliares($item, $valor)
    {
        $rptListFam = FamiliaresModelo::mdlListarFamiliares($item, $valor);
        return $rptListFam;
    }

    static public function ctrListarPaciente($dato)
    {
        $rptBuscarPac = FamiliaresModelo::mdlListarPaciente($dato);
        return $rptBuscarPac;
    }
}
