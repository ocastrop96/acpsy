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

                // Comunicación familiar
                if ($_POST["comunicaFamilia"] == "SI" && $_POST["rgSegFam"] == 0) {
                    echo '<script>
                            Swal.fire({
                            icon: "error",
                            title: "Si registra comunicación con familiar, complete todos los datos",
                            showConfirmButton: false,
                            timer: 1500
                            });
                            function redirect(){
                                window.location = "seguimiento";
                            }
                            setTimeout(redirect,1200);
                            </script>';
                } else {

                    $datos = array(
                        "fRegistrSeg" => $fRegSeg1,
                        "idUsuario" => $_POST["idUsuario"],
                        "idAtencionPac" => $_POST["rgSegPac"],
                        "idProfesional" => $_POST["rgSegProf"],
                        "idTipoSeguimiento" => $_POST["rgSegTip"],
                        "idMotSeguimiento" => $_POST["rgSegMot"],
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
                }
                // Comunicación familiar
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
        if (isset($_POST["edtSegTip"]) && isset($_POST["edtSegPac"])) {
            if (
                preg_match('/^[0-9]+$/', $_POST["edtSegTip"]) &&
                preg_match('/^[0-9]+$/', $_POST["edtSegPac"])
            ) {
                date_default_timezone_set('America/Lima');
                $fRegSeg = $_POST["edtSegFec"];
                $dateSeg = str_replace('/', '-', $fRegSeg);
                $fRegSeg1 = date('Y-m-d', strtotime($dateSeg));

                // Comunicación familiar
                if ($_POST["comunicaFamilia1"] == "SI" && $_POST["edtSegFam"] == 0 && $_POST["edtSegDf1"] == 0) {
                    echo '<script>
                            Swal.fire({
                            icon: "error",
                            title: "Si registra comunicación con familiar, complete todos los datos",
                            showConfirmButton: false,
                            timer: 1500
                            });
                            function redirect(){
                                window.location = "seguimiento";
                            }
                            setTimeout(redirect,1200);
                            </script>';
                } else {
                    // Valor dato familiar
                    if ($_POST["edtSegFam"] != 0) {
                        $familiar = $_POST["edtSegFam"];
                    } else {
                        $familiar = $_POST["idFamAnt"];
                    }
                    // Valor dato familiar
                    $datos = array(
                        "fRegistrSeg" => $fRegSeg1,
                        "idSeguimiento" => $_POST["idSeguimiento"],
                        "idAtencionPac" => $_POST["edtSegPac"],
                        "idProfesional" => $_POST["edtSegProf"],
                        "idTipoSeguimiento" => $_POST["edtSegTip"],
                        "idMotSeguimiento" => $_POST["edtSegMot"],
                        "idDiag1Seg" => $_POST["edtSegDp1"],
                        "idDiag2Seg" => $_POST["edtSegDp2"],
                        "comunFamSeg" => $_POST["comunicaFamilia1"],
                        "idFamAtSeg" => $familiar,
                        "idDiag1SegFam" => $_POST["edtSegDf1"],
                        "idDiag2SegFam" => $_POST["edtSegDf2"],
                        "obsSeg" => $_POST["edtSegObs"]
                    );
                    $rptEditarSegui = SeguimientosModelo::mdlEditarSeguimiento($datos);
                    if ($rptEditarSegui == "ok") {
                        echo '<script>
                                Swal.fire({
                                    icon: "success",
                                    title: "¡El seguimiento ha sido actualizado con éxito!",
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
                }
                // Comunicación familiar
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
}
