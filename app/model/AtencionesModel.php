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
    static public function mdlCargarDatosCuenta($IdCuentaAtencion, $IdEpisodio)
    {
        $stmt = ConexionConsulta::conectar()->prepare("exec LISTAR_DATOS_CUENTA_PSICO_FORM @IdCuentaAtencion = :IdCuentaAtencion, @IdEpisodio = :IdEpisodio");
        $stmt->bindParam(":IdCuentaAtencion", $IdCuentaAtencion, PDO::PARAM_STR);
        $stmt->bindParam(":IdEpisodio", $IdEpisodio, PDO::PARAM_STR);
        $stmt->execute();
        return $stmt->fetch();
        $stmt->close();
        $stmt = null;
    }
    static public function mdlListarAtenciones($item, $valor)
    {
        if ($item != null) {
            $stmt = Conexion::conectar()->prepare("SELECT
            acpsy_atencion.idAtencion,
            acpsy_atencion.idEpisodio, 
            acpsy_atencion.correlativo_Atencion, 
            date_format(acpsy_atencion.fRegistroAtencion,'%d/%m/%Y') as fRegistroAtencion, 
            acpsy_atencion.cuentaAtencion, 
            acpsy_atencion.historiaAtencion, 
            acpsy_atencion.idEstadoPacAtencion, 
            acpsy_estadopaciente.detaEstadoPacAtencion, 
            date_format(acpsy_atencion.fechaPacNacimiento,'%d/%m/%Y')as fechaPacNacimiento, 
            acpsy_atencion.tipdocAtencion, 
            acpsy_atencion.nrodocAtencion, 
            acpsy_atencion.apPaternoAtencion, 
            acpsy_atencion.apMaternoAtencion, 
            acpsy_atencion.nombAtencion, 
            date_format(acpsy_atencion.fIngresoAtencion,'%d/%m/%Y')as fIngresoAtencion, 
            acpsy_atencion.servAtencion, 
            acpsy_atencion.camaAtencion, 
            acpsy_atencion.distritoAtencion, 
            acpsy_atencion.edadAtencion, 
            acpsy_atencion.tipSexoAtencion, 
            acpsy_tipsexo.detaTipSexo, 
            acpsy_atencion.financiaAtencion, 
            acpsy_atencion.idEstadoAte, 
            acpsy_estadoatencion.detaEstadoAte
            FROM
            acpsy_atencion
            INNER JOIN
            acpsy_estadoatencion
            ON 
                acpsy_atencion.idEstadoAte = acpsy_estadoatencion.idEstadoAte
            INNER JOIN
            acpsy_estadopaciente
            ON 
                acpsy_atencion.idEstadoPacAtencion = acpsy_estadopaciente.idEstadoPacAtencion
            INNER JOIN
            acpsy_tipsexo
            ON 
                acpsy_atencion.tipSexoAtencion = acpsy_tipsexo.idTipSexo
            WHERE $item = :$item
            ORDER BY acpsy_atencion.correlativo_Atencion DESC");
            $stmt->bindParam(":" . $item, $valor, PDO::PARAM_STR);
            $stmt->execute();
            return $stmt->fetch();
        } else {
            $stmt = Conexion::conectar()->prepare("CALL LISTAR_ATENCIONES()");
            $stmt->execute();
            return $stmt->fetchAll();
        }
        //Cerramos la conexion por seguridad
        $stmt->close();
        $stmt = null;
    }
    static public function mdlListarSexo()
    {
        $stmt = Conexion::conectar()->prepare("CALL LISTAR_SEXO()");
        $stmt->execute();
        return $stmt->fetchAll();
        $stmt->close();
        $stmt = null;
    }
    static public function mdlListarEstadoPac()
    {
        $stmt = Conexion::conectar()->prepare("CALL LISTAR_ESTADOS_PACIENTE()");
        $stmt->execute();
        return $stmt->fetchAll();
        $stmt->close();
        $stmt = null;
    }
    static public function mdlRegistrarAtenciones($datos)
    {
        $stmt = Conexion::conectar()->prepare("CALL REGISTRAR_ATENCION(:fRegistroAtencion,:idEpisodio,:cuentaAtencion,:historiaAtencion,:idEstadoPacAtencion,:fechaPacNacimiento,:tipdocAtencion,:nrodocAtencion,:apPaternoAtencion,:apMaternoAtencion,:nombAtencion,:fIngresoAtencion,:servAtencion,:camaAtencion,:distritoAtencion,:edadAtencion,:tipSexoAtencion,:financiaAtencion,:idURegAtencion)");

        $stmt->bindParam(":idEstadoPacAtencion", $datos["idEstadoPacAtencion"], PDO::PARAM_INT);
        $stmt->bindParam(":tipSexoAtencion", $datos["tipSexoAtencion"], PDO::PARAM_INT);
        $stmt->bindParam(":idURegAtencion", $datos["idURegAtencion"], PDO::PARAM_INT);
        $stmt->bindParam(":fRegistroAtencion", $datos["fRegistroAtencion"], PDO::PARAM_STR);
        $stmt->bindParam(":idEpisodio", $datos["idEpisodio"], PDO::PARAM_STR);
        $stmt->bindParam(":cuentaAtencion", $datos["cuentaAtencion"], PDO::PARAM_STR);
        $stmt->bindParam(":historiaAtencion", $datos["historiaAtencion"], PDO::PARAM_STR);
        $stmt->bindParam(":fechaPacNacimiento", $datos["fechaPacNacimiento"], PDO::PARAM_STR);
        $stmt->bindParam(":tipdocAtencion", $datos["tipdocAtencion"], PDO::PARAM_STR);
        $stmt->bindParam(":nrodocAtencion", $datos["nrodocAtencion"], PDO::PARAM_STR);
        $stmt->bindParam(":apPaternoAtencion", $datos["apPaternoAtencion"], PDO::PARAM_STR);
        $stmt->bindParam(":apMaternoAtencion", $datos["apMaternoAtencion"], PDO::PARAM_STR);
        $stmt->bindParam(":nombAtencion", $datos["nombAtencion"], PDO::PARAM_STR);
        $stmt->bindParam(":fIngresoAtencion", $datos["fIngresoAtencion"], PDO::PARAM_STR);
        $stmt->bindParam(":servAtencion", $datos["servAtencion"], PDO::PARAM_STR);
        $stmt->bindParam(":camaAtencion", $datos["camaAtencion"], PDO::PARAM_STR);
        $stmt->bindParam(":distritoAtencion", $datos["distritoAtencion"], PDO::PARAM_STR);
        $stmt->bindParam(":edadAtencion", $datos["edadAtencion"], PDO::PARAM_STR);
        $stmt->bindParam(":financiaAtencion", $datos["financiaAtencion"], PDO::PARAM_STR);
        if ($stmt->execute()) {
            return "ok";
        } else {
            return "error";
        }
        $stmt->close();
        $stmt = null;
    }
    static public function mdlEditarAtenciones($datos)
    {
    }
    static public function mdlAnularAtenciones()
    {
    }
}
