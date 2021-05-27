<?php
require_once "dbConnect.php";
class ProfesionalesModelo
{
    static public function mdlListarProfesionales($item, $valor)
    {
        if ($item != null) {
            $stmt = Conexion::conectar()->prepare("SELECT
            acpsy_profesionales.idProfesional, 
            acpsy_profesionales.dniProfesional, 
            acpsy_profesionales.cpspProfesional, 
            acpsy_profesionales.nombresProfesional, 
            acpsy_profesionales.apellidosProfesional, 
            acpsy_profesionales.idCondicion, 
            acpsy_condicionprof.detaCondicion
        FROM
            acpsy_profesionales
            INNER JOIN
            acpsy_condicionprof
            ON 
                acpsy_profesionales.idCondicion = acpsy_condicionprof.idCondicion
                WHERE $item = :$item
                ORDER BY acpsy_profesionales.apellidosProfesional ASC");
            $stmt->bindParam(":" . $item, $valor, PDO::PARAM_STR);
            $stmt->execute();
            return $stmt->fetch();
        } else {
            $stmt = Conexion::conectar()->prepare("CALL LISTAR_PROFESIONALES()");
            $stmt->execute();
            return $stmt->fetchAll();
        }
        //Cerramos la conexion por seguridad
        $stmt->close();
        $stmt = null;
    }
}
