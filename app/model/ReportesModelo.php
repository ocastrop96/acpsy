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

    static public function mdlListar10Diagnosticos()
    {
        $stmt = Conexion::conectar()->prepare("CALL GRAFICO_DIAGNOSTICOS()");
        $stmt->execute();
        return $stmt->fetchAll();
        $stmt->close();
        $stmt = null;
    }
    static public function mdlListarSeguimientos()
    {
        $stmt = Conexion::conectar()->prepare("CALL GRAFICO_SEGUIMIENTO_MENSUAL()");
        $stmt->execute();
        return $stmt->fetchAll();
        $stmt->close();
        $stmt = null;
    }
}
