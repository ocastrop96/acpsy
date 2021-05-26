<?php
class UsuariosControlador
{
    static public function ctrLoginUsuario()
    {
        if (isset($_POST["usuarioLog"]) && isset($_POST["usuarioPass"])) {
            if (
                preg_match('/^[a-zA-ZñÑáéíóúÁÉÍÓÚ]+$/', $_POST["usuarioLog"]) &&
                preg_match('/^[a-zA-Z0-9ñÑáéíóúÁÉÍÓÚ].{7,15}+$/', $_POST["usuarioPass"])
            ) {
                $usuario = $_POST["usuarioLog"];
                $encriptaPass = crypt($_POST["usuarioPass"], '$2a$07$usesomesillystringforsalt$');

                $rptLogin = UsuariosModelo::mdlLoginUsuario($usuario);
                if ($rptLogin["cuentaUsuario"] == $_POST["usuarioLog"] && $rptLogin["claveUsuario"] == $encriptaPass) {
                    $_SESSION["loginACPSY"] = "ok";
                    $_SESSION["loginId"] = $rptLogin["idUsuario"];
                    $_SESSION["loginPerfil"] = $rptLogin["idPerfil"];
                    $_SESSION["loginNombres"] = $rptLogin["nombresUsuario"];
                    echo '<script>
                            Swal.fire({
                                icon: "success",
                                title: "Acceso concedido...¡Bienvenido!",
                                showConfirmButton: false,
                                timer: 1200
                            });
                            function redirect(){
                                window.location = "dashboard";
                            }
                            setTimeout(redirect,1200);
                             </script>';
                } else {
                    echo '<script>
                            Swal.fire({
                                icon: "error",
                                title: "El usuario y/o contraseña ingresados no son correctos",
                                showConfirmButton: false,
                                timer: 1200
                            });
                            function redirect(){
                                window.location = "login";
                            }
                            setTimeout(redirect,1200);
                             </script>';
                }
            }
        }
    }
    static public function ctrListarUsuarios($item,$valor)
    {
        $rptListU = UsuariosModelo::mdlListarUsuarios($item, $valor);
        return $rptListU;
    }
}
