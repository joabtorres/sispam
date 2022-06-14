<?php

class cprnController extends controller {

    public function index() {
        if ($this->checkUser()) {
            $this->loadView('404');
        } else {
            $url = "location: " . BASE_URL . "home";
            header($url);
        }
    }

    public function get_tipo_documento() {
        if (isset($_POST) && is_array($_POST) && !empty($_POST)) {
            $crudModel = new crud_db();
            $protocolo_id = addslashes($_POST['protocolo_id']);
            if (isset($_POST['id_user'])) {
                $user_id = addslashes($_POST['id_user']);
            }
            $usuarios = $crudModel->read("SELECT * FROM cprn_tipo_documento WHERE tipo_protocolo_id=:id ORDER BY documento ASC", array('id' => $protocolo_id));
            if (!isset($user_id)) {
                echo '<option value="" selected = "selected" disabled="disabled">Selecione o tipo do documento </option>';
            }
            foreach ($usuarios as $indice) {
                if (isset($user_id) && $indice['id'] == $user_id) {
                    echo '<option value = "' . $indice['id'] . '" selected = "selected">' . $indice['documento'] . '</option>';
                } else {
                    echo '<option value = "' . $indice['id'] . '">' . $indice['documento'] . '</option>';
                }
            }
        }
    }

    public function get_tipo_acao() {
        if (isset($_POST) && is_array($_POST) && !empty($_POST)) {
            $crudModel = new crud_db();
            $protocolo_id = addslashes($_POST['categoria_id']);
            if (isset($_POST['id_user'])) {
                $user_id = addslashes($_POST['id_user']);
            }
            $resultado = $crudModel->read("SELECT * FROM cprn_tipo_solicitacao WHERE categoria_id=:id ORDER BY acao ASC", array('id' => $protocolo_id));
            if (!isset($user_id)) {
                echo '<option value="" selected = "selected" disabled="disabled">Selecione a ação </option>';
            }
            foreach ($resultado as $indice) {
                if (isset($user_id) && $indice['id'] == $user_id) {
                    echo '<option value = "' . $indice['id'] . '" selected = "selected">' . $indice['acao'] . '</option>';
                } else {
                    echo '<option value = "' . $indice['id'] . '">' . $indice['acao'] . '</option>';
                }
            }
        }
    }

    public function search_tipo_documento() {
        if (isset($_POST) && is_array($_POST) && !empty($_POST)) {
            $crudModel = new crud_db();
            $protocolo_id = addslashes($_POST['protocolo_id']);
            $usuarios = $crudModel->read("SELECT * FROM cprn_tipo_documento WHERE tipo_protocolo_id=:id ORDER BY documento ASC", array('id' => $protocolo_id));
            echo '<option value="" selected="selected" >Todos</option>';
            foreach ($usuarios as $indice) {
                echo '<option value = "' . $indice['id'] . '">' . $indice['documento'] . '</option>';
            }
        }
    }

    public function search_tipo_acao() {
        if (isset($_POST) && is_array($_POST) && !empty($_POST)) {
            $crudModel = new crud_db();
            $protocolo_id = addslashes($_POST['categoria_id']);
            $resultado = $crudModel->read("SELECT * FROM cprn_tipo_solicitacao WHERE categoria_id=:id ORDER BY acao ASC", array('id' => $protocolo_id));
            echo '<option value="" selected = "selected">Todos </option>';
            foreach ($resultado as $indice) {
                echo '<option value = "' . $indice['id'] . '">' . $indice['acao'] . '</option>';
            }
        }
    }

    public function cadastro() {
        if ($this->checkUser() == 10 || ($this->checkSetor() == 1 || $this->checkSetor() == 10)) {
            $viewName = 'cprn/solicitacao/cadastro';
            $dados = array();
            $crud = new crud_db();
            $dados['tipo_protocolo'] = $crud->read("SELECT * FROM cprn_tipo_protocolo ORDER BY tipo_protocolo ASC");
            $dados['documento'] = $crud->read("SELECT * FROM cprn_tipo_documento ORDER BY documento ASC");
            $dados['origem'] = $crud->read("SELECT * FROM cprn_origem ORDER BY origem ASC");
            $dados['tecnicos'] = $crud->read("SELECT * FROM usuario WHERE setor_id=1 ORDER BY nome ASC");
            $dados['tipo_categoria'] = $crud->read("SELECT * FROM cprn_tipo_categoria ORDER BY categoria ASC");
            $dados['tipo_acao'] = $crud->read("SELECT * FROM cprn_tipo_solicitacao ORDER BY acao ASC");
            $dados['cidade'] = $crud->read("SELECT * FROM cidade");
            $dados['bairro'] = $crud->read("SELECT * FROM bairro WHERE cidade_id=1 ORDER BY bairro ASC");
            $dados['solicitante'] = $crud->read("SELECT * FROM cprn_solicitante ORDER BY solicitante ASC");
            $dados['protocolos'] = $crud->read("SELECT p.*, po.objetivo FROM protocolo as p INNER JOIN  protocolo_objetivo as po where po.id=p.objetivo_id");

            // cadastro
            if (isset($_POST['nSalvar']) && !empty($_POST['nSalvar'])) {
                $cadForm = array();
                //id
                if (!empty($_POST['nId'])) {
                    $cadForm['id'] = addslashes($_POST['nId']);
                }
                /*                 * *********************
                 * protocolo
                 * ******************** */
                $cadForm['protocolo']['tipo'] = 'solicitacao';
                //tramitacao
                $cadForm['protocolo']['tramitacao'] = !empty($_POST['nTramitacao']) ? $_POST['nTramitacao'] : 0;
                //data do protocolo
                $cadForm['protocolo']['data_protocolo'] = $this->formatDateBD($_POST['nData']);
                //data de recebimento
                $cadForm['protocolo']['data_recebimento'] = $this->formatDateBD($_POST['nDataRecebimento']);
                //origem
                $cadForm['protocolo']['origem_id'] = addslashes($_POST['nOrigem']);
                //tipo do protocolo
                $cadForm['protocolo']['protocolo_id'] = addslashes($_POST['nTipoProtocolo']);
                //tipo do documento
                $cadForm['protocolo']['documento_id'] = addslashes($_POST['nTipoDocumento']);
                //protocolo
                $cadForm['protocolo']['numero_protocolo'] = addslashes($_POST['nNumeroProtocolo']);
                //ano protocolo
                $cadForm['protocolo']['ano_protocolo'] = addslashes($_POST['nAnoProtocolo']);
                //oficio
                $cadForm['protocolo']['numero_oficio'] = addslashes($_POST['nNumeroOficio']);
                $cadForm['protocolo']['ano_oficio'] = addslashes($_POST['nAnoOficio']);
                //memorando
                $cadForm['protocolo']['numero_memorando'] = addslashes($_POST['nNumeroMemorando']);
                $cadForm['protocolo']['ano_memorando'] = addslashes($_POST['nAnoMemorando']);
                //SOLICITANTE
                $cadForm['protocolo']['solicitante_id'] = addslashes($_POST['nOrgaoSolicitante']);
                $cadForm['protocolo']['prazo'] = addslashes($_POST['nPrazoResposta']);
                //hash
                $cadForm['protocolo']['hash'] = $this->hash_md5();
                /*                 * *********************
                 * solicitação
                 * ******************** */
                //tipo da solicitacao
                $cadForm['solicitacao']['categoria_id'] = addslashes($_POST['nTipoSolicitacao']);
                $cadForm['solicitacao']['acao_id'] = addslashes($_POST['niTipoAcao']);
                //tecnico responsavel
                $cadForm['solicitacao']['usuario_id'] = addslashes($_POST['nTecnico']);
                $cadForm['solicitacao']['status'] = addslashes($_POST['nStatus']);
                //solicitante
                $cadForm['solicitacao']['interessado'] = addslashes($_POST['nsolicitante']);
                $cadForm['solicitacao']['telefone'] = addslashes($_POST['nTelefone']);
                $cadForm['solicitacao']['email'] = addslashes($_POST['nEmail']);
                //descricao
                $cadForm['solicitacao']['descricao'] = addslashes($_POST['nDescricao']); //descricao
                $cadForm['solicitacao']['cidade_id'] = addslashes($_POST['nCidade']); //cidade
                $cadForm['solicitacao']['bairro_id'] = addslashes($_POST['nBairro']); //bairro
                $cadForm['solicitacao']['endereco'] = addslashes($_POST['nEndereco']); //endereco
                $cadForm['solicitacao']['latitude'] = addslashes($_POST['nLatitude']); // latitude
                $cadForm['solicitacao']['longitude'] = addslashes($_POST['nLongitude']); // longitude
                $resultado = $crud->create("INSERT INTO cprn_protocolo (tipo, tramitacao, data_protocolo, data_recebimento, origem_id, protocolo_id, documento_id, numero_protocolo, ano_protocolo, numero_oficio, ano_oficio, numero_memorando, ano_memorando, solicitante_id, prazo, hash) VALUES  (:tipo, :tramitacao, :data_protocolo, :data_recebimento, :origem_id, :protocolo_id, :documento_id, :numero_protocolo, :ano_protocolo, :numero_oficio, :ano_oficio, :numero_memorando, :ano_memorando, :solicitante_id, :prazo, :hash)", $cadForm['protocolo']);
                if ($resultado) {
                    $protocolo = $crud->read_specific("SELECT * FROM cprn_protocolo WHERE hash=:hash", array('hash' => $cadForm['protocolo']['hash']));
                    $cadForm['solicitacao']['protocolo_id'] = $protocolo['id'];
                    $resultado = $crud->create("INSERT INTO cprn(protocolo_id, categoria_id, acao_id, usuario_id, status, interessado, telefone, email, descricao, endereco, cidade_id, bairro_id, latitude, longitude) VALUES (:protocolo_id, :categoria_id, :acao_id, :usuario_id, :status, :interessado,:telefone, :email, :descricao, :endereco, :cidade_id, :bairro_id, :latitude, :longitude)", $cadForm['solicitacao']);
                    if ($resultado) {
                        $solicitacao = $crud->read_specific("SELECT * FROM cprn WHERE protocolo_id=:id", array('id' => $protocolo['id']));
                        $dados['arrayCad'] = $cadForm;
                        $historico = array();
                        $historico['data'] = $this->getDatatimeNow();
                        $historico['descricao'] = "Foi realizado o cadastro no banco de dados";
                        $historico['usuario_id'] = $this->getIdUser();
                        $historico['cprn_id'] = $solicitacao['id'];
                        $crud->create("INSERT INTO cprn_historico (data, descricao, usuario_id, cprn_id) VALUES (:data, :descricao, :usuario_id, :cprn_id) ", $historico);
                        $dados['erro'] = array('class' => 'alert-success', 'msg' => '<i class="fa fa-check-circle" aria-hidden="true"></i> Cadastro realizado com sucesso!');
                    }
                }
            }
            $this->loadTemplate($viewName, $dados);
        } else {
            $url = "location: " . BASE_URL . "home";
            header($url);
        }
    }

    public function editar($id) {
        if ($this->checkUser() == 10 || ($this->checkSetor() == 1 || $this->checkSetor() == 10)) {
            $viewName = 'cprn/solicitacao/editar';
            $dados = array();
            $crud = new crud_db();

            $dados['arrayCad']['solicitacao'] = $crud->read_specific("SELECT * FROM cprn WHERE md5(id)=:id", array('id' => $id));
            if (!is_array($dados['arrayCad']['solicitacao']) && empty($dados['arrayCad']['solicitacao'])) {
                $url = "location: " . BASE_URL . "home";
                header($url);
            }
            $dados['arrayCad']['protocolo'] = $crud->read_specific("SELECT * FROM cprn_protocolo WHERE id=:id", array('id' => $dados['arrayCad']['solicitacao']['protocolo_id']));

            $dados['tipo_protocolo'] = $crud->read("SELECT * FROM cprn_tipo_protocolo ORDER BY tipo_protocolo ASC");
            $dados['documento'] = $crud->read("SELECT * FROM cprn_tipo_documento ORDER BY documento ASC");
            $dados['origem'] = $crud->read("SELECT * FROM cprn_origem ORDER BY origem ASC");
            $dados['tecnicos'] = $crud->read("SELECT * FROM usuario WHERE setor_id=1 ORDER BY nome ASC");
            $dados['tipo_categoria'] = $crud->read("SELECT * FROM cprn_tipo_categoria ORDER BY categoria ASC");
            $dados['tipo_acao'] = $crud->read("SELECT * FROM cprn_tipo_solicitacao ORDER BY acao ASC");
            $dados['cidade'] = $crud->read("SELECT * FROM cidade");
            $dados['bairro'] = $crud->read("SELECT * FROM bairro WHERE cidade_id=1 ORDER BY bairro ASC");
            $dados['solicitante'] = $crud->read("SELECT * FROM cprn_solicitante ORDER BY solicitante ASC");
            $dados['protocolos'] = $crud->read("SELECT p.*, po.objetivo FROM protocolo as p INNER JOIN  protocolo_objetivo as po where po.id=p.objetivo_id");

            // cadastro
            if (isset($_POST['nSalvar']) && !empty($_POST['nSalvar'])) {
                $cadForm = array();
                //salva os 
                $lastArray = $dados['arrayCad'];
                //id
                if (!empty($_POST['nId'])) {
                    $cadForm['protocolo']['id'] = addslashes($_POST['nId']);
                }
                /*                 * *********************
                 * protocolo
                 * ******************** */
                $cadForm['protocolo']['tipo'] = 'solicitacao';
                //tramitacao
                $cadForm['protocolo']['tramitacao'] = !empty($_POST['nTramitacao']) ? $_POST['nTramitacao'] : 0;
                //data do protocolo
                $cadForm['protocolo']['data_protocolo'] = $this->formatDateBD($_POST['nData']);
                //data de recebimento
                $cadForm['protocolo']['data_recebimento'] = $this->formatDateBD($_POST['nDataRecebimento']);
                //tipo do protocolo
                $cadForm['protocolo']['protocolo_id'] = addslashes($_POST['nTipoProtocolo']);
                //tipo do documento
                $cadForm['protocolo']['documento_id'] = addslashes($_POST['nTipoDocumento']);
                //origem
                $cadForm['protocolo']['origem_id'] = addslashes($_POST['nOrigem']);
                //protocolo
                $cadForm['protocolo']['numero_protocolo'] = addslashes($_POST['nNumeroProtocolo']);
                $cadForm['protocolo']['ano_protocolo'] = addslashes($_POST['nAnoProtocolo']);
                //oficio
                $cadForm['protocolo']['numero_oficio'] = addslashes($_POST['nNumeroOficio']);
                $cadForm['protocolo']['ano_oficio'] = addslashes($_POST['nAnoOficio']);
                //memorando
                $cadForm['protocolo']['numero_memorando'] = addslashes($_POST['nNumeroMemorando']);
                $cadForm['protocolo']['ano_memorando'] = addslashes($_POST['nAnoMemorando']);
                //SOLICITANTE
                $cadForm['protocolo']['solicitante_id'] = addslashes($_POST['nOrgaoSolicitante']);
                $cadForm['protocolo']['prazo'] = addslashes($_POST['nPrazoResposta']);
                /*                 * *********************
                 * solicitação
                 * ******************** */

                $cadForm['solicitacao']['id'] = $dados['arrayCad']['solicitacao']['id'];
                $cadForm['solicitacao']['protocolo_id'] = $dados['arrayCad']['protocolo']['id'];
                //tipo da solicitacao
                $cadForm['solicitacao']['categoria_id'] = addslashes($_POST['nTipoSolicitacao']);
                $cadForm['solicitacao']['acao_id'] = addslashes($_POST['niTipoAcao']);
                //tecnico responsavel
                $cadForm['solicitacao']['usuario_id'] = addslashes($_POST['nTecnico']);
                $cadForm['solicitacao']['status'] = addslashes($_POST['nStatus']);
                //solicitante
                $cadForm['solicitacao']['interessado'] = addslashes($_POST['nsolicitante']);
                $cadForm['solicitacao']['telefone'] = addslashes($_POST['nTelefone']);
                $cadForm['solicitacao']['email'] = addslashes($_POST['nEmail']);
                //descricao
                $cadForm['solicitacao']['descricao'] = addslashes($_POST['nDescricao']); //descricao
                $cadForm['solicitacao']['cidade_id'] = addslashes($_POST['nCidade']); //cidade
                $cadForm['solicitacao']['bairro_id'] = addslashes($_POST['nBairro']); //bairro
                $cadForm['solicitacao']['endereco'] = addslashes($_POST['nEndereco']); //endereco
                $cadForm['solicitacao']['latitude'] = addslashes($_POST['nLatitude']); // latitude
                $cadForm['solicitacao']['longitude'] = addslashes($_POST['nLongitude']); // longitude
                $resultado = $crud->update("UPDATE cprn_protocolo SET tipo=:tipo, tramitacao=:tramitacao, data_protocolo=:data_protocolo, data_recebimento=:data_recebimento, protocolo_id=:protocolo_id, documento_id=:documento_id, origem_id=:origem_id, numero_protocolo=:numero_protocolo, ano_protocolo=:ano_protocolo, numero_oficio=:numero_oficio, ano_oficio=:ano_oficio, numero_memorando=:numero_memorando, ano_memorando=:ano_memorando, solicitante_id =:solicitante_id, prazo=:prazo WHERE id=:id", $cadForm['protocolo']);
                if ($resultado) {
                    $resultado = $crud->update("UPDATE cprn SET protocolo_id=:protocolo_id, categoria_id=:categoria_id, acao_id=:acao_id, usuario_id=:usuario_id, status=:status, interessado=:interessado, telefone=:telefone, email=:email, descricao=:descricao, endereco=:endereco, cidade_id=:cidade_id, bairro_id=:bairro_id, latitude=:latitude, longitude=:longitude WHERE id=:id", $cadForm['solicitacao']);
                    if ($resultado) {
                        $dados['arrayCad'] = $cadForm;
                        $historico = array();
                        $historico['data'] = $this->getDatatimeNow();
                        $historico['descricao'] = "Alteração realizada com sucesso!";
                        $historico['usuario_id'] = $this->getIdUser();
                        $historico['cprn_id'] = $cadForm['solicitacao']['id'];
                        $crud->create("INSERT INTO cprn_historico (data, descricao, usuario_id, cprn_id) VALUES (:data, :descricao, :usuario_id, :cprn_id) ", $historico);
                        $dados['erro'] = array('class' => 'alert-success', 'msg' => '<i class="fa fa-check-circle" aria-hidden="true"></i> Alteração realizada com sucesso!');
                    }
                }
            }
            $this->loadTemplate($viewName, $dados);
        } else {
            $url = "location: " . BASE_URL . "home";
            header($url);
        }
    }

    public function consultar($page = 1) {
        if ($this->checkUser() == 10 || ($this->checkSetor() == 1 || $this->checkSetor() == 10)) {
            $view = "cprn/solicitacao/consulta";
            $dados = array();
            $crudModel = new crud_db();
            $dados['tipo_protocolo'] = $crudModel->read("SELECT * FROM cprn_tipo_protocolo ORDER BY tipo_protocolo ASC");
            $dados['documento'] = $crudModel->read("SELECT * FROM cprn_tipo_documento ORDER BY documento ASC");
            $dados['origem'] = $crudModel->read("SELECT * FROM cprn_origem ORDER BY origem ASC");
            $dados['solicitante'] = $crudModel->read("SELECT * FROM cprn_solicitante ORDER BY solicitante ASC");
            $dados['tecnicos'] = $crudModel->read("SELECT * FROM usuario WHERE setor_id=1 ORDER BY nome ASC");
            $dados['tipo_categoria'] = $crudModel->read("SELECT * FROM cprn_tipo_categoria ORDER BY categoria ASC");
            $dados['tipo_solicitacao'] = $crudModel->read("SELECT * FROM cprn_tipo_solicitacao ORDER BY acao ASC");
            $dados['cidade'] = $crudModel->read("SELECT * FROM cidade");
            $dados['bairro'] = $crudModel->read("SELECT * FROM bairro WHERE cidade_id=1 ORDER BY bairro ASC");

            $sql = "SELECT p.data_protocolo, p.numero_protocolo, p.ano_protocolo, s.* FROM cprn_protocolo as p INNER JOIN cprn as s WHERE s.protocolo_id=p.id";
            $arrayForm = array();
            if (isset($_GET['nBuscarBT'])) {
                $parametros = "?nTipoProtocolo=" . $_GET['nTipoProtocolo'] . "&nTipoDocumento=" . $_GET['nTipoDocumento'] . "&nOrigem=" . $_GET['nOrigem'] . "&nSolicitante=" . $_GET['nSolicitante'] . "&nCategoria=" . $_GET['nCategoria'] . "&nSolicitacao=" . $_GET['nSolicitacao'] . "&nUsuario=" . $_GET['nUsuario'] . "&nDataInicial=" . $_GET['nDataInicial'] . "&nDataFinal=" . $_GET['nDataFinal'] . "&nSelectBuscar=" . $_GET['nSelectBuscar'] . "&nCampo=" . $_GET['nCampo'] . "&nBuscarBT=BuscarBT";
                //TipoProtocolo
                if (!empty($_GET['nTipoProtocolo'])) {
                    $sql .= " AND p.protocolo_id=:protocolo_id ";
                    $arrayForm['protocolo_id'] = addslashes($_GET['nTipoProtocolo']);
                }
                //nTipoDocumento
                if (!empty($_GET['nTipoDocumento'])) {
                    $sql .= " AND p.documento_id=:documento_id ";
                    $arrayForm['documento_id'] = addslashes($_GET['nTipoDocumento']);
                }
                //nOrigem
                if (!empty($_GET['nOrigem'])) {
                    $sql .= " AND p.origem_id=:origem_id ";
                    $arrayForm['origem_id'] = addslashes($_GET['nOrigem']);
                }
                //nSolicitante
                if (!empty($_GET['nSolicitante'])) {
                    $sql .= " AND p.solicitante_id=:solicitante_id ";
                    $arrayForm['solicitante_id'] = addslashes($_GET['nSolicitante']);
                }
                //nCategoria
                if (!empty($_GET['nCategoria'])) {
                    $sql .= " AND s.categoria_id=:categoria_id ";
                    $arrayForm['categoria_id'] = addslashes($_GET['nCategoria']);
                }
                //nSolicitacao
                if (!empty($_GET['nSolicitacao'])) {
                    $sql .= " AND s.acao_id=:acao_id ";
                    $arrayForm['acao_id'] = addslashes($_GET['nSolicitacao']);
                }
                //nUsuario
                if (!empty($_GET['nUsuario'])) {
                    $sql .= " AND s.usuario_id=:usuario_id ";
                    $arrayForm['usuario_id'] = addslashes($_GET['nUsuario']);
                }
                //nDataInicial e nDataFinal
                if (!empty($_GET['nDataInicial']) && !empty($_GET['nDataFinal'])) {
                    $data_inicial = $this->formatDateBD($_GET['nDataInicial']);
                    $data_final = $this->formatDateBD($_GET['nDataFinal']);
                    $sql .= " AND p.data_protocolo BETWEEN '" . $data_inicial . "' AND '" . $data_final . "' ";
                }
                //nSelectBuscar
                if (!empty($_GET['nSelectBuscar'])) {
                    $opcaoSelecionada = $_GET['nSelectBuscar'];
                    $campo = $_GET['nCampo'];
                    switch ($opcaoSelecionada) {
                        case 'protoco':
                            $sql .= " AND p.numero_protocolo LIKE '%" . $campo . "%' ";
                            break;
                        case 'oficio':
                            $sql .= " AND p.numero_oficio LIKE '%" . $campo . "%' ";
                            break;
                        case 'solicitante':
                            $sql .= " AND s.solicitante LIKE '%" . $campo . "%' ";
                            break;
                        case 'descricao':
                            $sql .= " AND s.descricao LIKE '%" . $campo . "%' ";
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
                $sql .= " LIMIT $indice,$limite ";
                $chamados = $crudModel->read($sql, $arrayForm);
            } else {
                //paginacao
                $limite = 50;
                $total_registro = $crudModel->read_specific("SELECT COUNT(s.id) AS qtd FROM cprn_protocolo as p INNER JOIN cprn as s WHERE s.protocolo_id=p.id");
                $paginas = $total_registro['qtd'] / $limite;
                $indice = 0;
                $pagina_atual = (isset($page) && !empty($page)) ? addslashes($page) : 1;
                $indice = ($pagina_atual - 1) * $limite;
                $dados["paginas"] = $paginas;
                $dados["pagina_atual"] = $pagina_atual;
                $dados['metodo_buscar'] = "";
                $sql .= "  LIMIT $indice,$limite";
                $chamados = $crudModel->read($sql);
            }
            $dados['chamados'] = $chamados;
            $this->loadTemplate($view, $dados);
        } else {
            $url = "location: " . BASE_URL . "home";
            header($url);
        }
    }

    public function excluirsolicitacao($id) {
        if ($this->checkUser() == 10 || ($this->checkSetor() == 1 || $this->checkSetor() == 10)) {
            $crudModel = new crud_db();
            $resultado = $crudModel->read_specific("SELECT * FROM cprn WHERE md5(id)=:id", array('id' => addslashes($id)));
            if (!empty($resultado)) {
                $r1 = $crudModel->remove("DELETE FROM cprn WHERE id=:id", array('id' => $resultado['id']));
                $r2 = $crudModel->remove("DELETE FROM cprn_protocolo WHERE id=:id", array('id' => $resultado['protocolo_id']));
                if ($r1 && $r2) {
                    $url = "location: " . BASE_URL . 'cprn/consultar/1';
                    header($url);
                }
            }
        } else {
            $url = "location: " . BASE_URL . "home";
            header($url);
        }
    }

    public function solicitacao($id) {
        if ($this->checkUser() == 10 || ($this->checkSetor() == 1 || $this->checkSetor() == 10)) {
            $crudModel = new crud_db();
            $resultado = $crudModel->read_specific("SELECT p.tramitacao, p.data_protocolo, p.data_recebimento,  p.numero_protocolo, p.ano_protocolo, p.numero_oficio, p.ano_oficio, p.numero_memorando, p.ano_memorando,p.prazo, so.solicitante, tp.tipo_protocolo, td.documento, o.origem, s.*, tds.categoria, cts.acao,c.cidade, b.bairro, u.nome as tecnico FROM cprn_protocolo AS p INNER JOIN cprn_solicitante as so INNER JOIN cprn_tipo_protocolo AS tp INNER JOIN cprn_tipo_documento AS td INNER JOIN cprn_origem AS o INNER JOIN cprn AS s INNER JOIN cprn_tipo_categoria AS tds INNER JOIN cidade AS c INNER JOIN bairro AS b INNER JOIN usuario as u INNER JOIN cprn_tipo_solicitacao as cts WHERE p.protocolo_id = tp.id AND p.documento_id = td.id AND p.origem_id = o.id AND s.protocolo_id = p.id AND p.solicitante_id=so.id AND s.categoria_id = tds.id AND s.acao_id = cts.id AND s.cidade_id = c.id AND s.bairro_id = b.id AND s.usuario_id = u.id AND md5(s.id)=:id", array('id' => $id));

            if (!empty($resultado)) {
                $dados = array();
                $dados['result'] = $resultado;
                if (!empty($resultado['tramitacao'])) {
                    $dados['vinculados'] = $crudModel->read("SELECT p.*, pt.tipo FROM protocolo as p INNER JOIN protocolo_tipo as pt WHERE p.tipo_id=pt.id AND p.id=:id UNION SELECT p.*, pt.tipo FROM protocolo as p INNER JOIN protocolo_tipo as pt WHERE p.tipo_id=pt.id AND p.processo=:processo", array('id' => $resultado['tramitacao'], 'processo' => $resultado['tramitacao']));
                }
                $dados['vistorias'] = $crudModel->read("SELECT * FROM cprn_vistoria WHERE cprn_id=:id", array('id' => $resultado['id']));
                $dados['anexos'] = $crudModel->read('SELECT * FROM cprn_anexo where cprn_id=:id', array('id' => $resultado['id']));
                $dados['historico'] = $crudModel->read('SELECT h.*, u.nome FROM cprn_historico AS h INNER JOIN usuario AS u WHERE h.usuario_id=u.id AND h.cprn_id=:id', array('id' => $resultado['id']));

                //salva vistoria
                if (isset($_POST['nSalvaVistoria'])) {
                    $cadForm = array();
                    $cadForm['data'] = $this->formatDateBD($_POST['nData']);
                    $cadForm['descricao'] = addslashes($_POST['nDescricao']);
                    $cadForm['cprn_id'] = $resultado['id'];
                    $instrumento = null;
                    if (!empty($_POST['nInstrumento'])) {
                        foreach ($_POST['nInstrumento'] as $item) {
                            $instrumento .= $item . '; ';
                        }
                    }
                    if ($crudModel->create("INSERT INTO cprn_vistoria (data, descricao, cprn_id) VALUES (:data, :descricao,:cprn_id)", $cadForm)) {
                        $url = "location: " . BASE_URL . 'cprn/solicitacao/' . md5($resultado['id']);
                        header($url);
                    }
                }

                //salvar anexos
                if (isset($_POST['nSalvaAnexo'])) {
                    $cadForm = array();
                    $cadForm['cprn_id'] = $resultado['id'];
                    $cadForm['descricao'] = addslashes($_POST['nDescricao']);
                    $cadForm['data'] = $this->getDataNow();
                    if (isset($_FILES['nFile']) && $_FILES['nFile']['error'] == 0) {
                        $cadForm['anexo'] = $this->upload_file($_FILES['nFile'], $cadForm['cprn_id']);
                        if (!empty($_POST['nFileEnviado'])) {
                            $crudModel->delete_file($_POST['nFileEnviado']);
                        }
                    } else {
                        echo $_FILES['nFile']['error'];
                        $cadForm['anexo'] = addslashes($_POST['nFileEnviado']);
                    }
                    if ($crudModel->create("INSERT INTO cprn_anexo (cprn_id, descricao, anexo, data) VALUES (:cprn_id, :descricao, :anexo, :data)", $cadForm)) {
                        $url = "location: " . BASE_URL . 'cprn/solicitacao/' . md5($resultado['id']);
                        header($url);
                    }
                }

                //salvar historico
                if (isset($_POST['nSalvaHistorico'])) {
                    $cadForm = array();
                    $cadForm['data'] = $this->formatDateBD($_POST['nData']);
                    $cadForm['descricao'] = addslashes($_POST['nDescricao']);
                    $cadForm['usuario_id'] = $this->getIdUser();
                    $cadForm['cprn_id'] = $resultado['id'];
                    if ($crudModel->create("INSERT INTO cprn_historico(data, descricao, usuario_id, cprn_id) VALUES (:data, :descricao, :usuario_id, :cprn_id)", $cadForm)) {
                        $url = "location: " . BASE_URL . 'cprn/solicitacao/' . md5($resultado['id']);
                        header($url);
                    }
                }
                $view = "cprn/solicitacao/solicitacao";
                $this->loadTemplate($view, $dados);
            } else {
                $url = "location: " . BASE_URL . "home";
                header($url);
            }
        } else {
            $url = "location: " . BASE_URL . "home";
            header($url);
        }
    }

    private function upload_file($file, $id) {
        $arquivo = array();
        $arquivo['temp'] = $file['tmp_name'];
        $arquivo['extensao'] = explode(".", $file['name']);
        $arquivo['extensao'] = strtolower(end($arquivo['extensao']));
        $arquivo['name'] = date('d-m-Y') . "_" . md5(md5(rand(1000, 900000) . time())) . '.' . $arquivo['extensao'];
        $arquivo['diretorio'] = 'uploads/cprn/solicitacao/' . $id;
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

    /** função responstaval para checar se existe o diretorio e criar caso não tenha */
    private function checkDir($id) {
        if (!is_dir('uploads/cprn/solicitacao/' . $id)) {
            mkdir('uploads/cprn/solicitacao/' . $id, 0777, TRUE);
        }
    }

    public function excluirvistoria($id) {
        if ($this->checkUser() == 10 || ($this->checkSetor() == 1 || $this->checkSetor() == 10)) {
            $crudModel = new crud_db();
            $resultado = $crudModel->read_specific("SELECT * FROM cprn_vistoria WHERE md5(id)=:id", array('id' => addslashes($id)));
            if ($crudModel->remove("DELETE FROM cprn_vistoria WHERE md5(id)=:cod", array('cod' => addslashes($id)))) {
                $url = "location: " . BASE_URL . 'cprn/solicitacao/' . md5($resultado['cprn_id']);
                header($url);
            }
        } else {
            $url = "location: " . BASE_URL . "home";
            header($url);
        }
    }

    public function excluiranexo($id) {
        if ($this->checkUser() == 10 || ($this->checkSetor() == 1 || $this->checkSetor() == 10)) {
            $crudModel = new crud_db();
            $resultado = $crudModel->read_specific("SELECT * FROM cprn_anexo WHERE md5(id)=:id", array('id' => addslashes($id)));
            $crudModel->delete_file($resultado['anexo']);
            if ($crudModel->remove("DELETE FROM cprn_anexo WHERE md5(id)=:cod", array('cod' => addslashes($id)))) {
                $url = "location: " . BASE_URL . 'cprn/solicitacao/' . md5($resultado['cprn_id']);
                header($url);
            }
        } else {
            $url = "location: " . BASE_URL . "home";
            header($url);
        }
    }

    public function excluirhistorico($id) {
        if ($this->checkUser() == 10 || ($this->checkSetor() == 1 || $this->checkSetor() == 10)) {
            $crudModel = new crud_db();
            $resultado = $crudModel->read_specific("SELECT * FROM cprn_historico WHERE md5(id)=:id", array('id' => addslashes($id)));
            if ($crudModel->remove("DELETE FROM cprn_historico WHERE md5(id)=:cod", array('cod' => addslashes($id)))) {
                $url = "location: " . BASE_URL . 'cprn/solicitacao/' . md5($resultado['cprn_id']);
                header($url);
            }
        } else {
            $url = "location: " . BASE_URL . "home";
            header($url);
        }
    }

}
