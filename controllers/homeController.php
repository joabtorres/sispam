<?php

class homeController extends controller {

    public function index() {
        if ($this->checkUser()) {
            $crudModel = new crud_db();
            $dados = array();
            $dados['protocolo_tipo'] = $crudModel->read("SELECT * FROM protocolo_tipo");
            $dados['protocolo_objetivo'] = $crudModel->read("SELECT * FROM protocolo_objetivo ORDER BY objetivo ASC");
            $dados['tramitacoes'] =  $crudModel->read("SELECT pt.tipo as label, COUNT(*) AS data FROM protocolo_tipo AS pt INNER JOIN protocolo AS p WHERE pt.id=p.tipo_id GROUP BY p.tipo_id ORDER BY pt.id ASC");
            $dados['suporte_interno'] = $crudModel->read("SELECT ca.assunto as label, COUNT(*) AS data FROM ti_chamado_assunto AS ca INNER JOIN ti_chamado AS c WHERE ca.id=c.assunto_id GROUP BY c.assunto_id ORDER BY data DESC");
            $dados['protocolos'] = $crudModel->read("SELECT po.objetivo as label, COUNT(*) AS data FROM protocolo_objetivo AS po INNER JOIN protocolo AS p WHERE po.id=p.objetivo_id GROUP BY p.objetivo_id ORDER BY data DESC");
            $viewName = "home";
            $this->loadTemplate($viewName, $dados);
        }
    }

}

?>