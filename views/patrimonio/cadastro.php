<div class="container-fluid">
    <div class="row" >
        <div class="col" id="pagina-header">
            <h5>Novo Patrimônio</h5>
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="<?php echo BASE_URL ?>home"><i class="fa fa-tachometer-alt"></i> Inicial</a></li>
                    <li class="breadcrumb-item"><a href="#" ><i class="fas fa-angle-double-right"></i>Patrimônio</a></li>
                    <li class="breadcrumb-item active" aria-current="page"><a href="<?php echo BASE_URL ?>patrimonio/cadastro"><i class="fas fa-plus-square"></i> Novo Patrimônio</a></li>
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
            <form method="POST" action="<?php echo BASE_URL ?>patrimonio/cadastro" enctype="multipart/form-data" autocomplete="off"  name="nFormPatrimonio">
                <input type="hidden" name="nId" value="<?php echo!empty($patrimonio['id']) ? $patrimonio['id'] : 0; ?>"/>
                <section class="card bg-light border-secondary">
                    <header class="card-header bg-dark text-while">
                        <h1 class="card-title h5 my-1"><i class="fas fa-plus-square"></i> Novo Patrimônio</h1>
                    </header>
                    <article class="card-body">
                        <!--<div class="form-row">-->
                        <div class="form-row">
                            <div class="col mb-3">
                                <label for='iSetor'>Setor: * </label><br/>
                                <select class="custom-select select2-js" name="nSetor" id="iSetor" required>
                                    <?php
                                    if (!isset($patrimonio['setor_id'])) {
                                        echo '<option value="" selected = "selected" disabled="disabled">Selecione o setor </option>';
                                    }
                                    foreach ($setores as $indice) {
                                        if (isset($patrimonio['setor_id']) && $indice['id'] == $patrimonio['setor_id']) {
                                            echo '<option value = "' . $indice['id'] . '" selected = "selected">' . $indice['nome'] . ' - ' . $indice['abreviacao'] . '</option>';
                                        } else {
                                            echo '<option value = "' . $indice['id'] . '">' . $indice['nome'] . ' - ' . $indice['abreviacao'] . '</option>';
                                        }
                                    }
                                    ?>
                                </select>
                                <div class="invalid-feedback">Informe o setor</div>
                            </div>
                        </div>
                        <!--<div class="form-row">-->
                        <div class="form-row">
                            <div class="col-12 mb-3">
                                <label for='iSetor'>Descricção do Item: * </label><br/>
                                <input type="text" name="nItem" id="iItem" class="form-control" value="<?php echo!empty($patrimonio['item']) ? $patrimonio['item'] : '' ?>"  placeholder="Exemplo: Cadeira giratória sem braços, com rodas, preta" required>
                                <div class="invalid-feedback">Informe o item</div>
                            </div>
                        </div>                        
                        <!--<div class="form-row">-->
                        <div class="form-row">
                            <div class="col mb-3">
                                <label for='iStatusTombamento'>Status do Tombamento: * </label><br/>
                                <select class="custom-select" name="nStatusTombamento" id="iStatusTombamento" required>
                                    <?php
                                    if (!isset($patrimonio['status_tombamento_id'])) {
                                        echo '<option value="" selected = "selected" disabled="disabled">Selecione o status do tombamento</option>';
                                    }
                                    foreach ($tombamentos as $indice) {
                                        if (isset($patrimonio['status_tombamento_id']) && $indice['id'] == $patrimonio['status_tombamento_id']) {
                                            echo '<option value = "' . $indice['id'] . '" selected = "selected">' . $indice['tombamento'] . '</option>';
                                        } else {
                                            echo '<option value = "' . $indice['id'] . '">' . $indice['tombamento'] . '</option>';
                                        }
                                    }
                                    ?>
                                </select>
                                <div class="invalid-feedback">
                                    Informe o status do patrimônio
                                </div>
                            </div>
                            <div class="col mb-3">
                                <label for='iTombamento'>Número de Tombamento:  </label><br/>
                                <input type="text" class="form-control" name="nNumeroTombamento" id="iTombamento" value="<?php echo!empty($patrimonio['numero_tombamento']) ? $patrimonio['numero_tombamento'] : '' ?>"  placeholder="Exemplo: 36554" />
                                <div class="invalid-feedback">
                                    Informe o número de tombamento
                                </div>
                            </div>

                            <div class="col mb-3">
                                <label for='iStatus'>Status: * </label><br/>
                                <select class="custom-select" name="nStatus" id="iStatus" required>
                                    <?php
                                    if (!isset($patrimonio['status_id'])) {
                                        echo '<option value="" selected = "selected" disabled="disabled">Selecione o status </option>';
                                    }
                                    foreach ($status as $indice) {
                                        if (isset($patrimonio['status_id']) && $indice['id'] == $patrimonio['status_id']) {
                                            echo '<option value = "' . $indice['id'] . '" selected = "selected">' . $indice['status'] . '</option>';
                                        } else {
                                            echo '<option value = "' . $indice['id'] . '">' . $indice['status'] . '</option>';
                                        }
                                    }
                                    ?>
                                </select>
                                <div class="invalid-feedback">
                                    Informe o status do patrimônio
                                </div>
                            </div>
                            <div class="col mb-3">
                                <label for='iClassificacao'>Classificação: * </label><br/>
                                <select class="custom-select" name="nClassificao" id="iClassificacao" required>
                                    <?php
                                    if (!isset($patrimonio['classificacao_id'])) {
                                        echo '<option value="" selected = "selected" disabled="disabled">Selecione a classificação </option>';
                                    }
                                    foreach ($classificacao as $indice) {
                                        if (isset($patrimonio['classificacao_id']) && $indice['id'] == $patrimonio['classificacao_id']) {
                                            echo '<option value = "' . $indice['id'] . '" selected = "selected">' . $indice['classificacao'] . '</option>';
                                        } else {
                                            echo '<option value = "' . $indice['id'] . '">' . $indice['classificacao'] . '</option>';
                                        }
                                    }
                                    ?>
                                </select>
                                <div class="invalid-feedback">
                                    Informe a classificação
                                </div>
                            </div>
                        </div>
                        <!--<div class="row">;;;-->
                        <div class="form-row">
                            <div class="col mb-3">
                                <label for='iRecurso'>Fonte de Recurso:  </label><br/>
                                <select class="custom-select" name="nRecurso" id="iRecurso" >
                                    <?php
                                    if (!isset($patrimonio['fonte_recurso_id'])) {
                                        echo '<option value="" selected = "selected" disabled="disabled">Selecione a fonte de recurso </option>';
                                    }
                                    foreach ($fonte_recursos as $indice) {
                                        if (isset($patrimonio['fonte_recurso_id']) && $indice['id'] == $patrimonio['fonte_recurso_id']) {
                                            echo '<option value = "' . $indice['id'] . '" selected = "selected">' . $indice['fonte_recurso'] . '</option>';
                                        } else {
                                            echo '<option value = "' . $indice['id'] . '">' . $indice['fonte_recurso'] . '</option>';
                                        }
                                    }
                                    ?>
                                </select>
                                <div class="invalid-feedback">Informe a fonte de recurso</div>
                            </div>

                            <div class="col">
                                <label for='iValor'>Valor do Item:  </label><br/>
                                <input type="text" name="nValor" id="iValor" class="form-control" value="<?php echo!empty($patrimonio['valor']) ? $patrimonio['valor'] : '' ?>" placeholder="Exemplo: R$ 3.000,00">
                                <div class="invalid-feedback">Informe o valor do item</div>
                            </div>
                            <div class="col">
                                <label for='iAnoAquisicao'>Ano de Aquisição: </label><br/>
                                <input type="text" name="nAquisicao" id="iAnoAquisicao" class="form-control" value="<?php echo!empty($patrimonio['ano_aquisicao']) ? $patrimonio['ano_aquisicao'] : '' ?>" placeholder="Exemplo: 2019">
                                <div class="invalid-feedback">Informe o Ano de Aquisicão</div>
                            </div>
                            <div class="col-12 mb-2">
                                <small class="text-success">Recomenda-se a possível de verificar na Nota Fiscal.</small>
                            </div>
                        </div>
                        <!--<div class="row">-->
                        <div class="row">
                            <div class="col mb-3">
                                <label for='iDescricao'>Observação: </label><br/>
                                <textarea rows="5" name="nDescricao"  class="form-control" id="iDescricao" placeholder="Exemplo: O item encontra-se em status de inservível, visto que quebrou o encosto da costa..." ><?php echo!empty($patrimonio['descricao']) ? $patrimonio['descricao'] : ''; ?></textarea>
                                <div class="invalid-feedback">
                                    Informe uma descrição
                                </div>
                            </div>
                        </div>
                        <!--<div class="row">-->
                        <div>
                            <label>Anexo: <small class="text-muted">O nome do arquivo será alterado pelo sistema para evitar conflitos com nome de arquivos iguais.</small></label><br/>
                        </div>
                        <div class="custom-file mb-3">
                            <input type="file" class="custom-file-input" name="nFile" id="iAnexo" >
                            <label class="custom-file-label" for="iAnexo">Nenhum arquivo selecionado.</label>
                            <input type="hidden" name="nFileEnviado"  value="<?php echo isset($patrimonio['anexo']) ? $patrimonio['anexo'] : null; ?>"/>

                        </div>
                    </article>
                    <!--<article class="card-body">-->
                </section>
                <!--<section class="card">-->
                <div class="row mt-3">
                    <div class="form-group col">
                        <button class="btn btn-success" name="nSalvar" value="Salvar" onclick="valida_formPatrimonio()" type="submit"><i class="fa fa-check-circle" aria-hidden="true"></i> Salvar</button>
                        <a href="<?php echo BASE_URL ?>home" class="btn btn-danger"><i class="fa fa-times" aria-hidden="true"></i> Cancelar</a>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
