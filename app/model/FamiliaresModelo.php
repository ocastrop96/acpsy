<?php
require_once "dbConnect.php";
class FamiliaresModelo
{
    static public function mdlListarFamiliares($item, $valor)
    {
        if ($item != null) {
            $stmt = Conexion::conectar()->prepare("SELECT
            acpsy_famatencion.idFamiliar,
            date_format(acpsy_famatencion.fechaRegistro,'%d/%m/%Y') as fechaRegistro, 
            acpsy_famatencion.idAtencion, 
            acpsy_atencion.cuentaAtencion, 
            acpsy_atencion.historiaAtencion, 
            acpsy_atencion.apPaternoAtencion, 
            acpsy_atencion.apMaternoAtencion, 
            acpsy_atencion.nombAtencion, 
            acpsy_famatencion.tipdocFamiliar, 
            acpsy_famatencion.ndocFamiliar, 
            acpsy_famatencion.nombApFamiliar, 
            acpsy_famatencion.idParentesco, 
            acpsy_parentescofam.detaParentesco, 
            acpsy_famatencion.idTipSexo, 
            acpsy_tipsexo.detaTipSexo, 
            acpsy_famatencion.edadFamiliar, 
            acpsy_famatencion.telcelFamiliar
        FROM
            acpsy_famatencion
            INNER JOIN
            acpsy_atencion
            ON 
                acpsy_famatencion.idAtencion = acpsy_atencion.idAtencion
            INNER JOIN
            acpsy_parentescofam
            ON 
                acpsy_famatencion.idParentesco = acpsy_parentescofam.idParentesco
            INNER JOIN
            acpsy_tipsexo
            ON 
                acpsy_famatencion.idTipSexo = acpsy_tipsexo.idTipSexo
            WHERE $item = :$item
            ORDER BY acpsy_famatencion.fechaRegistro DESC");
            $stmt->bindParam(":" . $item, $valor, PDO::PARAM_STR);
            $stmt->execute();
            return $stmt->fetch();
        } else {
            $stmt = Conexion::conectar()->prepare("CALL LISTAR_FAMILIARES()");
            $stmt->execute();
            return $stmt->fetchAll();
        }
        //Cerramos la conexion por seguridad
        $stmt->close();
        $stmt = null;
    }
    static public function mdlListarPaciente($dato)
    {
        $stmt = Conexion::conectar()->prepare("CALL BUSCAR_PACIENTE(:dato)");
        $stmt->bindParam(":dato", $dato, PDO::PARAM_STR);
        $stmt->execute();
        return $stmt->fetchAll();
        $stmt->close();
        $stmt = null;
    }
}
