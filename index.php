<?php
//Iniciando a sessão:
// Tempo em segundos - 1 hora
ini_set('session.gc_maxlifetime', 30);

// Tempo em segundos - 1 hora
session_set_cookie_params(30);

if (session_status() !== PHP_SESSION_ACTIVE) {
    session_start();
}

require 'config.php';
require 'vendor/autoload.php';

spl_autoload_register(function ($class) {
    if (strpos($class, 'Controller') > -1) {
        if (file_exists('controllers/' . $class . '.php')) {
            require_once 'controllers/' . $class . '.php';
        }
    } elseif (file_exists('models/' . $class . '.php')) {
        require_once 'models/' . $class . '.php';
    } elseif (file_exists('core/' . $class . '.php')) {
        require_once 'core/' . $class . '.php';
    }
});

$core = new core();
$core->run();
?>