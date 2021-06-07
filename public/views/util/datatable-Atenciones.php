<?php
require_once "../../../app/controller/AtencionesControlador.php";
require_once "../../../app/model/AtencionesModel.php";

class DatatableAtenciones
{
    public function mostrarTablaAtenciones()
    {
        $item = null;
        $valor = null;
        $atenciones = AtencionesControlador::ctrListarAtenciones($item, $valor);
        $datos_json = '{
            "data": [';

        for ($i = 0; $i < count($atenciones); $i++) {
            // Estado de Paciente
            if ($atenciones[$i]["idEstadoPacAtencion"] == 1) {
                $estadoPaciente = "<button type='button' class='btn btn-block btn-warning font-weight-bold' data-toggle='tooltip' data-placement='left' title='".$atenciones[$i]["detaEstadoPacAtencion"]."'><i class='fas fa-procedures'></i></button>";
            } elseif ($atenciones[$i]["idEstadoPacAtencion"] == 2) {
                $estadoPaciente = "<button type='button' class='btn btn-block btn-success font-weight-bold' data-toggle='tooltip' data-placement='left' title='".$atenciones[$i]["detaEstadoPacAtencion"]."'><i class='fas fa-walking'></i></button>";
            } else {
                $estadoPaciente = "<button type='button' class='btn btn-block btn-danger font-weight-bold' data-toggle='tooltip' data-placement='left' title='".$atenciones[$i]["detaEstadoPacAtencion"]."'><i class='fas fa-clinic-medical'></i></button>";
            }
            // Estado de Paciente

            // Estado de Atención
            if ($atenciones[$i]["idEstadoAte"] == 1) {
                $estadoAtencion = "<button type='button' class='btn btn-block btn-success font-weight-bold'><i class='fas fa-clipboard-list'></i> " . $atenciones[$i]["detaEstadoAte"] . "</button>";
            } elseif ($atenciones[$i]["idEstadoAte"] == 2) {
                $estadoAtencion = "<button type='button' class='btn btn-block btn-danger font-weight-bold'><i class='fa fa-ban'></i> " . $atenciones[$i]["detaEstadoAte"] . "</button>";
            } else {
                $estadoAtencion = "<button type='button' class='btn btn-block btn-info font-weight-bold'><i class='fa fa-check'></i> " . $atenciones[$i]["detaEstadoAte"] . "</button>";
            }
            // Estado de Atención
            // Botones de Opciones
            $botones = "<div class='btn-group'><button class='btn btn-warning btnEditarAtencion' idAtencion='" . $atenciones[$i]["idAtencion"] . "' data-toggle='modal' data-target='#modal-editar-atencion'><i class='fas fa-edit'></i></button><button class='btn btn-info btnVerAtencion' data-toggle='tooltip' data-placement='left' title='Ver Ficha de  Atención' idAtencion='" . $atenciones[$i]["idAtencion"] . "'><i class='fas fa-file-medical-alt'></i></button><button class='btn btn-secondary btnAnularAtencion' data-toggle='tooltip' data-placement='left' title='Anular Atención' idAtencion='" . $atenciones[$i]["idAtencion"] . "'><i class='fas fa-power-off'></i></button></div>";

            $datos_json .= '[
                "' . ($i + 1) . '",
                "' . $atenciones[$i]["correlativo_Atencion"] . '",
                "' . $atenciones[$i]["fRegistroAtencion"] . '",
                "' . $atenciones[$i]["cuentaAtencion"] . '",
                "' . $atenciones[$i]["historiaAtencion"] . '",
                "' . $atenciones[$i]["tipdocAtencion"] . '-' . $atenciones[$i]["nrodocAtencion"] . '",
                "' . $atenciones[$i]["fIngresoAtencion"] . '",
                "' . $estadoPaciente . '",
                "' . $atenciones[$i]["apPaternoAtencion"] . ' ' . $atenciones[$i]["apMaternoAtencion"] . ' ' . $atenciones[$i]["nombAtencion"] . '",
                "' . $atenciones[$i]["financiaAtencion"] . '",
                "' . $estadoAtencion . '",
                "' . $botones . '"
            ],';
        }
        $datos_json = substr($datos_json, 0, -1);
        $datos_json .= ']
        }';
        echo $datos_json;
    }
}
$tablaDiagnosticos = new DatatableAtenciones();
$tablaDiagnosticos->mostrarTablaAtenciones();
