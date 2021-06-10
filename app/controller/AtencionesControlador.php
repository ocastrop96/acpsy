<?php
class AtencionesControlador
{
    static public function ctrTraerDatosCuenta($IdCuentaAtencion)
    {
        $repuesta = AtencionesModelo::mdlTraerDatosCuenta($IdCuentaAtencion);
        return $repuesta;
    }
    static public function ctrCargarDatosCuenta($IdCuentaAtencion, $IdEpisodio)
    {
        $repuesta = AtencionesModelo::mdlCargarDatosCuenta($IdCuentaAtencion, $IdEpisodio);
        return $repuesta;
    }
    static public function ctrListarAtenciones($item, $valor)
    {
        $rptListAten = AtencionesModelo::mdlListarAtenciones($item, $valor);
        return $rptListAten;
    }
    static public function ctrListarSexo()
    {
        $rptSexo = AtencionesModelo::mdlListarSexo();
        return $rptSexo;
    }
    static public function ctrListarEstadosPaciente()
    {
        $rptEstadoPac = AtencionesModelo::mdlListarEstadoPac();
        return $rptEstadoPac;
    }
    static public function ctrRegistrarAtencion()
    {
        if (isset($_POST["rgaNCuenta"]) && isset($_POST["rgaNHC"])) {
            if (
                preg_match('/^[0-9]+$/', $_POST["rgaNCuenta"]) &&
                preg_match('/^[0-9]+$/', $_POST["rgaNHC"])
            ) {
                // Seteo de fechas
                date_default_timezone_set('America/Lima');
                $fRegistroAtencion = date("Y-m-d");

                $fNac = $_POST["rgaFNac"];
                $dateFNac = str_replace('/', '-', $fNac);
                $fNac1 = date('Y-m-d', strtotime($dateFNac));

                $fIng = $_POST["rgaFIngServicio"];
                $dateFIng = str_replace('/', '-', $fIng);
                $fIng1 = date('Y-m-d', strtotime($dateFIng));
                // Seteo de fechas
                $datos = array(
                    "fRegistroAtencion" => $fRegistroAtencion,
                    "idEpisodio" => $_POST["idEpisodio"],
                    "cuentaAtencion" => $_POST["rgaNCuenta"],
                    "historiaAtencion" => $_POST["rgaNHC"],
                    "fechaPacNacimiento" => $fNac1,
                    "tipdocAtencion" => $_POST["rgaTdoc"],
                    "nrodocAtencion" => $_POST["rgaNDoc"],
                    "apPaternoAtencion" => $_POST["rgaAPaterno"],
                    "apMaternoAtencion" => $_POST["rgaAMaterno"],
                    "nombAtencion" => $_POST["rgaNombres"],
                    "fIngresoAtencion" => $fIng1,
                    "servAtencion" => $_POST["rgaServicio"],
                    "camaAtencion" => $_POST["rgaCama"],
                    "distritoAtencion" => $_POST["rgaDistrito"],
                    "edadAtencion" => $_POST["rgaEdad"],
                    "financiaAtencion" => $_POST["rgaFinancia"],
                    "idURegAtencion" => $_POST["usuRegAte"],
                    "tipSexoAtencion" => $_POST["rgaSexo"],
                    "idEstadoPacAtencion" => $_POST["rgaEstadoPac"]
                );
                $rptRegistroAtencion = AtencionesModelo::mdlRegistrarAtenciones($datos);
                if ($rptRegistroAtencion == "ok") {
                    echo '<script>
                            Swal.fire({
                                icon: "success",
                                title: "¡La atención ha sido registrada con éxito!",
                                showConfirmButton: false,
                                timer: 1500
                            });
                            function redirect(){
                                window.location = "atenciones";
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
                            window.location = "atenciones";
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
                        window.location = "atenciones";
                    }
                    setTimeout(redirect,1000);
                </script>';
            }
        }
    }
    static public function ctrditarAtencion()
    {
    }
}
