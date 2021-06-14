<?php
// Controladores
require_once "./app/controller/PlantillaControlador.php";
require_once "./app/controller/UsuariosControlador.php";
require_once "./app/controller/DiagnosticosControlador.php";
require_once "./app/controller/ProfesionalesControlador.php";
require_once "./app/controller/AtencionesControlador.php";
require_once "./app/controller/FamiliaresControlador.php";

// Modelos
require_once "./app/model/UsuariosModelo.php";
require_once "./app/model/DiagnosticosModelo.php";
require_once "./app/model/ProfesionalesModelo.php";
require_once "./app/model/AtencionesModel.php";
require_once "./app/model/FamiliaresModelo.php";

$template = new ControladorPlantilla();
$template->ctrPlantilla();
