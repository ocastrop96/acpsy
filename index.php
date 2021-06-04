<?php
// Controladores
require_once "./app/controller/PlantillaControlador.php";
require_once "./app/controller/UsuariosControlador.php";
require_once "./app/controller/DiagnosticosControlador.php";
require_once "./app/controller/ProfesionalesControlador.php";
require_once "./app/controller/AtencionesControlador.php";

// Modelos
require_once "./app/model/UsuariosModelo.php";
require_once "./app/model/DiagnosticosModelo.php";
require_once "./app/model/ProfesionalesModelo.php";
require_once "./app/model/AtencionesModel.php";

$template = new ControladorPlantilla();
$template->ctrPlantilla();
