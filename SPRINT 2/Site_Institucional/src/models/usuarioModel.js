var database = require("../database/config");

function autenticar(email, senha) {
    console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function entrar(): ", email, senha);
    var instrucaoSql = `
        SELECT idCliente, nomeCliente, emailCliente FROM cliente WHERE emailCliente = '${email}' AND senhaCliente = '${senha}';
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

// Coloque os mesmos parâmetros aqui. Vá para a var instrucaoSql
function cadastrar(nome, email, senha, cnpj) {
    console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function cadastrar():", nome, email, senha);

    // Insira exatamente a query do banco aqui, lembrando da nomenclatura exata nos valores
    //  e na ordem de inserção dos dados.
    var instrucaoSql = `
        INSERT INTO cliente (nomeCliente, emailCliente, senhaCliente, cnpjCliente) VALUES ('${nome}', '${email}', '${senha}', '${cnpj}');
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function cadastrar_estabelecimento(nomeE, uf, cidade, bairro, cep, numero, qntRefrigeradores, idCliente, telefone) {
    console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function cadastrar_estabelecimento():", nomeE, uf, cidade, bairro, cep, numero, qntRefrigeradores, idCliente, telefone);

    // Insira exatamente a query do banco aqui, lembrando da nomenclatura exata nos valores
    //  e na ordem de inserção dos dados.
    var instrucaoSql = `
    INSERT INTO estabelecimento (UnidadefederativaEstabelecimento, telefoneEstabelecimento, qtdRefrigeradores,
        númeroEstabelecimento,
        nomeEstabelecimento,
        fkCliente,
        cidadeEstabelecimento,
        cepEstabelecimento,
        bairroEstabelecimento) VALUES ('${uf}', '${telefone}', '${qntRefrigeradores}', '${numero}', '${nomeE}','${idCliente}','${cidade}','${cep}','${bairro}');
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}


function cadastrar_funcionario(id, nomeFunc, cargo, telefone, email, senha, idcliente) {
    console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function cadastrar_estabelecimento():", nomeFunc, cargo, telefone, email, senha, idcliente);

    // Insira exatamente a query do banco aqui, lembrando da nomenclatura exata nos valores
    //  e na ordem de inserção dos dados.
    var instrucaoSql = `
    INSERT INTO funcionario (idFuncionario, fkCliente,
        cargoFuncionario,
        nomeFuncionario,
        emailFuncionario,
        senhaFuncionario,
        telefoneFuncionario) VALUES  (${id}, '${idcliente}', '${cargo}', '${nomeFunc}', '${email}', '${senha}','${telefone}');
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}


function consulta_funcionario(fkCliente) {
    console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function consulta_funcionario():", fkCliente);

    // Insira exatamente a query do banco aqui, lembrando da nomenclatura exata nos valores
    //  e na ordem de inserção dos dados.
    var instrucaoSql = `
    select idFuncionario from funcionario where fkCliente = ${fkCliente} order by idFuncionario desc limit 1
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

module.exports = {
    autenticar,
    cadastrar,
    cadastrar_estabelecimento,
    cadastrar_funcionario,
    consulta_funcionario
};