<div class="container-fluid" id="section-container">
    <div class="row" >
        <div class="col" id="pagina-header">
            <h5>Página Inicial</h5>
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item active"><a href="<?php echo BASE_URL ?>home"><i class="fa fa-tachometer-alt"></i> Inicial</a></li>
                </ol>
            </nav>
        </div>
    </div>
    <div class="row mb-3" id="painel_de_consulta">
        <div class="col">
            <section class="card">
                <header class="card-header bg-success">
                    <a data-toggle="collapse" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false">
                        <h4 class="card-title h6 mb-1 mt-1"><i class="fa fa-search pull-left"></i> Consultar tramitação de protocolo <i class="fa fa-eye pull-right"></i></h4>
                    </a>
                </header>
                <div class="collapse show" id="collapseExample">
                    <article class="card-body">
                        <form method="GET" action="<?php echo BASE_URL ?>protocolo/consultar/1" name="formPROTOCOLOSearch">
                            <div class="form-row">
                                <div class="col-md-2 mb-3">
                                    <label for='itipo'>Tipo do Protocolo: </label><br/>
                                    <select class="custom-select" name="nTipo" id="itipo" onchange="selectTipoProtocolo(this.value)">
                                        <option value="" selected="selected">Todos</option>
                                        <?php
                                        foreach ($protocolo_tipo as $indice) {
                                            if (isset($chamado['setor_id']) && $indice['id'] == $chamado['setor_id']) {
                                                echo '<option value = "' . $indice['id'] . '" selected = "selected">' . $indice['tipo'] . '</option>';
                                            } else {
                                                echo '<option value = "' . $indice['id'] . '">' . $indice['tipo'] . '</option>';
                                            }
                                        }
                                        ?>
                                    </select>
                                    <div class="invalid-feedback">Informe o setor</div>
                                </div>
                                <div class="col-md-4 mb-3">
                                    <label for='iObjetivo'> Objetivo do Pedido: </label><br/>
                                    <select class="custom-select" name="nObjeito" id="iObjetivo" >
                                        <option value="" selected="selected">Todos</option>
                                        <?php
                                        foreach ($protocolo_objetivo as $indice) {
                                            if (isset($chamado['usuario_id']) && $indice['id'] == $chamado['usuario_id']) {
                                                echo '<option value = "' . $indice['id'] . '" selected = "selected">' . $indice['objetivo'] . '</option>';
                                            } else {
                                                echo '<option value = "' . $indice['id'] . '">' . $indice['objetivo'] . '</option>';
                                            }
                                        }
                                        ?>
                                    </select>
                                    <div class="invalid-feedback">
                                        Informe o usuário solicitante
                                    </div>
                                </div>
                                <div class="col-md-2 mb-3">
                                    <label for='iSelectBuscar'>Por: </label><br/>
                                    <select class="custom-select" name="nSelectBuscar" id="iSelectBuscar" >
                                        <option value="" selected="selected" disabled="disabled">Selecione</option>
                                        <option value="protoco">Nº de Protocolo</option>
                                        <option value="interessado">Interessado</option>
                                        <option value="cpf_cpnj">CPF/CNPJ</option>
                                        <option value="data">Data</option>
                                    </select>
                                    <div class="invalid-feedback">Informe o setor</div>
                                </div>
                                <div class="col-md-4 mb-3">
                                    <label for="iCampo">Campo:  </label>
                                    <input type="text" class="form-control" name="nCampo" id="iCampo"/>
                                    <div class="invalid-feedback">
                                        Informe nome / email do usuário
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
    <div class="row">

        <!--<div class="col-md-6">-->
        <div class="col-md-6">
            <div class="mb-3">
                <div class="card mb border-secondary">
                    <div class="card-header bg-dark text-while">
                        <a data-toggle="collapse" data-toggle="collapse" href="#collapseTI" role="button" aria-expanded="false">
                            <div class="row">
                                <div class="ml-1">
                                    <i class="fa fa-chart-pie fa-3x pull-right"></i>
                                </div>
                                <div class="col">
                                    <h4 class="card-title h6 mb-1 mt-1"> Tramitação</h4>
                                    <p class="card-subtitle text-while mb-2"><em>Total em documentos e processos</abbr></em></p>
                                </div>
                            </div>
                        </a>
                    </div>
                    <?php if (!empty($tramitacoes)): ?>
                        <div class="table-responsive collapse show" id="collapseTI">
                            <!--table-->
                            <table class="table table-striped table-bordered table-sm table-hover mb-0">
                                <thead>
                                    <tr>
                                        <th scope="col" >#</th>
                                        <th scope="col">Serviço</th>
                                        <th scope="col">Quantitativo</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php
                                    $qtd = 1;
                                    foreach ($tramitacoes as $indice):
                                        ?>
                                        <tr>
                                            <td class="text-center"><?php echo $qtd ?></td>
                                            <td><?php echo!empty($indice['label']) ? $indice['label'] : ''; ?></td>
                                            <td><?php echo!empty($indice['data']) ? $indice['data'] : ''; ?></td> 
                                        </tr>
                                        <?php
                                        $qtd++;
                                    endforeach;
                                    ?>
                                </tbody>
                            </table>
                            <!--table-->  
                        </div>
                    <?php endif; ?>
                </div>
            </div>
            <div class="mb-3">
                <div class="card mb border-secondary">
                    <div class="card-header bg-dark text-while">
                        <a data-toggle="collapse" data-toggle="collapse" href="#collapseTI" role="button" aria-expanded="false">
                            <div class="row">
                                <div class="ml-1">
                                    <i class="fa fa-chart-bar fa-3x pull-right" ></i>
                                </div>
                                <div class="col">
                                    <h4 class="card-title h6 mb-1 mt-1"> Tramitação</h4>
                                    <p class="card-subtitle text-while mb-2"><em>Total em objetivo do pedido</abbr></em></p>
                                </div>
                            </div>
                        </a>
                    </div>
                    <?php if (!empty($protocolos)): ?>
                        <div class="table-responsive collapse show" id="collapseTI">
                            <!--table-->
                            <table class="table table-striped table-bordered table-sm table-hover mb-0">
                                <thead>
                                    <tr>
                                        <th scope="col" >#</th>
                                        <th scope="col">Objetivo do Pedido</th>
                                        <th scope="col">Quantitativo</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php
                                    $qtd = 1;
                                    foreach ($protocolos as $indice):
                                        ?>
                                        <tr>
                                            <td class="text-center"><?php echo $qtd ?></td>
                                            <td><?php echo!empty($indice['label']) ? $indice['label'] : ''; ?></td>
                                            <td><?php echo!empty($indice['data']) ? $indice['data'] : ''; ?></td> 
                                        </tr>
                                        <?php
                                        $qtd++;
                                    endforeach;
                                    ?>
                                </tbody>
                            </table>
                            <!--table-->  
                        </div>
                    <?php endif; ?>
                </div>
            </div>

        </div>
        <!--FIM <div class="col-md-6">-->

        <!--<div class="col-md-6">-->
        <div class="col-md-6">
            <div class="mb-3">
                <div class="card mb border-secondary">
                    <div class="card-header bg-dark text-while">
                        <a data-toggle="collapse" data-toggle="collapse" href="#collapseTI" role="button" aria-expanded="false">
                            <div class="row">
                                <div class="ml-1">
                                    <i class="fa fa-chart-pie fa-3x pull-right" ></i>
                                </div>
                                <div class="col">
                                    <h4 class="card-title h6 mb-1 mt-1">Suporte interno</h4>
                                    <p class="card-subtitle text-while mb-2"><em>Setor responsável: <abbr title="Assessoria em Tecnologia da Informação e Geotecnologia">ASTIGEO</abbr></em></p>
                                </div>
                            </div>
                        </a>
                    </div>
                    <?php if (!empty($suporte_interno)): ?>
                        <div class="table-responsive collapse show" id="collapseTI">
                            <!--table-->
                            <table class="table table-striped table-bordered table-sm table-hover mb-0">
                                <thead>
                                    <tr>
                                        <th scope="col" >#</th>
                                        <th scope="col">Serviço</th>
                                        <th scope="col">Quantitativo</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php
                                    $qtd = 1;
                                    foreach ($suporte_interno as $indice):
                                        ?>
                                        <tr>
                                            <td class="text-center"><?php echo $qtd ?></td>
                                            <td><?php echo!empty($indice['label']) ? $indice['label'] : ''; ?></td>
                                            <td><?php echo!empty($indice['data']) ? $indice['data'] : ''; ?></td> 
                                        </tr>
                                        <?php
                                        $qtd++;
                                    endforeach;
                                    ?>
                                </tbody>
                            </table>
                            <!--table-->  
                        </div>
                    <?php endif; ?>

                </div>
            </div>

        </div>
        <!--FIM <div class="col-md-6">-->

    </div>
</div>
<!-- /#section-container -->


<script src="<?php echo BASE_URL ?>/assets/js/Chart.min.js"></script>
<script src="<?php echo BASE_URL ?>/assets/js/graficos.js"></script>
