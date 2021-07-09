<?php
class Conexion
{
	static public function conectar()
	{
		$link = new PDO(
			"mysql:host=localhost;dbname=acpsy",
			"adm-acpsy",
			'ldX7aMq4a$TS$7aBTKuD'
		);
		$link->exec("set names utf8");
		return $link;
	}
}
