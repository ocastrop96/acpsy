<?php
class ConexionConsulta
{
    static public function conectar()
    {
        $link = new PDO(
            'sqlsrv:Server=OPTIMUS\PRIME;Database=SIGH',
            'sa',
            '123456'
        );
        $link->exec("set names utf8");
        return $link;
    }
}
