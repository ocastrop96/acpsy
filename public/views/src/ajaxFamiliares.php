<?php
require_once "../../../app/controller/FamiliaresControlador.php";
require_once "../../../app/model/FamiliaresModelo.php";

class AjaxFamiliares
{
    public $dato;
    public function ajaxBuscarPaciente()
    {
        $valorTermino = $this->dato;
        $datosTermino = AtencionesControlador::ctrTraerDatosCuenta($valorTermino);
    }
}
