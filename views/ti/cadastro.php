<div class="container-fluid">
    <div class="row" >
        <div class="col" id="pagina-header">
            <h5>Novo Chamado</h5>
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="<?php echo BASE_URL ?>home"><i class="fa fa-tachometer-alt"></i> Inicial</a></li>
                    <li class="breadcrumb-item"><a href="#" ><i class="fas fa-angle-double-right"></i>Suporte Interno</a></li>
                    <li class="breadcrumb-item active" aria-current="page"><a href="<?php echo BASE_URL ?>ti/cadastro"><i class="fas fa-plus-square"></i> Novo Chamado</a></li>
                </ol>
            </nav>
        </div>
        <!--fim pagina-header;-->

    </div>
    <div class="row">
        <div class="col">
            <div class="alert <?php echo (isset($erro['class'])) ? $erro['class'] : 'alert-warning'; ?> " role="alert" id="alert-msg">
                <button class="close" data-hide="alert">&times;</button>
                <div id="resposta"><?php echo (isset($erro['msg'])) ? $erro['msg'] : '<i class="fa fa-info-circle" aria-hidden="true"></i> Preencha os campos corretamente.'; ?></div>
            </div>
        </div>
    </div>
    <!--<div class="row">-->
    <!--fim row-->
    <div class="row">
        <div class="col">
            <form method="POST" action="<?php echo BASE_URL ?>ti/cadastro" enctype="multipart/form-data" autocomplete="off"  name="nFormCCA">
                <input type="hidden" name="nId" value="<?php echo!empty($chamado['id']) ? $chamado['id'] : 0; ?>"/>
                <section class="card bg-light border-secondary">
                    <header class="card-header bg-dark text-while">
                        <h1 class="card-title h5 my-1"><i class="fas fa-plus-square"></i> Novo Chamado</h1>
                    </header>
                    <article class="card-body">

                        <div class="form-row">
                            <div class="col mb-3">
                                <label for='iSetor'>Setor: * </label><br/>
                                <select class="custom-select" name="nSetor" id="iSetor" required onchange="selectSetor(this.value)">
                                    <?php
                                    if (!isset($chamado['setor_id'])) {
                                        echo '<option value="" selected = "selected" disabled="disabled">Selecione o setor </option>';
                                    }
                                    foreach ($setores as $indice) {
                                        if (isset($chamado['setor_id']) && $indice['id'] == $chamado['setor_id']) {
                                            echo '<option value = "' . $indice['id'] . '" selected = "selected">' . $indice['nome'] . ' - ' . $indice['abreviacao'] . '</option>';
                                        } else {
                                            echo '<option value = "' . $indice['id'] . '">' . $indice['nome'] . ' - ' . $indice['abreviacao'] . '</option>';
                                        }
                                    }
                                    ?>
                                </select>
                                <div class="invalid-feedback">Informe o setor</div>
                            </div>
                            <div class="col mb-3">
                                <label for='iUsuario'>Sol??citante: * </label><br/>
                                <select class="custom-select" name="nUsuario" id="iUsuario" required>
                                    <option value="" selected = "selected" disabled="disabled">Selecione o sol??citante </option>
                                </select>
                                <div class="invalid-feedback">
                                    Informe o usu??rio solicitante
                                </div>
                            </div>
                        </div>
                        <!--<div class="row">;;;-->
                        <div class="row">
                            <div class="col mb-3">
                                <label for='iAssunto'>Assunto: * </label><br/>
                                <select class="custom-select" name="nAssunto" id="iAssunto" required">
                                    <?php
                                    if (!isset($chamado['assunto_id'])) {
                                        echo '<option value="" selected = "selected" disabled="disabled">Selecione o assunto </option>';
                                    }
                                    foreach ($assuntos as $indice) {
                                        if (isset($chamado['assunto_id']) && $indice['id'] == $chamado['assunto_id']) {
                                            echo '<option value = "' . $indice['id'] . '" selected = "selected">' . $indice['assunto']. '</option>';
                                        } else {
                                            echo '<option value = "' . $indice['id'] . '">' . $indice['assunto']. '</option>';
                                        }
                                    }
                                    ?>
                                </select>
                                <div class="invalid-feedback"> Informe o Assunto</div>
                            </div>
                        </div>
                        <!--<div class="row">-->
                        <div class="row">
                            <div class="col mb-3">
                                 <label for='iDescricao'>Descri????o: *</label><br/>
                                <textarea rows="5" name="nDescricao"  class="form-control" id="iDescricao" placeholder="Exemplo: Sol??cito atrav??s deste chamado a cria????o de um novo usu??rio de acesso aos computadores..." required><?php echo!empty($chamado['descricao']) ? $chamado['descricao'] : ''; ?></textarea>
                                <div class="invalid-feedback">
                                    Informe uma descri????o
                                </div>
                            </div>
                        </div>
                        <!--<div class="row">-->
                        <div>
                            <label>Anexo: <small class="text-muted">O nome do arquivo ser?? alterado pelo sistema para evitar conflitos com nome de arquivos iguais.</small></label><br/>
                        </div>
                        <div class="custom-file mb-3">
                            <input type="file" class="custom-file-input" name="nFile" id="iAnexo" >
                            <label class="custom-file-label" for="iAnexo">Nenhum arquivo selecionado.</label>
                            <input type="hidden" name="nFileEnviado"  value="<?php echo isset($chamado['anexo']) ? $chamado['anexo'] : null; ?>"/>

                        </div>
                    </article>
                    <!--<article class="card-body">-->
                </section>
                <!--<section class="card">-->
                <div class="row mt-3">
                    <div class="form-group col">
                        <button class="btn btn-success" name="nSalvar" value="Salvar" onclick="valida_formCCA()" type="submit"><i class="fa fa-check-circle" aria-hidden="true"></i> Salvar</button>
                        <a href="<?php echo BASE_URL ?>home" class="btn btn-danger"><i class="fa fa-times" aria-hidden="true"></i> Cancelar</a>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
