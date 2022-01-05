<?php

class manualController extends controller {

    public function index() {
        if ($this->checkUser()) {
            $crudModel = new crud_db();
            $dados = array();
            $viewName = "manual";
            $this->loadTemplate($viewName, $dados);
        }
    }

}

?>