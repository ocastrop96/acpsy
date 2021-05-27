<?php
class ProfesionalesControlador{
    static public function ctrListarProfesionales($item, $valor)
    {
        $rptListProf = ProfesionalesModelo::mdlListarProfesionales($item, $valor);
        return $rptListProf;
    }
}
