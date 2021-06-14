<?php
require_once "../../../app/controller/FamiliaresControlador.php";
require_once "../../../app/model/FamiliaresModelo.php";
require_once "../../../app/model/dbConnect.php";


class AjaxFamiliares
{
    public $dato;
    public function ajaxBuscarPaciente1()
    {
        $valorTermino = $this->dato;

        $stmt = Conexion::conectar()->prepare("CALL BUSCAR_PACIENTE('$valorTermino')");
        $stmt->execute();
        $data = array();
        while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
            $data[] = array("id" => $row['idAtencion'], "text" => $row['cuentaAtencion'] . ' || ' . $row['tipdocAtencion'] . '-' . $row['nrodocAtencion'] . ' - ' . $row['paciente']);

            // $data[] = array("id" => $row['idAtencion'], "text" => $row['cuentaAtencion'] . ' - ' . $row['paciente']. ' - ' . $row['detaEstadoPacAtencion']);
        }
        echo json_encode($data);
    }
}
if (isset($_POST["searchTerm"])) {
    $list1 = new AjaxFamiliares();
    $list1->dato = $_POST["searchTerm"];
    $list1->ajaxBuscarPaciente1();
}
