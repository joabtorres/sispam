<?php

/*
 * config.php  - Este arquivo contem informações referente a: Conexão com banco de dados e URL Pádrão
 */

require 'environment.php';
$config = array();
if (ENVIRONMENT == 'development') {
    //Raiz
    define("BASE_URL", "http://localhost/sispam/");
    //nome do projeto
    define("NAME_PROJECT", "SISPAM - Sistema de Procedimentos Ambientais");
    //Nome do banco
    $config['dbname'] = 'sispam';
    //host
    $config['host'] = 'localhost';
    //usuario
    $config['dbuser'] = 'root';
    //senha
    $config['dbpass'] = '';
} else {
     //Raiz
    define("BASE_URL", "https://localhost/sispam/");
    //nome do projeto
    define("NAME_PROJECT", "SISPAM - Sistema de Procedimentos Ambientais");
    //Nome do banco
    $config['dbname'] = 'sispam';
    //host
    $config['host'] = 'localhost';
    //usuario
    $config['dbuser'] = 'root';
    //senha
    $config['dbpass'] = '';
}
?>
