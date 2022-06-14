<div class="container-fluid">
    <div class="row" >
        <div class="col" id="pagina-header">
            <h5>Processo de Enquadramento de Atividades - PRENATI</h5>
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="<?php echo BASE_URL ?>home"><i class="fa fa-tachometer-alt"></i> Inicial</a></li>
                    <li class="breadcrumb-item"><a href="#" ><i class="fas fa-angle-double-right"></i> Licenciamento</a></li>
                    <li class="breadcrumb-item active" aria-current="page"><a href="<?php echo BASE_URL ?>lic/enquadramento"><i class="fas fa-search"></i> Processo de Enquadramento de Atividades - PRENATI</a></li>
                </ol>
            </nav>
        </div>
        <!--fim pagina-header;-->

    </div>
    <div class="row">
        <div class="col">
            <div class="alert <?php echo (isset($erro['class'])) ? $erro['class'] : 'alert-warning'; ?> " role="alert" id="alert-msg">
                <button class="close" data-hide="aluffaert">&times;</button>
                <div id="resposta"><?php echo (isset($erro['msg'])) ? $erro['msg'] : '<i class="fa fa-info-circle" aria-hidden="true"></i> Preencha os campos corretamente.'; ?></div>
            </div>
        </div>
    </div>
    <!--<div class="row">-->
    <!--fim row-->
    <div class="row">
        <div class="col">
            <form method="POST" action="<?php echo BASE_URL ?>lic/enquadramento" enctype="multipart/form-data" autocomplete="on"  name="nFormEnquadramento">
                <input type="hidden" name="nId" id="iId" value="<?php echo!empty($arrayCad['id']) ? $arrayCad['id'] : 0; ?>"/>
                <section class="card bg-light border-secondary mb-3">
                    <header class="card-header bg-dark text-while">
                        <h1 class="card-title h5 my-1"><i class="fas fa-search"></i> Dados do Enquadramento da Atividade</h1>
                    </header>
                    <article class="card-body">
                        <!--<div class="row">;;;-->
                        <div class="row">
                            <div class="col mb-3">
                                <label for='iTipologia'>Tipologia: *<small class="text-success"> --- Utilize esta opção para designar a tipologia da atividade</small> </label><br/>
                                <select class="custom-select select2-js" name="nTipologia" id="iTipologia" required onchange="selectEnquadramento(this.value)">
                                    <?php
                                    if (!isset($arrayCad['tipologia'])) {
                                        echo '<option value="" selected = "selected" disabled="disabled">Selecione o Enquadramento da Atividade</option>';
                                    }
                                    foreach ($tipologias as $indice) {
                                        if (isset($arrayCad['tipologia']) && $indice['cod'] == $arrayCad['tipologia']) {
                                            echo '<option value = "' . $indice['cod'] . '" selected = "selected">' . $indice['tipologia'] . '</option>';
                                        } else {
                                            echo '<option value = "' . $indice['cod'] . '">' . $indice['tipologia'] . '</option>';
                                        }
                                    }
                                    ?>
                                </select>
                                <div class="invalid-feedback">Informe o processo a ser vinculado</div>
                            </div>
                        </div>

                        <!--<div class="row">;;;-->
                        <div class="row">
                            <div class="col-md-12 mb-3">
                                <label for='icategoria'>Categoria: </label>
                                <input type="text" name="nCategoria"  class="form-control" id="icategoria" value="<?php echo!empty($arrayCad['categoria']) ? $arrayCad['categoria'] : ''; ?>" disabled="true">
                            </div>           
                            <div class="col-md-12 mb-3">
                                <label for='iUnidade'>Unidade de Medida: </label>
                                <input type="text" name="ncpf_cpnj"  class="form-control" id="iUnidade"value="<?php echo!empty($arrayCad['unidade']) ? $arrayCad['unidade'] : ''; ?>" disabled="true">

                            </div>
                            <div class="col-md-12 mb-3">
                                <label for='iLimite'>Medida: *</label><br/>
                                <input type="text" name="nLimite"  class="form-control" id="iLimite" placeholder="Exemplo: 50" value="<?php echo!empty($arrayCad['limite']) ? $arrayCad['limite'] : ''; ?>" required>
                            </div>
                        </div>
                        <!--<div class="row">-->
                        <div class="row">
                            <div class="col mb-0">
                                <label for='iObservacao'>Observações: </label><br/>
                                <p><?php echo!empty($arrayCad['observacao']) ? $arrayCad['observacao'] : ''; ?></p>
                            </div>
                        </div>
                        <!--<div class="row">-->
                    </article>
                    <!--<article class="card-body">-->
                </section>
                <!--<section class="card">-->
                <?php if (isset($resultado_enquadramento) && !empty($resultado_enquadramento)): ?>
                    <div class="row">
                        <br><!-- comment -->
                        <div class="col">
                            <section class="card bg-light border-secondary">
                                <header class="card-header bg-dark text-while">
                                    <h1 class="card-title h6 my-1"><i class="fas fa-search"></i> Resultado do Enquadramento da Atividade</h1>
                                </header>
                                <article class="card-body">
                                    <ul class="list-unstyled">

                                        <li><strong>Categoria: </strong> <?php echo!empty($resultado_enquadramento['categoria']) ? $resultado_enquadramento['categoria'] : ''; ?></li>
                                        <li><strong>Tipologia: </strong> <?php echo!empty($resultado_enquadramento['tipologia']) ? $resultado_enquadramento['tipologia'] : ''; ?></li>
                                        <li><strong>Modalidade: </strong> <?php echo!empty($resultado_enquadramento['modalidade']) ? $resultado_enquadramento['modalidade'] : ''; ?></li>
                                        <li><strong>Potencial Poluidor: </strong> <?php echo!empty($resultado_enquadramento['potencial']) ? $resultado_enquadramento['potencial'] : ''; ?></li>
                                        <li><strong>Porte: </strong> <?php echo!empty($resultado_enquadramento['porte']) ? $resultado_enquadramento['porte'] : ''; ?></li>
                                        <li><strong>Médida: </strong> <?php echo!empty($resultado_enquadramento['medida']) ? $resultado_enquadramento['medida'] : ''; ?> <?php echo!empty($resultado_enquadramento['unidade']) ? $resultado_enquadramento['unidade'] : ''; ?></li>
                                    </ul>
                                    <?php
                                    if (!empty($resultado_enquadramento['valor_taxa'])) :
                                        ?>
                                        <table class="table table-striped table-bordered table-sm table-hover mb-0">
                                            <thead class="bg-dark text-while">
                                                <tr>
                                                    <th scope="col">Potencial</th>
                                                    <th scope="col">Porte</th>
                                                    <th scope="col">Licença</th>
                                                    <th scope="col">valor</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <?php
                                                $qtd = 1;
                                                foreach ($resultado_enquadramento['valor_taxa'] as $indice):
                                                    ?>
                                                    <tr>
                                                        <td><?php echo!empty($indice['potencial']) ? $indice['potencial'] : ''; ?></td>
                                                        <td><?php echo!empty($indice['porte']) ? $indice['porte'] : ''; ?></td> 
                                                        <td><?php echo!empty($indice['licenca']) ? $indice['licenca'] : ''; ?></td>                                      
                                                        <td><?php echo!empty($indice['valor']) ? $indice['valor']  : ''; ?></td> 
                                                    </tr>
                                                    <?php
                                                    $qtd++;
                                                endforeach;
                                                ?>
                                            </tbody>
                                        </table>
                                    <?php endif; ?>
                                </article>
                            </section>
                        </div>
                    </div>
                <?php endif; ?>
                <div class="row mt-3">
                    <div class="form-group col">
                        <button class="btn btn-success" name="nSalvar" value="Salvar" onclick="valida_formProtocolo()" type="submit"><i class="fa fa-check-circle" aria-hidden="true"></i> Consultar</button>
                        <a href="<?php echo BASE_URL ?>home" class="btn btn-danger"><i class="fa fa-times" aria-hidden="true"></i> Cancelar</a>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
