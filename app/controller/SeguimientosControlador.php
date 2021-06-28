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
                $fRegSeg = $_POST["rgSegFec"];
                $dateSeg = str_replace('/', '-', $fRegSeg);
                $fRegSeg1 = date('Y-m-d', strtotime($dateSeg));

                $datos = array(
                    "fRegistrSeg" => $fRegSeg1,
                    "idUsuario" => $_POST["idUsuario"],
                    "idAtencionPac" => $_POST["rgSegPac"],
                    "idProfesional" => $_POST["rgSegProf"],
                    "idTipoSeguimiento" => $_POST["rgSegTip"],
                    "idMotSeguimiento" => $_POST["rgSegMot"],
                    "idEtapSegui" => $_POST["rgSegEta"],
                    "idDiag1Seg" => $_POST["rgSegDp1"],
                    "idDiag2Seg" => $_POST["rgSegDp2"],
                    "comunFamSeg" => $_POST["comunicaFamilia"],
                    "idFamAtSeg" => $_POST["rgSegFam"],
                    "idDiag1SegFam" => $_POST["rgSegDf1"],
                    "idDiag2SegFam" => $_POST["rgSegDf2"],
                    "obsSeg" => $_POST["rgSegObs"]
                );
                $rptRegistroSegui = SeguimientosModelo::mdlRegistrarSeguimiento($datos);
                if ($rptRegistroSegui == "ok") {
                    echo '<script>
                            Swal.fire({
                                icon: "success",
                                title: "¡El seguimiento ha sido registrado con éxito!",
                                showConfirmButton: false,
                                timer: 1500
                            });
                            function redirect(){
                                window.location = "seguimiento";
                            }
                            setTimeout(redirect,1100);
                      </script>';
                } else {
                    echo '<script>
                        Swal.fire({
                        icon: "error",
                        title: "Hubo un error al registrar. Intente nuevamente",
                        showConfirmButton: false,
                        timer: 1500
                        });
                        function redirect(){
                            window.location = "seguimiento";
                        }
                        setTimeout(redirect,1100);
                    </script>';
                }
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
