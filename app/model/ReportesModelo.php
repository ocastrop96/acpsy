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

    static public function mdlListarAteRegAnu($inicio, $fin)
    {
        $stmt = Conexion::conectar()->prepare("CALL REPORTE_ATEREGANU(:inicio,:fin)");
        $stmt->bindParam(":inicio", $inicio, PDO::PARAM_STR);
        $stmt->bindParam(":fin", $fin, PDO::PARAM_STR);
        $stmt->execute();
        return $stmt->fetchAll();
        $stmt->close();
        $stmt = null;
    }

    static public function mdlListarParentReg($inicio, $fin)
    {
        $stmt = Conexion::conectar()->prepare("CALL REPORTE_PARENTESCO(:inicio,:fin)");
        $stmt->bindParam(":inicio", $inicio, PDO::PARAM_STR);
        $stmt->bindParam(":fin", $fin, PDO::PARAM_STR);
        $stmt->execute();
        return $stmt->fetchAll();
        $stmt->close();
        $stmt = null;
    }

    static public function mdlListarSexReg($inicio, $fin)
    {
        $stmt = Conexion::conectar()->prepare("CALL REPORTE_SEXO(:inicio,:fin)");
        $stmt->bindParam(":inicio", $inicio, PDO::PARAM_STR);
        $stmt->bindParam(":fin", $fin, PDO::PARAM_STR);
        $stmt->execute();
        return $stmt->fetchAll();
        $stmt->close();
        $stmt = null;
    }

    static public function mdlListarSegReg($inicio, $fin)
    {
        $stmt = Conexion::conectar()->prepare("CALL REPORTE_SEGUIMREGS(:inicio,:fin)");
        $stmt->bindParam(":inicio", $inicio, PDO::PARAM_STR);
        $stmt->bindParam(":fin", $fin, PDO::PARAM_STR);
        $stmt->execute();
        return $stmt->fetchAll();
        $stmt->close();
        $stmt = null;
    }

    static public function mdlReporteAudAtenciones($inicio, $fin)
    {
        $stmt = Conexion::conectar()->prepare("CALL REPORTE_AUDIATENCIONES(:inicio,:fin)");
        $stmt->bindParam(":inicio", $inicio, PDO::PARAM_STR);
        $stmt->bindParam(":fin", $fin, PDO::PARAM_STR);
        $stmt->execute();
        return $stmt->fetchAll();
        $stmt->close();
        $stmt = null;
    }

    static public function mdlReporteAudFamiliares($inicio, $fin)
    {
        $stmt = Conexion::conectar()->prepare("CALL REPORTE_AUDIFAMILIARES(:inicio,:fin)");
        $stmt->bindParam(":inicio", $inicio, PDO::PARAM_STR);
        $stmt->bindParam(":fin", $fin, PDO::PARAM_STR);
        $stmt->execute();
        return $stmt->fetchAll();
        $stmt->close();
        $stmt = null;
    }
}
