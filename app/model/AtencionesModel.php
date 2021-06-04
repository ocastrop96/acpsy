<?php
require_once "dbConnect.php";
require_once "dbConnectMS.php";

class AtencionesModelo
{
    static public function mdlTraerDatosCuenta($IdCuentaAtencion)
    {
        $stmt = ConexionConsulta::conectar()->prepare("exec LISTAR_DATOS_CUENTA_PSICO @IdCuentaAtencion = :IdCuentaAtencion");
        $stmt->bindParam(":IdCuentaAtencion", $IdCuentaAtencion, PDO::PARAM_STR);
        $stmt->execute();
        return $stmt->fetchAll();
        $stmt->close();
        $stmt = null;
    }
    static public function mdlListarAtenciones()
    {
    }
    static public function mdlRegistrarAtenciones()
    {
    }
    static public function mdlEditarAtenciones()
    {
    }
    static public function mdlAnularAtenciones()
    {
    }
}
