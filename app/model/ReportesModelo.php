<?php
require_once "dbConnect.php";
class ReportesModelo
{
    static public function mdlListarWidgets()
    {
        $stmt = Conexion::conectar()->prepare("CALL LISTAR_WIDGETS()");
        $stmt->execute();
        return $stmt->fetch();
        $stmt->close();
        $stmt = null;
    }
}
