<div class="container-fluid">
    <div class="row" >
        <div class="col" id="pagina-header">
            <h5>Patrimônio: Nº <?php echo str_pad($result['id'], 5, '0', STR_PAD_LEFT) ?></h5>
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="<?php echo BASE_URL ?>home"><i class="fa fa-tachometer-alt"></i> Inicial</a></li>
                    <li class="breadcrumb-item"><a href="#" ><i class="fas fa-angle-double-right"></i> Patrimônio</a></li>
                    <li class="breadcrumb-item"><a href="<?php echo BASE_URL ?>patrimonio/consultar"><i class="fas fa-tasks"></i> Consultar Patrimônios</a></li>
                    <li class="breadcrumb-item active" aria-current="page"><a href="<?php echo BASE_URL ?>patrimonio/patrimonio/<?php echo md5($result['id']); ?>">Patrimônio: Nº <?php echo str_pad($result['id'], 5, '0', STR_PAD_LEFT) ?> </a></li>
                </ol>
            </nav>
        </div>
        <!--fim pagina-header;-->
    </div>
    <div class="row">
        <div class="col">
            <div class="row">
                <div class="col">
                    <a class="btn btn-primary btn-sm pull-right" href="<?php echo BASE_URL . 'patrimonio/editar/' . md5($result['id']); ?>" title="Editar"><i class="fa fa-pencil-alt"></i> Editar</a>  
                </div>
            </div>

            <section class="card my-3 border-secondary">
                <header class="card-header bg-dark text-while">
                    <a data-toggle="collapse" data-toggle="collapse" href="#collapseExampleProtocolo" role="button" aria-expanded="false">
                        <h4 class="card-title h6 my-1"><i class="fas fa-info-circle"></i> Dados do Protocolo<i class="fa fa-eye pull-right"></i></h4>
                    </a>
                </header>
                <div class="collapse show" id="collapseExampleProtocolo">
                    <article class="card-body py-0">
                        <div class="row">
                            <div class="col-12">
                                <p class="text-justify"><div class="text-success font-bold">Setor:</div> 
                                <?php echo (isset($result) && !empty($result['setor'])) ? $result['setor'] : ''; ?>
                                </p>
                            </div>
                            <div class="col-12">
                                <p class="text-justify"><div class="text-success font-bold">Item:</div> 
                                <?php echo (isset($result) && !empty($result['item'])) ? $result['item'] : ''; ?>
                                </p>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-3">
                                <p class="text-justify"><div class="text-success font-bold">Status do Tombamento:</div> 
                                <?php echo (isset($result) && !empty($result['tombamento'])) ? $result['tombamento'] : ''; ?>
                                </p>
                            </div>
                            <div class="col-md-3">
                                <p class="text-justify"><div class="text-success font-bold">Número do Tombamento:</div> 
                                <?php echo (isset($result) && !empty($result['numero_tombamento'])) ? $result['numero_tombamento'] : ''; ?>
                                </p>
                            </div>
                            <div class="col-md-3">
                                <p class="text-justify"><div class="text-success font-bold">Status:</div> 
                                <?php echo (isset($result) && !empty($result['status'])) ? $result['status'] : ''; ?>
                                </p>
                            </div>
                            <div class="col-md-3">
                                <p class="text-justify"><div class="text-success font-bold">Classificação:</div> 
                                <?php echo (isset($result) && !empty($result['classificacao'])) ? $result['classificacao'] : ''; ?>

                                </p>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <p class="text-justify"><div class="text-success font-bold">Fonte de Recurso:</div> 
                                <?php echo (isset($result) && !empty($result['fonte_recurso'])) ? $result['fonte_recurso'] : ''; ?>

                                </p>
                            </div>
                            <div class="col-md-4">
                                <p class="text-justify"><div class="text-success font-bold">Valor:</div> 
                                <?php echo (isset($result) && !empty($result['valor'])) ? $result['valor'] : ''; ?>

                                </p>
                            </div>
                            <div class="col-md-4">
                                <p class="text-justify"><div class="text-success font-bold">Ano de Aquisição:</div> 
                                <?php echo (isset($result) && !empty($result['ano_aquisicao'])) ? $result['ano_aquisicao'] : ''; ?>

                                </p>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12">
                                <p class="text-justify"><div class="text-success font-bold">Descrição:</div> 
                                <?php echo (isset($result) && !empty($result['descricao'])) ? $result['descricao'] : ''; ?>
                                </p>
                            </div>
                            <div class="col-12">
                                <p class="text-justify"><div class="text-success font-bold">Anexo:</div> 
                                <?php
                                if (!empty($result['anexo'])) {
                                    $file = explode('/', $result['anexo']);
                                    $fileName = end($file);
                                }
                                ?>
                                <a class="btn btn-outline-success btn-sm" href="<?php echo BASE_URL . $result['anexo']; ?>" title="Download" download="<?php echo!empty($fileName) ? $fileName : '' ?>"><i class="fas fa-download"></i> <?php echo!empty($fileName) ? $fileName : '' ?></a> 
                                </p>
                            </div>                            
                        </div>

                    </article>
                </div>
            </section>
        </div>
    </div>

</div>