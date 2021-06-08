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
                if ($value["IdCondicionAlta"] != 4 || $value["IdCondicionAlta"] != "") {
                    $estadoPac = "HOSPITALIZADO";
                } else if ($value["IdCondicionAlta"] == 4) {
                    $estadoPac = "FALLECIDO";
                } else {
                    $estadoPac = "ALTA";
                }
                // Condiciones para estado
                $data .= "<tr>
                    <td><div class='btn-group'><button class='btn btn-success btnSelecCuenta' idCuenta='' idEpisodio=''><i class='fas fa-mouse-pointer'></i></button></div></td>
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
}
if (isset($_POST["cuenta"])) {
    $list1 = new ajaxDatosCuenta();
    $list1->idCuenta = $_POST["cuenta"];
    $list1->ajaxListarDatosCuenta();
}
