<?php

class patrimonioController extends controller {

    public function index() {
        
    }

    public function cadastro() {
        if ($this->checkUser()) {
            $viewName = "patrimonio/cadastro";
            $dados = array();
            $crudModel = new crud_db();
            $dados['setores'] = $crudModel->read("SELECT * FROM setor");
            $dados['status'] = $crudModel->read("SELECT * FROM patrimonio_status");
            $dados['tombamentos'] = $crudModel->read("SELECT * FROM patrimonio_tombamento");
            $dados['fonte_recursos'] = $crudModel->read("SELECT * FROM patrimonio_fonte_recurso");
            $dados['classificacao'] = $crudModel->read("SELECT * FROM patrimonio_classificacao");

            if (isset($_POST['nSalvar']) && !empty($_POST['nSalvar'])) {
                $patrimonio = array();
                //setor
                $patrimonio['setor_id'] = addslashes($_POST['nSetor']);
                //usuario
                $patrimonio['item'] = addslashes($_POST['nItem']);
                //status
                $patrimonio['status_tombamento_id'] = addslashes($_POST['nStatusTombamento']);
                $patrimonio['numero_tombamento'] = addslashes($_POST['nNumeroTombamento']);
                $patrimonio['status_id'] = addslashes($_POST['nStatus']);
                $patrimonio['classificacao_id'] = addslashes($_POST['nClassificao']);
                $patrimonio['fonte_recurso_id'] = addslashes($_POST['nRecurso']);
                $patrimonio['valor'] = addslashes($_POST['nValor']);
                $patrimonio['ano_aquisicao'] = addslashes($_POST['nAquisicao']);
                $patrimonio['dir_hash'] = $this->hash_md5();
                //assunto
                $patrimonio['descricao'] = addslashes($_POST['nDescricao']);
                //data
                $patrimonio['data'] = $this->getDataNow();

                if (isset($_FILES['nFile']) && $_FILES['nFile']['error'] == 0) {
                    $patrimonio['anexo'] = $this->upload_file($_FILES['nFile'], $patrimonio['dir_hash']);
                    if (!empty($_POST['nFileEnviado'])) {
                        $crudModel->delete_file($_POST['nFileEnviado']);
                    }
                } else {
                    $patrimonio['anexo'] = addslashes($_POST['nFileEnviado']);
                }
                $resultado = $crudModel->create("INSERT INTO patrimonio (setor_id, item, status_tombamento_id, numero_tombamento, ano_aquisicao, status_id, classificacao_id, fonte_recurso_id, valor, descricao, anexo, data, dir_hash) VALUES (:setor_id, :item, :status_tombamento_id, :numero_tombamento, :ano_aquisicao, :status_id, :classificacao_id, :fonte_recurso_id, :valor, :descricao, :anexo, :data, :dir_hash)", $patrimonio);
                if ($resultado) {
                    $dados['erro'] = array('class' => 'alert-success', 'msg' => '<i class="fa fa-check-circle" aria-hidden="true"></i> Cadastro realizado com sucesso!');
                } else {
                    $dados['patrimonio'] = $patrimonio;
                }
            }

            $this->loadTemplate($viewName, $dados);
        } else {
            $url = "location: " . BASE_URL . "home";
            header($url);
        }
    }

    public function editar($id) {
        if ($this->checkUser()) {
            $viewName = "patrimonio/editar";
            $dados = array();
            $crudModel = new crud_db();
            $dados['setores'] = $crudModel->read("SELECT * FROM setor");
            $dados['status'] = $crudModel->read("SELECT * FROM patrimonio_status");
            $dados['tombamentos'] = $crudModel->read("SELECT * FROM patrimonio_tombamento");
            $dados['fonte_recursos'] = $crudModel->read("SELECT * FROM patrimonio_fonte_recurso");
            $dados['classificacao'] = $crudModel->read("SELECT * FROM patrimonio_classificacao");
            $dados['patrimonio'] = $crudModel->read_specific('SELECT * FROM patrimonio WHERE md5(id)=:id', array('id' => $id));

            if (isset($_POST['nSalvar']) && !empty($_POST['nSalvar'])) {
                $patrimonio = array();
                //id
                $patrimonio['id'] = addslashes($_POST['nId']);
                $patrimonio['setor_id'] = addslashes($_POST['nSetor']);
                $patrimonio['item'] = addslashes($_POST['nItem']);
                $patrimonio['status_tombamento_id'] = addslashes($_POST['nStatusTombamento']);
                $patrimonio['numero_tombamento'] = addslashes($_POST['nNumeroTombamento']);
                $patrimonio['status_id'] = addslashes($_POST['nStatus']);
                $patrimonio['classificacao_id'] = addslashes($_POST['nClassificao']);
                $patrimonio['fonte_recurso_id'] = addslashes($_POST['nRecurso']);
                $patrimonio['valor'] = addslashes($_POST['nValor']);
                $patrimonio['ano_aquisicao'] = addslashes($_POST['nAquisicao']);
                $patrimonio['descricao'] = addslashes($_POST['nDescricao']);

                if (isset($_FILES['nFile']) && $_FILES['nFile']['error'] == 0) {
                    $patrimonio['anexo'] = $this->upload_file($_FILES['nFile'], $patrimonio['dir_hash']);
                    if (!empty($_POST['nFileEnviado'])) {
                        $crudModel->delete_file($_POST['nFileEnviado']);
                    }
                } else {
                    $patrimonio['anexo'] = addslashes($_POST['nFileEnviado']);
                }
                $resultado = $crudModel->update("UPDATE patrimonio SET setor_id=:setor_id, item=:item, status_tombamento_id=:status_tombamento_id, numero_tombamento=:numero_tombamento, ano_aquisicao=:ano_aquisicao, status_id=:status_id, classificacao_id=:classificacao_id, fonte_recurso_id=:fonte_recurso_id, valor=:valor, descricao=:descricao, anexo=:anexo WHERE id = :id", $patrimonio);
                if ($resultado) {
                    $dados['erro'] = array('class' => 'alert-success', 'msg' => '<i class="fa fa-check-circle" aria-hidden="true"></i> Alteração realizada com sucesso!');
                } else {
                    $dados['patrimonio'] = $patrimonio;
                }
            }

            $this->loadTemplate($viewName, $dados);
        } else {
            $url = "location: " . BASE_URL . "home";
            header($url);
        }
    }

    public function patrimonio($id) {
        if ($this->checkUser()) {
            $viewName = "patrimonio/patrimonio";
            $dados = array();
            $crudModel = new crud_db();
            $dados['result'] = $crudModel->read_specific('SELECT p.*, s.nome as setor, ps.status, pt.tombamento, pc.classificacao, pfr.fonte_recurso FROM patrimonio AS P INNER JOIN setor AS s INNER JOIN patrimonio_status AS ps INNER JOIN patrimonio_tombamento AS pt INNER JOIN patrimonio_classificacao AS pc INNER JOIN patrimonio_fonte_recurso AS pfr WHERE p.setor_id=s.id AND p.status_id=ps.id AND p.status_tombamento_id=pt.id AND p.classificacao_id=pc.id AND p.fonte_recurso_id=pfr.id AND md5(p.id)=:id', array('id' => $id));
            $this->loadTemplate($viewName, $dados);
        } else {
            $url = "location: " . BASE_URL . "home";
            header($url);
        }
    }

    public function consultar($page = 1) {
        if ($this->checkUser()) {
            $view = "patrimonio/consulta";
            $dados = array();
            $crudModel = new crud_db();
            $dados['setores'] = $crudModel->read("SELECT * FROM setor");
            $dados['status'] = $crudModel->read("SELECT * FROM patrimonio_status");
            $dados['tombamentos'] = $crudModel->read("SELECT * FROM patrimonio_tombamento");
            $dados['fonte_recursos'] = $crudModel->read("SELECT * FROM patrimonio_fonte_recurso");
            $dados['classificacao'] = $crudModel->read("SELECT * FROM patrimonio_classificacao");

            $sql = "SELECT p.*, s.nome as setor, ps.status, pt.tombamento, pc.classificacao, pfr.fonte_recurso FROM patrimonio AS P INNER JOIN setor AS s INNER JOIN patrimonio_status AS ps INNER JOIN patrimonio_tombamento AS pt INNER JOIN patrimonio_classificacao AS pc INNER JOIN patrimonio_fonte_recurso AS pfr WHERE p.setor_id=s.id AND p.status_id=ps.id AND p.status_tombamento_id=pt.id AND p.classificacao_id=pc.id AND p.fonte_recurso_id=pfr.id ";
            $arrayForm = array();
            if (isset($_GET['nBuscarBT'])) {
                $parametros = "nSetor=" . $_GET['nSetor'] . "&nStatus=" . $_GET['nStatus'] . "&nTombamento=" . $_GET['nTombamento'] . "&nRecurso=" . $_GET['nRecurso'] . "&nClassificacao=" . $_GET['nClassificacao'] . "&nSelectBuscar=" . $_GET['nSelectBuscar'] . "&nCampo=" . $_GET['nCampo'] . "&nBuscarBT=BuscarBT";

                //setor
                if (!empty($_GET['nSetor'])) {
                    $sql .= " AND p.setor_id=:id_setor ";
                    $arrayForm['id_setor'] = addslashes($_GET['nSetor']);
                }
                //nStatus
                if (!empty($_GET['nStatus'])) {
                    $sql .= " AND p.status_id=:status_id ";
                    $arrayForm['status_id'] = addslashes($_GET['nStatus']);
                }
                //nTombamento
                if (!empty($_GET['nTombamento'])) {
                    $sql .= " AND p.status_tombamento_id =:status_tombamento_id";
                    $arrayForm['status_tombamento_id '] = addslashes($_GET['nTombamento']);
                }
                //nRecurso
                if (!empty($_GET['nRecurso'])) {
                    $sql .= " AND p.fonte_recurso_id =:fonte_recurso_id";
                    $arrayForm['fonte_recurso_id'] = addslashes($_GET['nRecurso']);
                }
                //nClassificacao
                if (!empty($_GET['nClassificacao'])) {
                    $sql .= " AND p.classificacao_id =:classificacao_id ";
                    $arrayForm['classificacao_id'] = addslashes($_GET['nClassificacao']);
                }
                //nSelectBuscar
                if (!empty($_GET['nSelectBuscar'])) {
                    $opcaoSelecionada = $_GET['nSelectBuscar'];
                    $campo = addslashes($_GET['nCampo']);
                    switch ($opcaoSelecionada) {
                        case 'item':
                            $sql .= " AND p.item LIKE '%" . $campo . "%' ";
                            break;
                        case 'numero_tombamento':
                            $sql .= " AND p.numero_tombamento LIKE '%" . $campo . "%' ";
                            break;
                        case 'ano_aquisicao':
                            $sql .= " AND p.ano_aquisicao LIKE '%" . $campo . "%' ";
                            break;
                        case 'valor':
                            $sql .= " AND p.valor LIKE '%" . $campo . "%' ";
                            break;
                    }
                }
                //paginacao
                $limite = 50;
                $total_registro = $crudModel->read($sql, $arrayForm);
                $total_registro = empty($total_registro) ? array() : $total_registro;
                $paginas = count($total_registro) / $limite;
                $indice = 0;
                $pagina_atual = (isset($page) && !empty($page)) ? addslashes($page) : 1;
                $indice = ($pagina_atual - 1) * $limite;
                $dados["paginas"] = $paginas;
                $dados["pagina_atual"] = $pagina_atual;
                $dados['metodo_buscar'] = $parametros;
                $sql .= "  ORDER BY p.id ASC LIMIT $indice,$limite ";
                $patrimonios = $crudModel->read($sql, $arrayForm);
            } else {
                //paginacao
                $limite = 50;
                $total_registro = $crudModel->read_specific("SELECT COUNT(id) AS qtd FROM patrimonio");
                $paginas = $total_registro['qtd'] / $limite;
                $indice = 0;
                $pagina_atual = (isset($page) && !empty($page)) ? addslashes($page) : 1;
                $indice = ($pagina_atual - 1) * $limite;
                $dados["paginas"] = $paginas;
                $dados["pagina_atual"] = $pagina_atual;
                $dados['metodo_buscar'] = "";
                $sql .= " ORDER BY p.id asc LIMIT $indice,$limite";
                $patrimonios = $crudModel->read($sql);
            }
            $dados['patrimonios'] = $patrimonios;
            $this->loadTemplate($view, $dados);
        } else {
            $url = "location: " . BASE_URL . "home";
            header($url);
        }
    }
    
    public function excluir($id) {
         if ($this->checkUser() && $this->checkSetor() == 10) {
            $crudModel = new crud_db();
            $resultado = $crudModel->read_specific("SELECT * FROM patrimonio WHERE md5(id)=:id", array('id' => addslashes($id)));
            $crudModel->delete_file($resultado['anexo']);
            if ($crudModel->remove("DELETE FROM patrimonio WHERE md5(id)=:cod", array('cod' => addslashes($id)))) {
                $url = "location: " . BASE_URL . 'patrimonio/consultar/1';
                header($url);
            }
        } else {
            $url = "location: " . BASE_URL . "home";
            header($url);
        }
    }

    private function upload_file($file, $dir_hash) {
        $arquivo = array();
        $arquivo['temp'] = $file['tmp_name'];
        $arquivo['extensao'] = explode(".", $file['name']);
        $arquivo['extensao'] = strtolower(end($arquivo['extensao']));
        $arquivo['name'] = date('d-m-Y') . "_" . md5(md5(rand(1000, 900000) . time())) . '.' . $arquivo['extensao'];
        $arquivo['diretorio'] = 'uploads/patrimonio/' . $dir_hash;
        //criando diretorio se não existi
        if (!is_dir($arquivo['diretorio'])) {
            mkdir($arquivo['diretorio'], 0777, TRUE);
        }
        $arquivo['arquivo'] = $arquivo['diretorio'] . "/" . $arquivo['name'];
        if (move_uploaded_file($arquivo['temp'], $arquivo['arquivo'])) {
            return $arquivo['arquivo'];
        } else {
            return 'NÃO MOVIDO';
        }
    }

}
