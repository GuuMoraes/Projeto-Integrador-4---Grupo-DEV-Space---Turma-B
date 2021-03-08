<%-- 
    Document   : Cursos
    Created on : 28 de fev de 2021, 21:30:41
    Author     : Gustavo Moraes
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
        <link href="CSS/navBar.css" rel="stylesheet">
        <link href="CSS/table.css" rel="stylesheet">
        <link href="CSS/Cadastro.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro de Produtos</title>
    </head>
    <body>
        <!-- Button trigger modal -->
        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
            Launch demo modal
        </button>

        <!-- Modal -->
        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" >
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                       
                        <div style="display: flex; flex-direction: row; justify-content: center; align-items: center">
                            <form class="form-horizontal" style="width: 1000px;" >
                                <fieldset>
                                    <div class="panel panel-primary">
                                        <div class="panel-heading">Cadastro de Cursos</div>
                                        <div class="panel-body">
                                            <div class="form-group">
                                                <div class="col-md-11 control-label">
                                                    <p class="help-block"><h11>*</h11> Campo Obrigatório </p>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-md-2 control-label" for="Nome">Nome do Curso <h11>*</h11></label>  
                                                <div class="col-md-8">
                                                    <input id="Nome" name="txtNome" placeholder="Nome do Curso" class="form-control input-md" required="" type="text" minlength="3" maxlength="280">
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label class="col-md-2 control-label" for="Descricao">Descrição <h11>*</h11></label>  
                                                <div class="col-md-8">
                                                    <textarea required="" name="txtdescricao" placeholder="Descrição do Curso" class="form-control input-md" required="" type="text" id="exampleFormControlTextarea1" rows="3" minlength="0" maxlength="2000"></textarea>
                                                </div>
                                            </div>


                                            <div class="form-group">
                                                <label class="col-md-2 control-label" for="Estrelas">Estrelas<h11>*</h11></label>
                                                <div class="col-md-2">
                                                    <div class="input-group">
                                                        <span class="input-group-addon"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star-half" viewBox="0 0 16 16">
                                                            <path d="M5.354 5.119L7.538.792A.516.516 0 0 1 8 .5c.183 0 .366.097.465.292l2.184 4.327 4.898.696A.537.537 0 0 1 16 6.32a.55.55 0 0 1-.17.445l-3.523 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256a.519.519 0 0 1-.146.05c-.341.06-.668-.254-.6-.642l.83-4.73L.173 6.765a.55.55 0 0 1-.171-.403.59.59 0 0 1 .084-.302.513.513 0 0 1 .37-.245l4.898-.696zM8 12.027c.08 0 .16.018.232.056l3.686 1.894-.694-3.957a.564.564 0 0 1 .163-.505l2.906-2.77-4.052-.576a.525.525 0 0 1-.393-.288L8.002 2.223 8 2.226v9.8z"/>
                                                            </svg></span>
                                                        <input id="estrelas" name="txtestrelas" class="form-control" placeholder="" required="" type="number" min="0" max="5">
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label class="col-md-2 control-label" for="Status">Status <h11>*</h11></label>
                                                <div class="col-md-2">
                                                    <select required class="form-select form-select-lg mb-3" aria-label="Selecione" name="txtstatus">
                                                        <option selected>Selecione</option>
                                                        <option value="Ativo" >Ativo</option>
                                                        <option value="Inativo" >Inativo</option>
                                                    </select>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label class="col-md-2 control-label" for="QntVagas">Quant. de Vagas <h11>*</h11></label>
                                                <div class="col-md-2">
                                                    <input id="QntVagas" name="txtQntVagas" placeholder="Qnt de Vagas" class="form-control input-md" required="" type="number" min="1">
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label class="col-md-2 control-label" for="Preço">Preço <h11>*</h11></label>
                                                <div class="col-md-2">
                                                    <input id="Preço" name="txtpreco" placeholder="Ex.: 000.00" class="form-control input-md" required="" type="text" pattern="\d.\d{2}">
                                                </div>
                                            </div>


                                            <div class="form-group mb-11 xl">
                                                <label class="col-md-2 control-label" for="img">Adicionar Imagem<h11>*</h11></label>
                                                <div class="col-md-6">
                                                    <div class="input-group">
                                                        <input type="file" class="form-control" id="inputGroupFile02">
                                                        <button class="btn btn-secondary" type="button" id="inputGroupFileAddon04" type="Submit" style="position: absolute">Upload</button>

                                                    </div>
                                                    <div class="form-check">
                                                        <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault" >
                                                        <label class="form-check-label" for="flexCheckDefault">
                                                            Imagem da Página Principal
                                                        </label>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label class="col-md-2 control-label" for="Cadastrar"></label>
                                                <div class="col-md-10">
                                                    <button id="Cadastrar" name="Cadastrar" class="btn btn-success" type="Submit" style="background-color: #198754; border-color: #198754;">Cadastrar</button>
                                                    <a id="Cancelar" name="Cancelar" class="btn btn-danger" href="Listar%20Cursos.jsp">Cancelar</a>
                                                </div>
                                            </div>
                                        </div>
                                </fieldset>
                            </form>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary">Save changes</button>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
