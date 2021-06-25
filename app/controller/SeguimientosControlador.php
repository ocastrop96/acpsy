<?php
class SeguimientosControlador
{
    static public function ctrListarSeguimientos($item, $valor)
    {
        $rptListSeg = SeguimientosModelo::mdlListarSeguimientos($item, $valor);
        return $rptListSeg;
    }
    static public function ctrListarTipoSeguimiento()
    {
        $rptSexo = SeguimientosModelo::mdlListarTiposSeguimiento();
        return $rptSexo;
    }
    static public function ctrListarMotivoSeguimiento()
    {
        $rptSexo = SeguimientosModelo::mdlListarMotivoSeguimiento();
        return $rptSexo;
    }
    static public function ctrListarEtapaSeguimiento()
    {
        $rptSexo = SeguimientosModelo::mdlListarEtapaSeguimiento();
        return $rptSexo;
    }
    static public function ctrRegistrarSeguimiento()
    {
        if (isset($_POST["rgSegTip"]) && isset($_POST["rgSegPac"])) {
            if (
                preg_match('/^[0-9]+$/', $_POST["rgSegTip"]) &&
                preg_match('/^[0-9]+$/', $_POST["rgSegPac"])
            ) {
                date_default_timezone_set('America/Lima');
                $fRegSeg = $_POST["rgaFNac"];
                $dateSeg = str_replace('/', '-', $fRegSeg);
                $fRegSeg1 = date('Y-m-d', strtotime($dateSeg));

                $datos = array(
                    "fRegistroAtencion" => $fRegSeg1,
                    "idUsuario" => $_POST["idUsuario"],
                    "idAtencionPac" => $_POST["rgSegPac"],
                    "idProfesional" => $_POST["rgSegProf"],
                    "idTipoSeguimiento" => $_POST["rgSegTip"],
                    "idMotSeguimiento" => $_POST["rgSegMot"],
                    "idEtapSegui" => $_POST["rgSegEta"],
                    "idDiag1Seg" => $_POST["rgaAPaterno"],
                    "idDiag2Seg" => $_POST["rgaAMaterno"],
                    "comunFamSeg" => $_POST["rgaNombres"],
                    "idFamAtSeg" => $_POST["rgaNombres"],
                    "idDiag1SegFam" => $_POST["rgaServicio"],
                    "idDiag2SegFam" => $_POST["rgaCama"],
                    "obsSeg" => $_POST["rgaDistrito"]
                );
            } else {
                echo '<script>
                Swal.fire({
                icon: "error",
                title: "Ingrese correctamente sus datos",
                showConfirmButton: false,
                timer: 1500
                });
                function redirect(){
                    window.location = "seguimiento";
                }
                setTimeout(redirect,1300);
                </script>';
            }
        }
    }
    static public function ctrEditarSeguimiento()
    {
    }
}
