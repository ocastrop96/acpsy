<?php
require_once "../../../app/controller/AtencionesControlador.php";
require_once "../../../app/model/AtencionesModel.php";

class ajaxDatosCuenta
{
    public $idCuenta;
    public function ajaxListarDatosCuenta()
    {
        $valorCuenta = $this->idCuenta;
        $datosCuenta = AtencionesControlador::ctrTraerDatosCuenta($valorCuenta);
        $totalData = count($datosCuenta);

        $data = "<table class='table  table-responsive p-0 table-hover text-nowrap'>
        <thead>
          <tr>
            <th>#</th>
            <th>N° Episodio</th>
            <th>N° HC</th>
            <th>N° Doc</th>
            <th>Paciente</th>
            <th>Fecha de Ingreso</th>
            <th>Estado</th>
            <th>Servicio</th>
          </tr>
        </thead>
        <tbody>";
        // Cabecera
        if ($totalData > 0) {
            foreach ($datosCuenta as $key => $value) {
                // Condiciones para estado
                if ($value["IdCondicionAlta"] == 1 || $value["IdCondicionAlta"] == 2 || $value["IdCondicionAlta"] == 3) {
                    $estadoPac = "ALTA";
                } else if ($value["IdCondicionAlta"] == 4) {
                    $estadoPac = "FALLECIDO";
                } else {
                    $estadoPac = "HOSPITALIZADO";
                }
                // Condiciones para estado
                $data .= "<tr>
                    <td><div class='btn-group'><button type='button' class='btn btn-success btnSelecCuenta' id='btnSelecCuenta' idCuenta='$value[IdCuentaAtencion]' idEpisodio='$value[IdEpisodio]' onclick='seleccionarAtencion($value[IdCuentaAtencion],$value[IdEpisodio])'><i class='fas fa-mouse-pointer'></i></button></div></td>
                    <td>$value[NumEpisodio]</td>
                    <td>$value[NroHistoriaClinica]</td>
                    <td>$value[DescripcionAbrev]-$value[NroDocumento]</td>
                    <td>$value[PrimerNombre] $value[SegundoNombre] $value[ApellidoPaterno] $value[ApellidoMaterno]</td>
                    <td>$value[FechaIngreso]</td>
                    <td>$estadoPac</td>
                    <td>$value[Nombre]</td>
                </tr>";
            }
        } else {
            $data .= "<tr>
                    <td>SIN DATOS</td>
                    <td>SIN DATOS</td>
                    <td>SIN DATOS</td>
                    <td>SIN DATOS</td>
                    <td>SIN DATOS</td>
                    <td>SIN DATOS</td>
                    <td>SIN DATOS</td>
                    <td>SIN DATOS</td>
                </tr>";
        }
        $data .= "</tbody></table>";
        echo $data;
    }

    public $idCuenta2;
    public $idEpisodio;

    public function ajaxCargarDatosCuenta()
    {
        $valor = $this->idCuenta2;
        $valor2 = $this->idEpisodio;
        $respuesta = AtencionesControlador::ctrCargarDatosCuenta($valor, $valor2);
        echo json_encode($respuesta);
    }
}
if (isset($_POST["cuenta"])) {
    $list1 = new ajaxDatosCuenta();
    $list1->idCuenta = $_POST["cuenta"];
    $list1->ajaxListarDatosCuenta();
}

if (isset($_POST["idCuenta"])) {
    $list2 = new ajaxDatosCuenta();
    $list2->idCuenta2 = $_POST["idCuenta"];
    $list2->idEpisodio = $_POST["idEpisodio"];
    $list2->ajaxCargarDatosCuenta();
}
