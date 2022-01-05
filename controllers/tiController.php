<?php

class tiController extends controller {

    public function index() {
        $this->cadastro();
    }

    public function getusuarios() {
        if ($this->checkUser()) {
            if (isset($_POST) && is_array($_POST) && !empty($_POST)) {
                $crudModel = new crud_db();
                $setor_id = addslashes($_POST['setor_id']);
                if (isset($_POST['id_user']) && ($_POST['id_user'] != 'undefined')) {
                    $user_id = addslashes($_POST['id_user']);
                    ECHO $user_id;
                }
                if (!isset($user_id)) {
                    echo '<option value="" selected = "selected" disabled="disabled">Selecione o solícitante</option>';
                }

                $usuarios = $crudModel->read("SELECT * FROM usuario WHERE status=1 AND setor_id=:id", array('id' => $setor_id));
                if (!empty($usuarios) && is_array($usuarios)) {
                    foreach ($usuarios as $indice) {
                        if (isset($user_id) && $indice['id'] == $user_id) {
                            echo '<option value = "' . $indice['id'] . '" selected = "selected">' . $indice['nome'] . '</option>';
                        } else {
                            echo '<option value = "' . $indice['id'] . '">' . $indice['nome'] . '</option>';
                        }
                    }
                }
            }
        }
    }

    public function getusuariossearch() {
        if (isset($_POST) && is_array($_POST) && !empty($_POST)) {
            $crudModel = new crud_db();
            $setor_id = addslashes($_POST['setor_id']);
            if (isset($_POST['id_user'])) {
                $user_id = addslashes($_POST['id_user']);
            }
            if (!isset($user_id)) {
                echo '<option value="" selected = "selected" >Todos </option>';
            }

            $usuarios = $crudModel->read("SELECT * FROM usuario WHERE status=1 AND setor_id=:id", array('id' => $setor_id));

            foreach ($usuarios as $indice) {
                if (isset($user_id) && $indice['id'] == $user_id) {
                    echo '<option value = "' . $indice['id'] . '" selected = "selected">' . $indice['nome'] . '</option>';
                } else {
                    echo '<option value = "' . $indice['id'] . '">' . $indice['nome'] . '</option>';
                }
            }
        }
    }

    public function cadastro() {
        if ($this->checkUser()) {
            $viewName = "ti/cadastro";
            $dados = array();
            $crudModel = new crud_db();
            $dados['setores'] = $crudModel->read("SELECT * FROM setor");
            $dados['assuntos'] = $crudModel->read("SELECT * FROM ti_chamado_assunto ORDER BY assunto ASC");

            if (isset($_POST['nSalvar']) && !empty($_POST['nSalvar'])) {
                $chamado = array();
                //setor
                $chamado['setor_id'] = addslashes($_POST['nSetor']);
                //usuario
                $chamado['usuario_id'] = addslashes($_POST['nUsuario']);
                //status
                $chamado['status_id'] = '1';
                //assunto
                $chamado['assunto_id'] = addslashes($_POST['nAssunto']);
                //data
                $chamado['data'] = $this->getDataNow();
                //descricao
                $chamado['descricao'] = addslashes($_POST['nDescricao']);

                if (isset($_FILES['nFile']) && $_FILES['nFile']['error'] == 0) {
                    $chamado['anexo'] = $this->upload_file($_FILES['nFile']);
                    if (!empty($_POST['nFileEnviado'])) {
                        $crudModel->delete_file($_POST['nFileEnviado']);
                    }
                } else {
                    $chamado['anexo'] = addslashes($_POST['nFileEnviado']);
                }
                $resultado = $crudModel->create("INSERT INTO ti_chamado (setor_id, usuario_id, status_id, assunto_id, data, descricao, anexo) VALUES (:setor_id, :usuario_id, :status_id, :assunto_id, :data, :descricao, :anexo) ", $chamado);
                if ($resultado) {
                    $dados['erro'] = array('class' => 'alert-success', 'msg' => '<i class="fa fa-check-circle" aria-hidden="true"></i> Cadastro realizado com sucesso!');
                } else {
                    $dados['chamado'] = $chamado;
                }
            }
            $this->loadTemplate($viewName, $dados);
        } else {
            $url = "location: " . BASE_URL . "home";
            header($url);
        }
    }

    public function consultar($page = 1) {
        if ($this->checkUser()) {
            $view = "ti/consulta";
            $dados = array();
            $crudModel = new crud_db();
            $dados['setores'] = $crudModel->read("SELECT * FROM setor");
            $dados['usuarios'] = $crudModel->read("SELECT * FROM usuario");
            $dados['assuntos'] = $crudModel->read("SELECT * FROM ti_chamado_assunto");
            $dados['chamado_status'] = $crudModel->read("SELECT * FROM ti_chamado_status");

            $sql = "SELECT c.*, tc.assunto, s.nome as setor, s.abreviacao, cs.nome as status, u.nome as usuario FROM ti_chamado AS c INNER JOIN ti_chamado_assunto AS tc INNER JOIN setor as s INNER JOIN ti_chamado_status as cs INNER JOIN usuario as u WHERE c.assunto_id = tc.id AND c.setor_id=s.id AND c.status_id=cs.id  AND c.usuario_id=u.id ";
            $arrayForm = array();
            if (isset($_GET['nBuscarBT'])) {
                $parametros = "nSetor=" . $_GET['nSetor'] . "&nUsuario=" . $_GET['nUsuario'] . "&nStatus=" . $_GET['nStatus'] . "&nAssunto=" . $_GET['nAssunto'] . "&nDataInicial=" . $_GET['nDataInicial'] . "&nDataFinal=" . $_GET['nDataFinal'] . "&nBuscarBT=BuscarBT";
             
                //setor
                if (!empty($_GET['nSetor'])) {
                    $sql .= " AND c.setor_id=:id_setor ";
                    $arrayForm['id_setor'] = addslashes($_GET['nSetor']);
                }
                //nUsuario
                if (!empty($_GET['nUsuario'])) {
                    $sql .= " AND u.id=:id_usuario ";
                    $arrayForm['id_usuario'] = addslashes($_GET['nUsuario']);
                }
                //setor
                if (!empty($_GET['nStatus'])) {
                    $sql .= " AND c.status_id=:id_status ";
                    $arrayForm['id_status'] = addslashes($_GET['nStatus']);
                }
                //aassunto
                if (!empty($_GET['nAssunto'])) {
                    $sql .= " AND c.assunto_id=:assunto_id ";
                    $arrayForm['assunto_id'] = addslashes($_GET['nAssunto']);
                }
                //nDataInicial e nDataFinal
                if (!empty($_GET['nDataInicial']) && !empty($_GET['nDataFinal'])) {
                    $data_inicial = $this->formatDateBD($_GET['nDataInicial']);
                    $data_final = $this->formatDateBD($_GET['nDataFinal']);
                    $sql .= " AND p.data BETWEEN '" . $data_inicial . "' AND '" . $data_final . "' ";
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
                $sql .= "  ORDER BY c.id ASC LIMIT $indice,$limite ";
                $chamados = $crudModel->read($sql, $arrayForm);
            } else {
                //paginacao
                $limite = 50;
                $total_registro = $crudModel->read_specific("SELECT COUNT(id) AS qtd FROM ti_chamado");
                $paginas = $total_registro['qtd'] / $limite;
                $indice = 0;
                $pagina_atual = (isset($page) && !empty($page)) ? addslashes($page) : 1;
                $indice = ($pagina_atual - 1) * $limite;
                $dados["paginas"] = $paginas;
                $dados["pagina_atual"] = $pagina_atual;
                $dados['metodo_buscar'] = "";
                $sql .= " ORDER BY c.id asc LIMIT $indice,$limite";
                $chamados = $crudModel->read($sql);
            }
            $dados['chamados'] = $chamados;
            $this->loadTemplate($view, $dados);
        } else {
            $url = "location: " . BASE_URL . "home";
            header($url);
        }
    }

    public function chamado($id = null) {
        if ($this->checkUser()) {
            $view = "ti/chamado";
            $dados = array();
            $crudModel = new crud_db();
            $dados['setores'] = $crudModel->read("SELECT * FROM setor");
            $dados['usuarios'] = $crudModel->read("SELECT * FROM usuario");
            $dados['chamado_status'] = $crudModel->read("SELECT * FROM ti_chamado_status");
            // cadastro
            if (isset($_POST['nSalvar']) && !empty($_POST['nSalvar'])) {
                $cadForm = array();
                $cadForm['chamado_id'] = addslashes($_POST['nChamado']);
                $cadForm['status_id'] = addslashes($_POST['nStatus']);
                $cadForm['usuario_id'] = $_SESSION['usuario']['id'];
                $cadForm['data'] = $this->formatDateBD($_POST['nData']);
                $cadForm['descricao'] = addslashes($_POST['nDescricao']);
                if (isset($_FILES['nFile']) && $_FILES['nFile']['error'] == 0) {
                    $cadForm['anexo'] = $this->upload_file($_FILES['nFile']);
                    if (!empty($_POST['nFileEnviado'])) {
                        $crudModel->delete_file($_POST['nFileEnviado']);
                    }
                } else {
                    $cadForm['anexo'] = addslashes($_POST['nFileEnviado']);
                }
                $resultado = $crudModel->create("INSERT INTO ti_chamado_historico (chamado_id, status_id, usuario_id , data, descricao, anexo) VALUES (:chamado_id, :status_id, :usuario_id , :data, :descricao, :anexo) ", $cadForm);
                if ($resultado) {
                    $crudModel->update('UPDATE ti_chamado SET status_id=:status WHERE id=:id', array('status' => $cadForm['status_id'], 'id' => $cadForm['chamado_id']));
                    $dados['erro'] = array('class' => 'alert-success', 'msg' => '<i class="fa fa-check-circle" aria-hidden="true"></i> Cadastro realizado com sucesso!');
                } else {
                    $dados['cadForm'] = $cadForm;
                }
            }

            $sql = "SELECT c.*, ca.assunto, s.nome as setor, s.abreviacao, cs.nome as status, u.nome as usuario, u.portaria, u.imagem FROM ti_chamado AS c INNER JOIN ti_chamado_assunto AS ca INNER JOIN setor as s INNER JOIN ti_chamado_status as cs INNER JOIN usuario as u WHERE c.assunto_id=ca.id AND c.setor_id=s.id AND c.status_id=cs.id  AND c.usuario_id=u.id AND md5(c.id)=:id";
            $arraySql = array('id' => $id);
            $chamados = $crudModel->read_specific($sql, $arraySql);
            $dados['chamado'] = $chamados;

            $chamados_historicos = $crudModel->read("SELECT h.*, cs.nome as status, u.nome as usuario, u.portaria, u.imagem, s.nome as setor, s.abreviacao FROM ti_chamado as c INNER JOIN ti_chamado_historico AS h INNER JOIN ti_chamado_status as cs INNER JOIN usuario as u INNER JOIN setor as s WHERE h.chamado_id=c.id AND h.status_id=cs.id  AND h.usuario_id=u.id AND u.setor_id=s.id AND h.chamado_id=:chamado ORDER BY h.id ASC", array('chamado' => $chamados['id']));
            $dados['chamados_historicos'] = $chamados_historicos;
            $this->loadTemplate($view, $dados);
        } else {
            $url = "location: " . BASE_URL . "home";
            header($url);
        }
    }

    public function editar($id) {
        if ($this->checkUser()) {
            $view = "ti/editar";
            $dados = array();
            $crudModel = new crud_db();
            $dados['setores'] = $crudModel->read("SELECT * FROM setor");
            $dados['assuntos'] = $crudModel->read("SELECT * FROM ti_chamado_assunto ORDER BY assunto ASC");
            $chamado = $crudModel->read_specific("SELECT * FROM ti_chamado where md5(id)=:id", array('id' => $id));
            if (!is_array($chamado)) {
                $url = "location: " . BASE_URL . "home";
                header($url);
            }
            $dados['chamado'] = $chamado;
            if (isset($_POST['nSalvar']) && !empty($_POST['nSalvar'])) {
                $chamado = array();
                //id
                $chamado['id'] = $_POST['nId'];
                //setor
                $chamado['setor_id'] = addslashes($_POST['nSetor']);
                //usuario
                $chamado['usuario_id'] = addslashes($_POST['nUsuario']);
                //status
                $chamado['status_id'] = $dados['chamado']['status_id'];
                //assunto
                $chamado['assunto_id'] = addslashes($_POST['nAssunto']);
                //descricao
                $chamado['descricao'] = addslashes($_POST['nDescricao']);

                if (isset($_FILES['nFile']) && $_FILES['nFile']['error'] == 0) {
                    $chamado['anexo'] = $this->upload_file($_FILES['nFile']);
                    if (!empty($_POST['nFileEnviado'])) {
                        $crudModel->delete_file($_POST['nFileEnviado']);
                    }
                } else {
                    $chamado['anexo'] = addslashes($_POST['nFileEnviado']);
                }
                $resultado = $crudModel->update("UPDATE ti_chamado SET setor_id=:setor_id, usuario_id=:usuario_id, status_id=:status_id, assunto_id=:assunto_id, descricao=:descricao, anexo=:anexo WHERE id=:id", $chamado);
                if ($resultado) {
                    $dados['erro'] = array('class' => 'alert-success', 'msg' => '<i class="fa fa-check-circle" aria-hidden="true"></i> Alteração realizada com sucesso!');
                    $dados['chamado'] = $chamado;
                } else {
                    $dados['chamado'] = $chamado;
                }
            }
            $this->loadTemplate($view, $dados);
        } else {
            $url = "location: " . BASE_URL . "home";
            header($url);
        }
    }

    public function excluirchamado($id) {
        if ($this->checkUser()) {
            $crudModel = new crud_db();
            $resultado = $crudModel->read("SELECT * FROM ti_chamado_historico WHERE md5(chamado_id)=:id", array('id' => addslashes($id)));
            if (is_array($resultado) && !empty($resultado)) {
                foreach ($resultado as $index) {
                    if (!empty($index['anexo'])) {
                        $crudModel->delete_file($index['anexo']);
                    }
                    $crudModel->remove("DELETE FROM ti_chamado_historico WHERE id=:id", array('id' => addslashes($index['id'])));
                }
            }
            $resultado = $crudModel->read_specific("SELECT * FROM ti_chamado WHERE md5(id)=:id", array('id' => addslashes($id)));
            if (is_array($resultado) && !empty($resultado['anexo'])) {
                $crudModel->delete_file($resultado['anexo']);
            }
            if ($crudModel->remove("DELETE FROM ti_chamado WHERE md5(id)=:cod", array('cod' => addslashes($id)))) {
                $url = "location: " . BASE_URL . 'ti/consultar/1';
                header($url);
            }
        } else {
            $url = "location: " . BASE_URL . "home";
            header($url);
        }
    }

    public function excluirhistorico($id) {
        if ($this->checkUser()) {
            $crudModel = new crud_db();
            $resultado = $crudModel->read_specific("SELECT * FROM ti_chamado_historico WHERE md5(id)=:id", array('id' => addslashes($id)));
            if (is_array($resultado) && !empty($resultado['anexo'])) {
                $crudModel->delete_file($resultado['anexo']);
            }
            if ($crudModel->remove("DELETE FROM ti_chamado_historico WHERE md5(id)=:cod", array('cod' => addslashes($id)))) {
                $url = "location: " . BASE_URL . 'ti/chamado/' . md5($resultado['chamado_id']);
                header($url);
            }
        } else {
            $url = "location: " . BASE_URL . "home";
            header($url);
        }
    }

    private function upload_file($file) {
        $arquivo = array();
        $arquivo['temp'] = $file['tmp_name'];
        $arquivo['extensao'] = explode(".", $file['name']);
        $arquivo['extensao'] = strtolower(end($arquivo['extensao']));
        $arquivo['name'] = 'chamado_' . date('d-m-Y') . "_" . md5(md5(rand(1000, 900000) . time())) . '.' . $arquivo['extensao'];
        $arquivo['diretorio'] = 'uploads/chamado';
        $arquivo['arquivo'] = $arquivo['diretorio'] . "/" . $arquivo['name'];
        if (move_uploaded_file($arquivo['temp'], $arquivo['arquivo'])) {
            return $arquivo['arquivo'];
        } else {
            return null;
        }
    }

    protected function getStatus($status_id, $status) {
        $respota = '';
        switch ($status_id) {
            case 1:
                $respota = '<b class="text-warning"> <i class="fas fa-comment-dots"></i> ' . $status . '</b>';
                break;
            case 2:
                $respota = '<b class="text-info"> <i class="fas fa-running"></i> ' . $status . '</b>';
                break;
            case 3:
                $respota = '<b class="text-danger"> <i class="fas fa-window-close"></i> ' . $status . '</b>';
                break;
            case 4:
                $respota = '<b class="text-success"> <i class="fas fa-check text-success"></i> ' . $status . '</b>';
                break;
            default :
                $respota = '';
                break;
        }
        echo $respota;
    }

}
