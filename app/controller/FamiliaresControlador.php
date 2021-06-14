<?php
class FamiliaresControlador
{
    static public function ctrListarFamiliares($item, $valor)
    {
        $rptListFam = FamiliaresModelo::mdlListarFamiliares($item, $valor);
        return $rptListFam;
    }

    static public function ctrListarPaciente($dato)
    {
        $rptBuscarPac = FamiliaresModelo::mdlListarPaciente($dato);
        return $rptBuscarPac;
    }
    static public function ctrListarParentesco()
    {
        $rptFamParen = FamiliaresModelo::mdlListarParentesco();
        return $rptFamParen;
    }
    static public function ctrRegistrarFamiliar()
    {
        if (isset($_POST["rgfAtencion"]) && isset($_POST["rgfNdoc"])) {
            if (
                preg_match('/^[0-9]+$/', $_POST["rgfAtencion"]) &&
                preg_match('/^[0-9]+$/', $_POST["rgfNdoc"]) &&
                preg_match('/^[a-zA-ZñÑáéíóúüÁÉÍÓÚÜ]+$/', $_POST["rgfNomAp"])
            ) {
                date_default_timezone_set('America/Lima');
                $fRegFam = date("Y-m-d");
                $datos = array(
                    "fechaRegistro" =>  $fRegFam,
                    "idUsuario" => $_POST["idUsFam"],
                    "idAtencion" => $_POST["rgfAtencion"],
                    "idParentesco" => $_POST["rgfParent"],
                    "idTipSexo" => $_POST["rgfSexo"],
                    "tipdocFamiliar" => $_POST["rgfTdoc"],
                    "ndocFamiliar" => $_POST["rgfNdoc"],
                    "nombApFamiliar" => $_POST["rgfNomAp"],
                    "edadFamiliar" => $_POST["rgfEdad"],
                    "telcelFamiliar" => $_POST["rgfTel"]
                );
                $rptRegFam = FamiliaresModelo::mdlRegistrarFamiliar($datos);
                if ($rptRegFam == "ok") {
                    echo '<script>
                            Swal.fire({
                                icon: "success",
                                title: "¡El familiar ha sido registrado con éxito!",
                                showConfirmButton: false,
                                timer: 1500
                            });
                            function redirect(){
                                window.location = "familiares";
                            }
                            setTimeout(redirect,1200);
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
                            window.location = "familiares";
                        }
                        setTimeout(redirect,1200);
                    </script>';
                }
            } else {
                echo '<script>
                        Swal.fire({
                        icon: "error",
                        title: "Ingrese los datos requeridos",
                        showConfirmButton: false,
                        timer: 1500
                        });
                        function redirect(){
                            window.location = "familiares";
                        }
                        setTimeout(redirect,1200);
                    </script>';
            }
        }
    }
    static public function ctrEditarFamiliar()
    {
    }
    static public function ctrEliminarFamiliar()
    {
    }
}
