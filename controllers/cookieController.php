<?php

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Scripting/PHPClass.php to edit this template
 */

/**
 * Description of cookie
 *
 * @author joab
 */
class cookieController extends controller {

    public function index() {
        $x = unserialize($_COOKIE['usuario']);
        print_r($x);
    }

}
