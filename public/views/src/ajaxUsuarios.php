<?php
require_once "../../../app/controller/UsuariosControlador.php";
require_once "../../../app/model/UsuariosModelo.php";

class ajaxUsuarios
{
    // Validar cuenta de login
    public $validarCuentaLog;
    public function ajaxCuentaLogin()
    {
        $item = "cuentaUsuario";
        $valor = $this->validarCuentaLog;
        $respuesta = UsuariosControlador::ctrListarUsuarios($item, $valor);

        echo json_encode($respuesta);
    }
    // Validar cuenta de login 
    // Validar DNI de Usuario existente
    public $validarDni;

    public function ajaxDNIRepetido()
    {
        $item = "dniUsuario";
        $valor = $this->validarDni;
        $respuesta = UsuariosControlador::ctrListarUsuarios($item, $valor);
        echo json_encode($respuesta);
    }
    // Validar DNI de Usuario existente   
    // Listar datos usuario  
    public $idUsuario;
    public function ajaxListarUsuario()
    {
        $item = "idUsuario";
        $valor = $this->idUsuario;
        $respuesta = UsuariosControlador::ctrListarUsuarios($item, $valor);
        echo json_encode($respuesta);
    }
    // Listar datos usuario  
    // Habilitar Usuario
    public $idUsuario2;
    public $idEstado;
    public function HabilitarUsuario(){}
    // Habilitar Usuario
}
// Validar Cuenta Login
if (isset($_POST["validarCuentaLog"])) {
    $validarcL = new ajaxUsuarios();
    $validarcL->validarCuentaLog = $_POST["validarCuentaLog"];
    $validarcL->ajaxCuentaLogin();
}
// Validar Cuenta Login
// Validar DNI existente
if (isset($_POST["validarDni"])) {
    $validar = new ajaxUsuarios();
    $validar->validarDni = $_POST["validarDni"];
    $validar->ajaxDNIRepetido();
}
// Validar DNI existente
// Listar usuarios
if (isset($_POST["idUsuario"])) {
    $list1 = new ajaxUsuarios();
    $list1->idUsuario = $_POST["idUsuario"];
    $list1->ajaxListarUsuario();
}
// Habilitar Usuario

// Habilitar Usuario
