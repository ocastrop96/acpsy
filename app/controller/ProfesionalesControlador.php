<?php
class ProfesionalesControlador
{
    static public function ctrListarProfesionales($item, $valor)
    {
        $rptListProf = ProfesionalesModelo::mdlListarProfesionales($item, $valor);
        return $rptListProf;
    }
    static public function ctrListarCondicion()
    {
        $rptCondicion = ProfesionalesModelo::mdlListarCondiciones();
        return $rptCondicion;
    }
    static public function ctrRegistrarProfesional()
    {
        if (isset($_POST["rgpDni"]) && isset($_POST["rgpCpsp"])) {
            if (
                preg_match('/^[0-9]+$/', $_POST["rgpDni"]) &&
                preg_match('/^[0-9]+$/', $_POST["rgpCpsp"]) &&
                preg_match('/^[a-zA-ZñÑáéíóúüÁÉÍÓÚÜ]+$/', $_POST["rgpNombres"])
            ) {
                $datos = array(
                    "dniProfesional" => $_POST["rgpDni"],
                    "cpspProfesional" => $_POST["rgpCpsp"],
                    "apellidosProfesional" => $_POST["rgpApellidos"],
                    "nombresProfesional" => $_POST["rgpNombres"],
                    "idCondicion" => $_POST["rgpCondicion"]
                );
                $rptRegistroProfesional = ProfesionalesModelo::mdlRegistrarProfesional($datos);
                if ($rptRegistroProfesional == "ok") {
                    echo '<script>
                            Swal.fire({
                                icon: "success",
                                title: "¡El profesional ha sido registrado con éxito!",
                                showConfirmButton: false,
                                timer: 1500
                            });
                            function redirect(){
                                window.location = "profesionales";
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
                            window.location = "profesionales";
                        }
                        setTimeout(redirect,1200);
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
                        window.location = "profesionales";
                    }
                    setTimeout(redirect,1200);
                </script>';
            }
        }
    }
    static public function ctrEditarProfesional()
    {

    }
}
