<div class="container-fluid">
    <div class="row" >
        <div class="col" id="pagina-header">
            <h5>Consultar Patrimônios</h5>
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="<?php echo BASE_URL ?>home"><i class="fa fa-tachometer-alt"></i> Inicial</a></li>
                    <li class="breadcrumb-item"><a href="#" ><i class="fas fa-angle-double-right"></i> Patrimônio</a></li>
                    <li class="breadcrumb-item active" aria-current="page"><a href="<?php echo BASE_URL ?>patrimonio/consultar"><i class="fas fa-tasks"></i> Consultar Patrimônios</a></li>
                </ol>
            </nav>
        </div>
        <!--fim pagina-header;-->

    </div>
    <!--<div class="row">-->
    <div class="row" id="painel_de_consulta">
        <div class="col">
            <section class="card">
                <header class="card-header bg-success">
                    <a data-toggle="collapse" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false">
                        <h4 class="card-title h6 mb-1 mt-1"><i class="fa fa-search pull-left"></i> Painel de busca <i class="fa fa-eye pull-right"></i></h4>
                    </a>
                </header>
                <div class="collapse" id="collapseExample">
                    <article class="card-body">
                        <form method="GET" action="<?php echo BASE_URL ?>patrimonio/consultar/1" name="formCCASearch">
                            <div class="form-row">                                
                                <div class="col mb-3">
                                    <label for='iSetor'>Setor: </label><br/>
                                    <select class="custom-select" name="nSetor" id="iSetor">
                                        <option value="" selected="selected">Todas</option>
                                        <?php
                                        if (isset($setores) && !empty($setores)) {
                                            foreach ($setores as $indice) {
                                                if (isset($chamado['setor_id']) && $indice['id'] == $chamado['setor_id']) {
                                                    echo '<option value = "' . $indice['id'] . '" selected = "selected">' . $indice['nome'] . ' - ' . $indice['abreviacao'] . '</option>';
                                                } else {
                                                    echo '<option value = "' . $indice['id'] . '">' . $indice['nome'] . ' - ' . $indice['abreviacao'] . '</option>';
                                                }
                                            }
                                        }
                                        ?>
                                    </select>
                                    <div class="invalid-feedback">Informe o setor</div>
                                </div>
                                <div class="col mb-3">
                                    <label for='iStatus'>Status: </label><br/>
                                    <select class="custom-select" name="nStatus" id="iStatus" >
                                        <option value="" selected="selected">Todas</option>
                                        <?php
                                        if (isset($status) && !empty($status)) {
                                            foreach ($status as $indice) {
                                                if (isset($chamado['usuario_id']) && $indice['id'] == $chamado['usuario_id']) {
                                                    echo '<option value = "' . $indice['id'] . '" selected = "selected">' . $indice['status'] . '</option>';
                                                } else {
                                                    echo '<option value = "' . $indice['id'] . '">' . $indice['status'] . '</option>';
                                                }
                                            }
                                        }
                                        ?>
                                    </select>
                                    <div class="invalid-feedback">
                                        Informe o usuário solicitante
                                    </div>
                                </div>
                                <div class="col mb-3">
                                    <label for='iTombamento'>Tombamento: </label><br/>
                                    <select class="custom-select" name="nTombamento" id="iTombamento" >
                                        <option value="" selected="selected">Todas</option>
                                        <?php
                                        if (isset($tombamentos) && !empty($tombamentos)) {
                                            foreach ($tombamentos as $indice) {
                                                if (isset($chamado['usuario_id']) && $indice['id'] == $chamado['usuario_id']) {
                                                    echo '<option value = "' . $indice['id'] . '" selected = "selected">' . $indice['tombamento'] . '</option>';
                                                } else {
                                                    echo '<option value = "' . $indice['id'] . '">' . $indice['tombamento'] . '</option>';
                                                }
                                            }
                                        }
                                        ?>
                                    </select>
                                    <div class="invalid-feedback">
                                        Informe o usuário solicitante
                                    </div>
                                </div>
                                <div class="col mb-3">
                                    <label for='iRecurso'>Fonte de Recurso: </label><br/>
                                    <select class="custom-select" name="nRecurso" id="iRecurso" >
                                        <option value="" selected="selected">Todas</option>
                                        <?php
                                        if (isset($fonte_recursos) && !empty($fonte_recursos)) {
                                            foreach ($fonte_recursos as $indice) {
                                                if (isset($chamado['status_id']) && $indice['id'] == $chamado['status_id']) {
                                                    echo '<option value = "' . $indice['id'] . '" selected = "selected">' . $indice['fonte_recurso'] . '</option>';
                                                } else {
                                                    echo '<option value = "' . $indice['id'] . '">' . $indice['fonte_recurso'] . '</option>';
                                                }
                                            }
                                        }
                                        ?>
                                    </select>
                                    <div class="invalid-feedback">
                                        Informe o usuário solicitante
                                    </div>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="col-3 mb-3">
                                    <label for='iClassificacao'>Classificação: </label><br/>
                                    <select class="custom-select" name="nClassificacao" id="iClassificacao" >
                                        <option value="" selected="selected">Todas</option>
                                        <?php
                                        if (isset($classificacao) && !empty($classificacao)) {
                                            foreach ($classificacao as $indice) {
                                                if (isset($chamado['status_id']) && $indice['id'] == $chamado['assunto_id']) {
                                                    echo '<option value = "' . $indice['id'] . '" selected = "selected">' . $indice['classificacao'] . '</option>';
                                                } else {
                                                    echo '<option value = "' . $indice['id'] . '">' . $indice['classificacao'] . '</option>';
                                                }
                                            }
                                        }
                                        ?>
                                    </select>
                                    <div class="invalid-feedback">
                                        Informe o usuário solicitante
                                    </div>
                                </div>
                                <div class="col-md-3 mb-3">
                                    <label for='iSelectBuscar'>Por: </label><br/>
                                    <select class="custom-select" name="nSelectBuscar" id="iSelectBuscar" >
                                        <option value="" selected="selected">Selecione</option>
                                        <option value="item">Item</option>
                                        <option value="numero_tombamento">Nº de tombamento</option>
                                        <option value="ano_aquisicao">Ano de Aquisição</option>
                                        <option value="valor">Valor</option>
                                    </select>
                                    <div class="invalid-feedback">Informe o por</div>
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="iCampo">Campo:  </label>
                                    <input type="text" class="form-control" name="nCampo" id="iCampo"/>
                                    <div class="invalid-feedback">
                                        Informe o campo
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col mt-2 mb-3">
                                    <button type="submit" name="nBuscarBT" value="BuscarBT" class="btn btn-warning"><i class="fa fa-search pull-left"></i> Buscar</button>
                                </div>
                            </div>
                        </form>
                    </article>
                </div>
            </section>
        </div>
    </div>
    <!--<div class="row" id="painel_de_consulta">-->
    <?php
    if (!empty($patrimonios)) {
        ?>
        <div class="row">
            <div class="col mb-2 mt-2">
                <section class="card">
                    <header class="card-header bg-dark text-while">
                        <h1 class="card-title h6 mb-1 mt-1">Total de Registros Encontrados: <?php echo is_array($patrimonios) ? count($patrimonios) : '0'; ?></h1>
                    </header>
                    <div class="table-responsive">
                        <!--table-->
                        <table class="table table-striped table-bordered table-sm table-hover mb-0">
                            <thead class="bg-success">
                                <tr>
                                    <th scope="col" >#</th>
                                    <th scope="col">Item</th>
                                    <th scope="col">Patrimônio</th>
                                    <th scope="col">Setor</th>
                                    <th scope="col">status</th>
                                    <th scope="col">Ação</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php
                                $qtd = 1;
                                foreach ($patrimonios as $indice):
                                    ?>
                                    <tr>
                                        <td class="text-center"><?php echo $qtd ?></td>
                                        <td><?php echo!empty($indice['item']) ? $indice['item'] : '' ?></td>
                                        <td><?php echo!empty($indice['tombamento']) ? !empty($indice['numero_tombamento']) ? 'Nº: ' . $indice['numero_tombamento'] : $indice['tombamento'] : '' ?></td>
                                        <td><?php echo!empty($indice['setor']) ? $indice['setor'] : '' ?></td>
                                        <td><?php echo!empty($indice['status']) ? $indice['status'] : '' ?></td>
                                        <td class="table-acao text-center">
                                            <a class="btn btn-success btn-sm" href="<?php echo BASE_URL . 'patrimonio/patrimonio/' . md5($indice['id']); ?>" title="Visualizar"><i class="fa fa-eye"></i></a> 
                                            <?php if ($this->checkSetor() == 10 || $this->checkSetor() == 4): ?>
                                                <a class="btn btn-primary btn-sm" href="<?php echo BASE_URL . 'patrimonio/editar/' . md5($indice['id']); ?>" title="Editar"><i class="fa fa-pencil-alt"></i></a> 
                                                <?php
                                            endif;
                                            if ($this->checkSetor() == 10):
                                                ?>
                                                <button type="button"  class="btn btn-danger btn-sm" data-toggle="modal" data-target="#modal_relatorio_<?php echo md5($indice['id']) ?>" title="Excluir"><i class="fa fa-trash"></i></button>
                                            <?php endif; ?>
                                        </td>
                                    </tr>
                                    <?php
                                    $qtd++;
                                endforeach;
                                ?>
                            </tbody>
                        </table>
                        <!--table-->  
                    </div>
                </section>

            </div>
        </div>
    <?php } else {
        ?>
        <!--<div class="row">-->
        <div class="row">
            <div class="col mt-2 mb-2">
                <div class="alert alert-danger " role="alert" id="alert-msg">
                    <button class="close" data-hide="alert">&times;</button>
                    <div id="resposta"> <i class="fa fa-times"></i> Desculpe, não foi possível localizar nenhum registro !</div>
                </div>
            </div>
        </div>
        <!--<div class="row">-->
    <?php } ?>
</div>

<!--inicio da paginação-->
<?php
if (ceil($paginas) > 1) {
    ?>
    <div class="container-fluid">
        <div class = "row">
            <div class="col">
                <nav aria-label="Page navigation example">
                    <ul class = "pagination">
                        <?php
                        echo "<li class='page-item'><a class='page-link' href='" . BASE_URL . "ti/consultar/1" . $metodo_buscar . "'><span aria-hidden='true'>&laquo;</span></a></li>";
                        for ($p = 0; $p < ceil($paginas); $p++) {
                            if ($pagina_atual == ($p + 1)) {
                                echo "<li class='page-item active'><a class='page-link' href='" . BASE_URL . "ti/consultar/" . ($p + 1) . $metodo_buscar . "'>" . ($p + 1) . "</a></li>";
                            } else {
                                echo "<li class='page-item'><a class='page-link' href='" . BASE_URL . "ti/consultar/" . ($p + 1) . $metodo_buscar . "'>" . ($p + 1) . "</a></li>";
                            }
                        }
                        echo "<li class='page-item'><a class='page-link' href='" . BASE_URL . "ti/consultar/" . ceil($paginas) . $metodo_buscar . "'>&raquo;</a></li>";
                        ?>
                    </ul>
                </nav>
            </div> 
        </div> 
    </div>
<?php }
?>
<!--fim da paginação-->
<?php
if ($this->checkSetor() == 10):
    if (isset($patrimonios) && is_array($patrimonios)) :
        foreach ($patrimonios as $indice) :
            ?>        
            <!--MODAL - ESTRUTURA BÁSICA-->
            <section class="modal fade" id="modal_relatorio_<?php echo md5($indice['id']) ?>" tabindex="-1" role="dialog">
                <article class="modal-dialog modal-md modal-dialog-centered" role="document">
                    <section class="modal-content">
                        <header class="modal-header bg-danger text-while">
                            <h5 class="modal-title">Deseja remover este registro?</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </header>
                        <article class="modal-body">
                            <ul class="list-unstyled">                                
                                <li><b>Patrimônio: </b> Nº <?php echo str_pad($indice['id'], 5, '0', STR_PAD_LEFT) ?>;</li>
                                <li><b>Status: </b> <?php echo isset($indice['status']) && !empty($indice['status']) ? $indice['status'] : '0' ?>;</li>
                                <li><b>Setor: </b> <?php echo isset($indice['setor']) && !empty($indice['setor']) ? $indice['setor'] : '0' ?>;</li>
                                <li><b>Item: </b> <?php echo isset($indice['item']) && !empty($indice['item']) ? $indice['item'] : '0' ?>;</li>
                            </ul>
                            <p class="text-justify text-danger"><span class="font-bold">OBS : </span> Ao clicar em "Excluir", este registro e todos registos relacionados ao mesmo deixaram de existir no sistema.</p>
                        </article>
                        <footer class="modal-footer">
                            <a class="btn btn-danger pull-left" href="<?php echo BASE_URL . 'patrimonio/excluir/' . md5($indice['id']) ?>"> <i class="fa fa-trash"></i> Excluir</a> 
                            <button class="btn btn-default" type="button" data-dismiss="modal"><i class="fa fa-times"></i> Fechar</button>
                        </footer>
                    </section>
                </article>
            </section>
            <?php
        endforeach;
    endif;
endif;
?>