<?php
require_once "dbConnect.php";
class DiagnosticosModelo
{
    static public function mdlListarDiagnosticos($item, $valor)
    {
        if ($item != null) {
            $stmt = Conexion::conectar()->prepare("SELECT
            acpsy_diagnosticos.idDiagnostico,
            acpsy_diagnosticos.cieDiagnostico,
            acpsy_diagnosticos.detaDiagnostico 
            FROM
                acpsy_diagnosticos 
            WHERE $item = :$item
            ORDER BY acpsy_diagnosticos.cieDiagnostico");
            $stmt->bindParam(":" . $item, $valor, PDO::PARAM_STR);
            $stmt->execute();
            return $stmt->fetch();
        } else {
            $stmt = Conexion::conectar()->prepare("CALL LISTAR_DIAGNOSTICOS()");
            $stmt->execute();
            return $stmt->fetchAll();
        }
        //Cerramos la conexion por seguridad
        $stmt->close();
        $stmt = null;
    }
}
