<?php
// Controladores
require_once "./app/controller/PlantillaControlador.php";
require_once "./app/controller/UsuariosControlador.php";
require_once "./app/controller/DiagnosticosControlador.php";

// Modelos
require_once "./app/model/UsuariosModelo.php";
require_once "./app/model/DiagnosticosModelo.php";


$template = new ControladorPlantilla();
$template->ctrPlantilla();
