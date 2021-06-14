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
    static public function mdlListarParentesco()
    {
        $stmt = Conexion::conectar()->prepare("CALL LISTAR_PARENTESCO()");
        $stmt->execute();
        return $stmt->fetchAll();
        $stmt->close();
        $stmt = null;
    }
    static public function mdlRegistrarFamiliar($datos)
    {
        $stmt = Conexion::conectar()->prepare("CALL REGISTRAR_FAMILIARES(:fechaRegistro,:idUsuario,:idAtencion,:idParentesco,:idTipSexo,:tipdocFamiliar,:ndocFamiliar,:nombApFamiliar,:edadFamiliar,:telcelFamiliar)");

        $stmt->bindParam(":idUsuario", $datos["idUsuario"], PDO::PARAM_INT);
        $stmt->bindParam(":idAtencion", $datos["idAtencion"], PDO::PARAM_INT);
        $stmt->bindParam(":idParentesco", $datos["idParentesco"], PDO::PARAM_INT);
        $stmt->bindParam(":idTipSexo", $datos["idTipSexo"], PDO::PARAM_INT);
        $stmt->bindParam(":fechaRegistro", $datos["fechaRegistro"], PDO::PARAM_STR);
        $stmt->bindParam(":tipdocFamiliar", $datos["tipdocFamiliar"], PDO::PARAM_STR);
        $stmt->bindParam(":ndocFamiliar", $datos["ndocFamiliar"], PDO::PARAM_STR);
        $stmt->bindParam(":nombApFamiliar", $datos["nombApFamiliar"], PDO::PARAM_STR);
        $stmt->bindParam(":edadFamiliar", $datos["edadFamiliar"], PDO::PARAM_STR);
        $stmt->bindParam(":telcelFamiliar", $datos["telcelFamiliar"], PDO::PARAM_STR);
        if ($stmt->execute()) {
            return "ok";
        } else {
            return "error";
        }
        $stmt->close();
        $stmt = null;
    }
    static public function mdlEditarFamiliar($datos)
    {
    }
    static public function mdlEliminarFamiliar($datos)
    {
    }
}
