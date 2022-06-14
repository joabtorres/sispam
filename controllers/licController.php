<?php

class licController extends controller {

    public function index() {
        $this->enquadramento();
    }

    public function get_enquadramento() {
        if (isset($_POST) && is_array($_POST) && !empty($_POST)) {
            $crudModel = new crud_db();
            $cod = addslashes($_POST['cod']);
            $resultado = $crudModel->read_specific("SELECT * FROM lic_enquadramento WHERE cod=:cod", array('cod' => $cod));
            echo json_encode($resultado, JSON_UNESCAPED_UNICODE);
        }
    }

    public function enquadramento() {
        if ($this->checkUser()) {
            $viewName = "lic/enquadramento";
            $dados = array();
            $crudModel = new crud_db();
            $dados['tipologias'] = $crudModel->read("SELECT * FROM lic_enquadramento ORDER BY tipologia ASC");
            // cadastro
            if (isset($_POST['nSalvar']) && !empty($_POST['nSalvar'])) {
                $cadForm = array();
                //id
                if (!empty($_POST['nId'])) {
                    $cadForm['cod'] = addslashes($_POST['nId']);
                }
                $cadForm['medida'] = addslashes($_POST['nLimite']);
                $resultado = $crudModel->read_specific("SELECT p.porte, p.limite_minimo, p.limite_maximo, e.* FROM lic_enquadramento as e INNER JOIN lic_enquadramento_porte as p WHERE e.cod=p.cod_enquadramento AND p.cod_enquadramento=:cod AND ((p.limite_minimo<:medida and p.limite_maximo>=:medida) OR (p.limite_minimo<:medida and p.limite_maximo=0)) LIMIT 1", $cadForm);
                if (is_array($resultado)) {
                    $resultado['medida'] = $cadForm['medida'];
                    $resultado['valor_taxa'] = $crudModel->read("SELECT * FROM lic_enquadramento_valor_taxa WHERE porte=:porte and potencial=:potencial", array('porte' => $resultado['porte'], 'potencial' => $resultado['potencial']));
                }

                $dados['resultado_enquadramento'] = $resultado;
            }
            $this->loadTemplate($viewName, $dados);
        }
    }

}
