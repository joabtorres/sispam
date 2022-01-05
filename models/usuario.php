<?php

/**
 * A classe 'usuario' é responsável para efetiva comandos sql no banco de dados, como, insert, update, select, delete, count;
 * 
 * @author Joab Torres <joabtorres1508@gmail.com>
 * @version 1.0
 * @copyright  (c) 2019, Joab Torres Alencar - Analista de Sistemas 
 * @access public
 * @package models
 * @example classe usuario
 */
class usuario extends model {

    /**
     * String $numRows - referente q quantidade de linhas obtidas no select;
     * @access private
     * @author Joab Torres <joabtorres1508@gmail.com>
     */
    private $numRows;

    /**
     * Está função tem como objetivo retorna a quantidade de registro encontrados armazenados na variavel $numRows
     * @access public
     * @return int
     * @author Joab Torres <joabtorres1508@gmail.com>
     */
    public function getNumRows() {
        return $this->numRows;
    }

    /**
     * Está função é responsável para cadastrar novos registros;
     * @param String $sql_command  - Comando SQL;
     * @param Array $data - Dados salvo em array para seres setados por um foreach;
     * @access public
     * @return boolean 
     * @author Joab Torres <joabtorres1508@gmail.com>
     */
    public function create($data) {
        $sql = $this->db->prepare('INSERT INTO usuario(setor_id, portaria, cargo, nome, usuario, email, senha, acesso, data_cadastro, data_finalizacao, observacao, imagem, status) VALUES (:setor_id, :portaria, :cargo, :nome, :usuario, :email, :senha, :acesso, :data_cadastro, :data_finalizacao, :observacao, :imagem, :status)');
        $sql->bindValue(':setor_id', $data['setor_id']);
        $sql->bindValue(':portaria', $data['portaria']);
        $sql->bindValue(':cargo', $data['cargo']);
        $sql->bindValue(':nome', $data['nome']);
        $sql->bindValue(':usuario', $data['usuario']);
        $sql->bindValue(':email', $data['email']);
        $sql->bindValue(':senha', md5(sha1($data['senha'])));
        $sql->bindValue(':acesso', $data['acesso']);
        $sql->bindValue(':data_cadastro', $data['data_cadastro']);
        $sql->bindValue(':data_finalizacao', $data['data_finalizacao']);
        $sql->bindValue(':observacao', $data['observacao']);
        if (!empty($data['imagem'])) {
            $sql->bindValue(':imagem', $this->save_image($data['imagem']));
        } else {
            $sql->bindValue(':imagem', 'uploads/usuarios/user.png');
        }
        $sql->bindValue(':status', $data['status']);
        $sql->execute();
    }

    /**
     * Está função é responsável para consultas no banco e retorna os resultados obtidos;
     * @param String $sql_command  - Comando SQL;
     * @param Array $data - Dados salvo em array para seres setados por um foreach;
     * @access public
     * @return array $sql->fetchAll() [caso encontre] | bollean FALSE [caso contrário] 
     * @author Joab Torres <joabtorres1508@gmail.com>
     */
    public function read($sql_command, $data) {
        if (!empty($data)) {
            $sql = $this->db->prepare($sql_command);

            foreach ($data as $indice => $valor) {
                $sql->bindValue(":" . $indice, $valor);
            }
            $sql->execute();
        } else {
            $sql = $this->db->query($sql_command);
        }
        if ($sql->rowCount() > 0) {
            $this->numRows = $sql->rowCount();
            return $sql->fetchAll();
        } else {
            $this->numRows = 0;
            return FALSE;
        }
    }

    /**
     * Está função é responsável para consultas no banco e retorna os resultados obtidos;
     * @param String $sql_command  - Comando SQL;
     * @param Array $data - Dados salvo em array para seres setados por um foreach;
     * @access public
     * @return array $sql->fetch() [caso encontre] | bollean FALSE [caso contrário] 
     * @author Joab Torres <joabtorres1508@gmail.com>
     */
    public function read_specific($sql_command, $data) {
        if (!empty($data)) {
            $sql = $this->db->prepare($sql_command);

            foreach ($data as $indice => $valor) {
                $sql->bindValue(":" . $indice, $valor);
            }
            $sql->execute();
        } else {
            $sql = $this->db->query($sql_command);
        }
        if ($sql->rowCount() > 0) {
            $this->numRows = $sql->rowCount();
            return $sql->fetch();
        } else {
            $this->numRows = 0;
            return FALSE;
        }
    }

    /**
     * Está função é responsável para altera um registro específico;
     * @param String $sql_command  - Comando SQL;
     * @param Array $data - Dados salvo em array para seres setados por um foreach;
     * @access public
     * @return bollean TRUE ou FALSE
     * @author Joab Torres <joabtorres1508@gmail.com>
     */
    public function update($data) {
        try {
            if (isset($data['senha']) && !empty($data['senha'])) {
                $sql = "UPDATE usuario SET setor_id=:setor_id, portaria=:portaria, cargo=:cargo, nome=:nome, usuario=:usuario, email=:email, senha=:senha, acesso=:acesso, imagem=:imagem, status=:status WHERE id=:id";
            } else {
                $sql = "UPDATE usuario SET setor_id=:setor_id, portaria=:portaria, cargo=:cargo, nome=:nome, usuario=:usuario, email=:email, acesso=:acesso, imagem=:imagem, status=:status WHERE id=:id";
            }
            $sql = $this->db->prepare($sql);
            $sql->bindValue(':setor_id', $data['setor_id']);
            $sql->bindValue(':portaria', $data['portaria']);
            $sql->bindValue(':cargo', $data['cargo']);
            $sql->bindValue(':nome', $data['nome']);
            $sql->bindValue(':usuario', $data['usuario']);
            $sql->bindValue(':email', $data['email']);
            if (isset($data['senha']) && !empty($data['senha'])) {
                $sql->bindValue(':senha', md5(sha1($data['senha'])));
            }

            //verifica se foi setado a nova senha
            if (isset($data['senha']) && !empty($data['senha'])) {
                $sql->bindValue(':senha', md5(sha1($data['senha'])));
            }
            $sql->bindValue(':acesso', $data['acesso']);

            //selecionando imagem
            //se ela é um array $_FILE
            if (is_array($data['imagem'])) {
                $sql->bindValue(':imagem', $this->save_image($data['imagem']));
                $this->delete_image($data['img_atual']);
                //se não mudou de foto
            } else if (!isset($data['delete_img']) && !is_array($data['imagem'])) {
                $sql->bindValue(':imagem', $data['imagem']);
                //se mudou para foto padrão
            } else if (isset($data['delete_img'])) {
                $this->delete_image($data['imagem']);
                $sql->bindValue(':imagem', 'uploads/usuarios/user.png');
            }
            $sql->bindValue(':status', $data['status']);
            $sql->bindValue(':id', $data['id']);
            $sql->execute();

            return $this->read_specific("SELECT * FROM usuario WHERE id=:id", array('id' => $data['id']));
        } catch (PDOException $ex) {
            echo $ex->getMessage();
            return null;
        }
    }

    /**
     * Está função é responsável para altera um registro específico;
     * @param String $sql_command  - Comando SQL;
     * @param Array $data - Dados salvo em array para seres setados por um foreach;
     * @access public
     * @return bollean TRUE ou FALSE
     * @author Joab Torres <joabtorres1508@gmail.com>
     */
    public function updatesimples($data) {
        try {
            if (isset($data['senha']) && !empty($data['senha'])) {
                $sql = "UPDATE usuario SET senha=:senha, imagem=:imagem WHERE id=:id";
            } else {
                $sql = "UPDATE usuario SET imagem=:imagem WHERE id=:id";
            }
            $sql = $this->db->prepare($sql);
            //verifica se foi setado a nova senha
            if (isset($data['senha']) && !empty($data['senha'])) {
                $sql->bindValue(':senha', md5(sha1($data['senha'])));
            }
            //selecionando imagem
            //se ela é um array $_FILE
            if (is_array($data['imagem'])) {
                $sql->bindValue(':imagem', $this->save_image($data['imagem']));
                $this->delete_image($data['img_atual']);
                //se não mudou de foto
            } else if (!isset($data['delete_img']) && !is_array($data['imagem'])) {
                $sql->bindValue(':imagem', $data['imagem']);
                //se mudou para foto padrão
            } else if (isset($data['delete_img'])) {
                $this->delete_image($data['imagem']);
                $sql->bindValue(':imagem', 'uploads/usuarios/user.png');
            }
            $sql->bindValue(':id', $data['id']);
            $sql->execute();

            return $this->read_specific("SELECT * FROM usuario WHERE id=:id", array('id' => $data['id']));
        } catch (PDOException $ex) {
            echo $ex->getMessage();
            return null;
        }
    }

    /**
     * Está é responsável adiciona uma nova senha ao usuário
     * @param String $email - E-mail cadastrado no banco de dados;
     * @access public
     * @return boolean true or false
     * @author Joab Torres <joabtorres1508@gmail.com>
     */
    public function newpassword($email) {
        //verifica se este usuário está registrado
        $result = $this->read_specific('SELECT * FROM usuario WHERE email=:email', array('email' => $email));
        if (!empty($result)) {
            try {
                $nova_senha = trim($this->password_generato());
                $sql = $this->db->prepare('UPDATE usuario SET senha = ? WHERE cod = ? AND email = ?');
                $sql->bindValue(1, md5(sha1($nova_senha)));
                $sql->bindValue(2, $result['cod']);
                $sql->bindValue(3, $result['email']);
                $sql->execute();
                return $nova_senha;
            } catch (PDOException $ex) {
                echo $ex->getMessage();
                return false;
            }
        } else {
            return false;
        }
    }

    /**
     * Está é responsável excluir um registro específico
     * @param String $sql_command  - Comando SQL;
     * @param Array $data - Dados salvo em array para seres setados por um foreach;
     * @access public
     * @return boolean TRUE or FALSE
     * @author Joab Torres <joabtorres1508@gmail.com>
     */
    public function remove($data) {
        $usuario = $this->read_specific('SELECT * FROM usuario WHERE md5(id)=:id', $data);
        if (!empty($usuario)) {
            $sql = $this->db->prepare('DELETE FROM usuario WHERE id=:id');
            $sql->bindValue(':id', $usuario['id']);
            $sql->execute();
            $this->delete_image($usuario['imagem']);
            return true;
        } else {
            return false;
        }
    }

    /**
     * Está função é responsável para salva uma imágem no diretório uploads/usuarios/
     * @access public
     * @return boolean TRUE or FALSE
     * @author Joab Torres <joabtorres1508@gmail.com>
     */
    private function save_image($file) {
        $imagem = array();
        $largura = 140;
        $altura = 140;
        $imagem['temp'] = $file['tmp_name'];
        $imagem['extensao'] = explode(".", $file['name']);
        $imagem['extensao'] = strtolower(end($imagem['extensao']));
        $imagem['name'] = md5(rand(1000, 900000) . time()) . '.' . $imagem['extensao'];
        $imagem['diretorio'] = 'uploads/usuarios';
        if ($imagem['extensao'] == 'jpg' || $imagem['extensao'] == 'jpeg' || $imagem['extensao'] == 'png') {

            list($larguraOriginal, $alturaOriginal) = getimagesize($imagem['temp']);

            $ratio = max($largura / $larguraOriginal, $altura / $alturaOriginal);
            $alturaOriginal = $altura / $ratio;
            $x = ($larguraOriginal - $largura / $ratio) / 2;
            $larguraOriginal = $largura / $ratio;

            $imagem_final = imagecreatetruecolor($largura, $altura);

            if ($imagem['extensao'] == 'jpg' || $imagem['extensao'] == 'jpeg') {
                $imagem_original = imagecreatefromjpeg($imagem['temp']);
                imagecopyresampled($imagem_final, $imagem_original, 0, 0, $x, 0, $largura, $altura, $larguraOriginal, $alturaOriginal);
                imagejpeg($imagem_final, $imagem['diretorio'] . "/" . $imagem['name'], 90);
            } else if ($imagem['extensao'] == 'png') {
                $imagem_original = imagecreatefrompng($imagem['temp']);
                imagecopyresampled($imagem_final, $imagem_original, 0, 0, $x, 0, $largura, $altura, $larguraOriginal, $alturaOriginal);
                imagepng($imagem_final, $imagem['diretorio'] . "/" . $imagem['name']);
            }
            return $imagem['diretorio'] . "/" . $imagem['name'];
        } else {
            return null;
        }
    }

    /**
     * Está é responsável excluir uma imagem de usuário;
     * @param String $url_image - diretório do arquivo;
     * @access private
     * @return boolean TRUE or FALSE
     * @author Joab Torres <joabtorres1508@gmail.com>
     */
    private function delete_image($url_image) {
        if (!($url_image == 'uploads/usuarios/user.png') && file_exists($url_image)) {
            unlink($url_image);
        }
    }

    /**
     * Este método é responsável para criar uma nova senha aleatória. 
     * @param int $tamanho - tamanho de caracteres da senha;
     * @param boolean $numero - incluir numero na senha;
     * @param boolean $maiusculo - incluir letra em caixa alta na senha
     * @param boolean $caractere_especial - incluir caracteres especiais na senha
     * @access private
     * @return boolean true or false
     * @author Joab Torres <joabtorres1508@gmail.com>
     */
    private function password_generato($tamanho = 8, $numero = true, $maiusculo = true, $caractere_especial = false) {
        $car_minusculo = 'q w e r t y u i o p a s d f g h j k l z x c v b n m';
        $car_numero = ' 0 1 2 3 4 5 6 7 8 9';
        $car_maiusculo = " Q W E R T Y U I O P A S D F G H J K L Z X C V B N M";
        $car_especial = " ! @ # $ % & Ç ç";

        $retorno = "";
        $caracteres = $car_minusculo;

        if ($numero) {
            $caracteres = $caracteres . $car_numero;
        }
        if ($maiusculo) {
            $caracteres = $caracteres . $car_maiusculo;
        }
        if ($caractere_especial) {
            $caracteres = $caracteres . $car_especial;
        }
        $caracteres = explode(" ", $caracteres);
        for ($i = 1; $i <= $tamanho; $i++) {
            $retorno = $retorno . $caracteres[mt_rand(1, count($caracteres) - 1)];
        }
        return $retorno;
    }

}
