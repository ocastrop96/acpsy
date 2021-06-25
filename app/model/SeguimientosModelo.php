<?php
require_once "dbConnect.php";
class SeguimientosModelo
{
    static public function mdlListarSeguimientos($item, $valor)
    {
        if ($item != null) {
            $stmt = Conexion::conectar()->prepare("SELECT
            acpsy_seguimiento.idSeguimiento, 
                date_format(acpsy_seguimiento.fRegistrSeg,'%d/%m/%Y') as fRegistrSeg, 
            acpsy_seguimiento.idAtencionPac, 
            acpsy_atencion.cuentaAtencion, 
            acpsy_atencion.historiaAtencion, 
            acpsy_atencion.nombAtencion, 
            acpsy_atencion.apMaternoAtencion, 
            acpsy_atencion.apPaternoAtencion, 
            acpsy_seguimiento.idTipoSeguimiento, 
            acpsy_tiposeguimiento.detaTipSeguimiento, 
            acpsy_seguimiento.idMotSeguimiento, 
            acpsy_motivoseguimiento.detaMotivoSef, 
            acpsy_seguimiento.idEtapSegui, 
            acpsy_etapaseguimiento.detaEtapSegui, 
            acpsy_seguimiento.idProfesional, 
            acpsy_profesionales.nombresProfesional, 
            acpsy_profesionales.apellidosProfesional, 
            acpsy_seguimiento.comunFamSeg, 
            acpsy_seguimiento.idDiag1Seg, 
            acpsy_diagnosticos.cieDiagnostico, 
            acpsy_diagnosticos.detaDiagnostico, 
            acpsy_seguimiento.idFamAtSeg, 
            acpsy_famatencion.nombApFamiliar, 
            acpsy_seguimiento.idDiag2Seg, 
            acpsy_seguimiento.idDiag1SegFam, 
            acpsy_seguimiento.idDiag2SegFam, 
            acpsy_seguimiento.obsSeg, 
            acpsy_seguimiento.idStatusSeg, 
            acpsy_estatusseguimiento.detaStatusSeg
        FROM
            acpsy_seguimiento
            INNER JOIN
            acpsy_atencion
            ON 
                acpsy_seguimiento.idAtencionPac = acpsy_atencion.idAtencion
            INNER JOIN
            acpsy_profesionales
            ON 
                acpsy_seguimiento.idProfesional = acpsy_profesionales.idProfesional
            INNER JOIN
            acpsy_tiposeguimiento
            ON 
                acpsy_seguimiento.idTipoSeguimiento = acpsy_tiposeguimiento.idTipoSeguimiento
            INNER JOIN
            acpsy_motivoseguimiento
            ON 
                acpsy_seguimiento.idMotSeguimiento = acpsy_motivoseguimiento.idMotSeguimiento
            INNER JOIN
            acpsy_etapaseguimiento
            ON 
                acpsy_seguimiento.idEtapSegui = acpsy_etapaseguimiento.idEtapSegui
            INNER JOIN
            acpsy_estatusseguimiento
            ON 
                acpsy_seguimiento.idStatusSeg = acpsy_estatusseguimiento.idStatusSeg
            INNER JOIN
            acpsy_famatencion
            ON 
                acpsy_seguimiento.idFamAtSeg = acpsy_famatencion.idFamiliar
            INNER JOIN
            acpsy_diagnosticos
            ON 
                acpsy_seguimiento.idDiag1Seg = acpsy_diagnosticos.idDiagnostico
            WHERE $item = :$item
            ORDER BY acpsy_seguimiento.fRegistrSeg desc, acpsy_seguimiento.idSeguimiento desc");
            $stmt->bindParam(":" . $item, $valor, PDO::PARAM_STR);
            $stmt->execute();
            return $stmt->fetch();
        } else {
            $stmt = Conexion::conectar()->prepare("CALL LISTAR_SEGUIMIENTOS()");
            $stmt->execute();
            return $stmt->fetchAll();
        }
        //Cerramos la conexion por seguridad
        $stmt->close();
        $stmt = null;
    }
    static public function mdlListarTiposSeguimiento()
    {
        $stmt = Conexion::conectar()->prepare("CALL LISTAR_TIPO_SEGUIMIENTO()");
        $stmt->execute();
        return $stmt->fetchAll();
        $stmt->close();
        $stmt = null;
    }
    static public function mdlListarMotivoSeguimiento()
    {
        $stmt = Conexion::conectar()->prepare("CALL LISTAR_MOTIVOS_SEGUIMIENTO()");
        $stmt->execute();
        return $stmt->fetchAll();
        $stmt->close();
        $stmt = null;
    }
    static public function mdlListarEtapaSeguimiento()
    {
        $stmt = Conexion::conectar()->prepare("CALL LISTAR_ETAPAS_SEGUIMIENTO()");
        $stmt->execute();
        return $stmt->fetchAll();
        $stmt->close();
        $stmt = null;
    }
    static public function mdlRegistrarSeguimiento($datos)
    {
        $stmt = Conexion::conectar()->prepare("CALL REGISTRAR_SEGUIMIENTO(:fRegistrSeg,:idUsuario,:idAtencionPac,:idProfesional,:idTipoSeguimiento,:idMotSeguimiento,:idEtapSegui,:idDiag1Seg,:idDiag2Seg,:comunFamSeg,:idFamAtSeg,:idDiag1SegFam,:idDiag2SegFam,:obsSeg)");

        $stmt->bindParam(":idUsuario", $datos["idUsuario"], PDO::PARAM_INT);
        $stmt->bindParam(":idAtencionPac", $datos["idAtencionPac"], PDO::PARAM_INT);
        $stmt->bindParam(":idProfesional", $datos["idProfesional"], PDO::PARAM_INT);
        $stmt->bindParam(":idTipoSeguimiento", $datos["idTipoSeguimiento"], PDO::PARAM_INT);
        $stmt->bindParam(":idMotSeguimiento", $datos["idMotSeguimiento"], PDO::PARAM_INT);
        $stmt->bindParam(":idEtapSegui", $datos["idEtapSegui"], PDO::PARAM_INT);
        $stmt->bindParam(":idDiag1Seg", $datos["idDiag1Seg"], PDO::PARAM_INT);
        $stmt->bindParam(":idDiag2Seg", $datos["idDiag2Seg"], PDO::PARAM_INT);
        $stmt->bindParam(":idFamAtSeg", $datos["idFamAtSeg"], PDO::PARAM_INT);
        $stmt->bindParam(":idDiag1SegFam", $datos["idDiag1SegFam"], PDO::PARAM_INT);
        $stmt->bindParam(":idDiag2SegFam", $datos["idDiag2SegFam"], PDO::PARAM_INT);
        $stmt->bindParam(":fRegistrSeg", $datos["fRegistrSeg"], PDO::PARAM_STR);
        $stmt->bindParam(":comunFamSeg", $datos["comunFamSeg"], PDO::PARAM_STR);
        $stmt->bindParam(":obsSeg", $datos["obsSeg"], PDO::PARAM_STR);

        if ($stmt->execute()) {
            return "ok";
        } else {
            return "error";
        }
        $stmt->close();
        $stmt = null;
    }
}
