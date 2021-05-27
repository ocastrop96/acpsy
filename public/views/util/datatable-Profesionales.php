<?php
// LLamada a controlador
require_once "../../../app/controller/ProfesionalesControlador.php";
// LLamada a modelo
require_once "../../../app/model/ProfesionalesModelo.php";

// require_once "../../app/model/UsuariosModelo.php";

class DatatableProfesionales
{
    public function mostrarTablaProfesionales()
    {
        $item = null;
        $valor = null;
        $profesionales = ProfesionalesControlador::ctrListarProfesionales($item, $valor);
        $datos_json = '{
            "data": [';

        for ($i = 0; $i < count($profesionales); $i++) {

            // Botones de Opciones
            $botones = "<div class='btn-group'><button class='btn btn-warning btnEditarProfesional' idProfesional='" . $profesionales[$i]["idProfesional"] . "' data-toggle='modal' data-target='#modal-editar-profesional'><i class='fas fa-edit'></i></button><button class='btn btn-danger btnEliminarProfesional' data-toggle='tooltip' data-placement='left' title='Eliminar Profesional' idProfesional='" . $profesionales[$i]["idProfesional"] . "'><i class='fas fa-trash-alt'></i></button></div>";

            $datos_json .= '[
                "' . ($i + 1) . '",
                "' . $profesionales[$i]["dniProfesional"] . '",
                "' . $profesionales[$i]["cpspProfesional"] . '",
                "' . $profesionales[$i]["nombresProfesional"] . '",
                "' . $profesionales[$i]["apellidosProfesional"] . '",
                "' . $profesionales[$i]["detaCondicion"] . '",
                "' . $botones . '"
            ],';
        }
        $datos_json = substr($datos_json, 0, -1);
        $datos_json .= ']
        }';
        echo $datos_json;
    }
}
// Llamamos a la tabla de Usuarios
$tablaProfesionales = new DatatableProfesionales();
$tablaProfesionales->mostrarTablaProfesionales();
