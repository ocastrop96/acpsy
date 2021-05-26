<?php
require_once "dbConnect.php";
class UsuariosModelo
{
    static public function mdlLoginUsuario($datos)
    {
        $stmt = Conexion::conectar()->prepare("CALL LOGIN_USUARIO(:cuentaUsuario)");
        $stmt->bindParam(":cuentaUsuario", $datos, PDO::PARAM_STR);
        $stmt->execute();
        return $stmt->fetch();
        $stmt->close();
        $stmt = null;
    }
    static public function mdlListarUsuarios($item, $valor)
    {
        if ($item != null) {
            $stmt = Conexion::conectar()->prepare("SELECT
            acpsy_usuarios.idUsuario,
            acpsy_usuarios.idPerfil,
            acpsy_usuarios.idEstado,
            acpsy_usuarios.dniUsuario,
            acpsy_usuarios.apellidosUsuario,
            acpsy_usuarios.nombresUsuario,
            acpsy_usuarios.cuentaUsuario,
            acpsy_usuarios.correoUsuario,
            acpsy_usuarios.claveUsuario,
            acpsy_usuarios.intentosUsuario,
            acpsy_usuarios.profileUsuario 
        FROM
            acpsy_usuarios WHERE $item = :$item ORDER BY acpsy_usuarios.idPerfil ASC");
            $stmt->bindParam(":" . $item, $valor, PDO::PARAM_STR);
            $stmt->execute();
            return $stmt->fetch();
        } else {
            $stmt = Conexion::conectar()->prepare("CALL LISTAR_USUARIOS()");
            $stmt->execute();
            return $stmt->fetchAll();
        }
        //Cerramos la conexion por seguridad
        $stmt->close();
        $stmt = null;
    }
}
