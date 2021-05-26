<?php
// LLamada a controlador
require_once "../../../app/controller/UsuariosControlador.php";
// LLamada a modelo
require_once "../../../app/model/UsuariosModelo.php";

// require_once "../../app/model/UsuariosModelo.php";

class DatatableUsuarios
{
    public function mostrarTablaUsuarios()
    {
        $item = null;
        $valor = null;
        $usuarios = UsuariosControlador::ctrListarUsuarios($item, $valor);

        $datos_json = '{
            "data": [';

        for ($i = 0; $i < count($usuarios); $i++) {
            $datos_json .= '[
                "' . ($i + 1) . '",
                "' . $usuarios[$i]["dniUsuario"] . '",
                "' . $usuarios[$i]["nombresUsuario"] . '",
                "' . $usuarios[$i]["apellidosUsuario"] . '",
                "' . $usuarios[$i]["detallePerfil"] . '",
                "' . $usuarios[$i]["correoUsuario"] . '",
                "' . $usuarios[$i]["cuentaUsuario"] . '",
                "' . $usuarios[$i]["fechaAlta"] . '",
                "' . $usuarios[$i]["detalleEstadoU"] . '",
                "' . $usuarios[$i]["dniUsuario"] . '"
            ],';
        }
        $datos_json = substr($datos_json, 0, -1);
        $datos_json .= ']
        }';
        echo $datos_json;
    }
}
// Llamamos a la tabla de Usuarios
$tablaUsuarios = new DatatableUsuarios();
$tablaUsuarios->mostrarTablaUsuarios();
