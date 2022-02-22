<?php

/**
 * A classe 'controller' é responsável por fazer o carregamento das views, concebe paginação e verifica nível de usuário
 * 
 * @author Joab Torres <joabtorres1508@gmail.com>
 * @version 1.0
 * @copyright  (c) 2019, Joab Torres Alencar - Analista de Sistemas 
 * @access public
 * @package core
 * @example classe controller
 */
class controller {

    /**
     * Está função verifica se a $_SESSION['usuario'] está inicializada, caso esteja então verifica se o usuario tem permissao de acesso e sua conta esteja ativa.
     * @return int 
     * @access protected
     * @author Joab Torres <joabtorres1508@gmail.com>
     */
    protected function checkUser() {
        $_SESSION['usuario'] = unserialize($_COOKIE['usuario']);
        if (isset($_SESSION['usuario']) && is_array($_SESSION['usuario']) && isset($_SESSION['usuario']['status'])) {
            if ($_SESSION['usuario']['status'] == 1) {
                return $_SESSION['usuario']['acesso'];
            }
        } else {
            $url = "location: " . BASE_URL . "login";
            header($url);
            return 0;
        }
    }
    protected function checkSetor() {
        $_SESSION['usuario'] = unserialize($_COOKIE['usuario']);
        if (isset($_SESSION['usuario']) && is_array($_SESSION['usuario']) && isset($_SESSION['usuario']['status'])) {
            if ($_SESSION['usuario']['status'] == 1) {
                return $_SESSION['usuario']['setor_id'];
            }
        } else {
            $url = "location: " . BASE_URL . "home";
            header($url);
            return 0;
        }
    }

    protected function setUser($user) {
        $_SESSION['usuario'] = array();
        //codigo
        $_SESSION['usuario']['id'] = $user['id'];
        //setor
        $_SESSION['usuario']['setor_id'] = $user['setor_id'];
        //nome
        $_SESSION['usuario']['nome'] = $user['nome'];
        //nivel
        $_SESSION['usuario']['acesso'] = $user['acesso'];
        //statu
        $_SESSION['usuario']['status'] = $user['status'];
        //criando 
        setcookie("usuario", serialize($_SESSION['usuario']), time() + (3600 * 8));  /* expira em 1 hora */
    }

    public function getIdUser() {
        if (isset($_SESSION['usuario']) && is_array($_SESSION['usuario']) && isset($_SESSION['usuario']['status'])) {
            if ($_SESSION['usuario']['status'] == 1) {
                return $_SESSION['usuario']['id'];
            }
        }
    }

    /**
     * Está função é responsável para carrega uma view;
     * @param String viewName - nome da view;
     * @param array $viewData - Dados para serem carregados na view
     * @access public
     * @author Joab Torres <joabtorres1508@gmail.com>
     */
    public function loadView($viewName, $viewData = array()) {
        extract($viewData);
        include 'views/' . $viewName . ".php";
    }

    /**
     * Está função é responsável para carrega um template estático, a onde ela chama chama uma função lo;
     * @param String viewName - nome da view;
     * @param array $viewData - Dados para serem carregados na view
     * @access public
     * @author Joab Torres <joabtorres1508@gmail.com>
     */
    public function loadTemplate($viewName, $viewData = array()) {
        include 'views/template.php';
    }

    /**
     * Está função é responsável para carrega uma view dinamica dentro de um template estático
     * @param String viewName - nome da view;
     * @param array $viewData - Dados para serem carregados na view
     * @access public
     * @author Joab Torres <joabtorres1508@gmail.com>
     */
    public function loadViewInTemplate($viewName, $viewData = array()) {
        extract($viewData);
        include 'views/' . $viewName . ".php";
    }

    /**
     * Está função é responsável para converte uma data do padrão 'ano-mes-dia' para 'dia/mes/ano'
     * @param String $date - data solicitada pelo parametro
     * r
     * @access protected
     * @return $date - data formatada no padrão brasileiro
     * @author Joab Torres <joabtorres1508@gmail.com>
     */
    protected function formatDateView($date) {
        $arrayDate = explode("-", $date);
        if (count($arrayDate) == 3) {
            return $arrayDate[2] . '/' . $arrayDate[1] . '/' . $arrayDate[0];
        } else {
            return false;
        }
    }

    /**
     * Está função é responsável para converte uma data do padrão 'ano-mes-dia' para 'dia/mes/ano'
     * @param String $date - data solicitada pelo parametro
     * r
     * @access protected
     * @return $date - data formatada no padrão brasileiro
     * @author Joab Torres <joabtorres1508@gmail.com>
     */
    protected function formatDateViewComplet($date) {
        $datatime = explode(" ", $date);
        $arrayDate = explode("-", $datatime[0]);
        if (count($arrayDate) == 3) {
            return $arrayDate[2] . '/' . $arrayDate[1] . '/' . $arrayDate[0] . ' ' . $datatime[1];
        } else {
            return false;
        }
    }

    /**
     * Está função é responsável para converte uma data do padrão 'ano-mes-dia' para 'dia/mes/ano'
     * @param String $date - data solicitada pelo parametro
     * r
     * @access protected
     * @return $date - data formatada no padrão brasileiro
     * @author Joab Torres <joabtorres1508@gmail.com>
     */
    protected function formatDateDBComplet($date) {
        $datatime = explode(" ", $date);
        $arrayDate = explode("/", $datatime[0]);
        if (count($arrayDate) == 3) {
            return $arrayDate[2] . '-' . $arrayDate[1] . '-' . $arrayDate[0] . ' ' . $datatime[1];
        } else {
            return false;
        }
    }

    /**
     * Está função é responsável para converte uma data do padrão 'dia/mes/ano' para 'ano-mes-dia'
     * @param String $date - data solicitada pelo parametro
     * r
     * @access protected
     * @return $date - data formatada no padrão banco MySQL
     * @author Joab Torres <joabtorres1508@gmail.com>
     */
    protected function formatDateBD($date) {
        $arrayDate = explode("/", $date);
        if (count($arrayDate) == 3) {
            return $arrayDate[2] . '-' . $arrayDate[1] . '-' . $arrayDate[0];
        } else {
            return false;
        }
    }

    protected function hash_md5() {
        return md5($this->generato(10) . microtime(true) . mt_Rand(10000, 90000));
    }

    /**
     * Este método é responsável para criar uma sequencia de caracteres aleatória. 
     * @param int $tamanho - tamanho de caracteres a ser gerado;
     * @access private
     * @return string os caracteres gerados
     * @author Joab Torres <joabtorres1508@gmail.com>
     */
    private function generato($tamanho = 8) {
        $car_minusculo = 'q w e r t y u i o p a s d f g h j k l z x c v b n m';
        $car_numero = ' 0 1 2 3 4 5 6 7 8 9';
        $car_maiusculo = " Q W E R T Y U I O P A S D F G H J K L Z X C V B N M";
        $car_especial = " ! @ # $ % & Ç ç";

        $retorno = "";
        $caracteres = $car_minusculo . $car_numero . $car_maiusculo . $car_especial;

        $caracteres = explode(" ", $caracteres);
        for ($i = 1; $i <= $tamanho; $i++) {
            $retorno = $retorno . $caracteres[mt_rand(1, count($caracteres) - 1)];
        }
        return $retorno;
    }

    public function getDatatimeNow() {
        return date("Y-m-d H:i:00", time());
    }

    public function getDataNow() {
        return date("Y-m-d", time());
    }

}
