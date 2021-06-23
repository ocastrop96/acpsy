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

    public $dato2;
    public function ajaxBuscarPaciente2()
    {
        $valorTermino = $this->dato2;

        $stmt = Conexion::conectar()->prepare("CALL BUSCAR_PACIENTE('$valorTermino')");
        $stmt->execute();
        $data = array();
        while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
            $data[] = array("id" => $row['idAtencion'], "text" => $row['cuentaAtencion'] . ' || ' . $row['tipdocAtencion'] . '-' . $row['nrodocAtencion'] . ' - ' . $row['paciente'] . ' || ESTADO : ' . $row['detaEstadoPacAtencion']);
        }
        echo json_encode($data);
    }


    public $idFamiliar;
    public function ajaxListarFamiliar()
    {
        $item = "idFamiliar";
        $valor = $this->idFamiliar;
        $respuesta = FamiliaresControlador::ctrListarFamiliares($item, $valor);
        echo json_encode($respuesta);
    }

    // Validar Cuenta existente
    public $Paciente;
    public $dniFamiliar;
    public function ajaxValidarFamiliar()
    {
        $valor1 = $this->Paciente;
        $valor2 = $this->dniFamiliar;
        $respuesta = FamiliaresControlador::ctrValidarFamiliar($valor1, $valor2);
        echo json_encode($respuesta);
    }
    // Validar Cuenta existente
}
// Búsqueda de paciente
if (isset($_POST["searchTerm"])) {
    $list1 = new AjaxFamiliares();
    $list1->dato = $_POST["searchTerm"];
    $list1->ajaxBuscarPaciente1();
}
// Búsqueda de paciente
if (isset($_POST["searchTerm2"])) {
    $list2 = new AjaxFamiliares();
    $list2->dato = $_POST["searchTerm2"];
    $list2->ajaxBuscarPaciente2();
}
// Búsqueda de paciente

// Listar Familiar
if (isset($_POST["idFamiliar"])) {
    $list1 = new AjaxFamiliares();
    $list1->idFamiliar = $_POST["idFamiliar"];
    $list1->ajaxListarFamiliar();
}
// Listar Familiar
// Validar Familiar
if (isset($_POST["Paciente"])) {
    $validFa = new AjaxFamiliares();
    $validFa->Paciente = $_POST["Paciente"];
    $validFa->dniFamiliar = $_POST["dniFamiliar"];
    $validFa->ajaxValidarFamiliar();
}
