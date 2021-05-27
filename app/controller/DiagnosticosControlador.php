<?php
class DiagnosticosControlador
{
    static public function ctrListarDiagnosticos($item,$valor){
        $rptListDiag = DiagnosticosModelo::mdlListarDiagnosticos($item, $valor);
        return $rptListDiag;
    }
}
