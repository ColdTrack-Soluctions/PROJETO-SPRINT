var database = require("../database/config");

function autenticar(email, senha) {
    console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function entrar(): ", email, senha);
    var instrucaoSql = `
        SELECT idCliente, nomeCliente, emailCliente FROM cliente WHERE emailCliente = '${email}' AND senhaCliente = '${senha}';
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function autenticardash(idUsuario) {
 
    var instrucaoSql = `
        SELECT idCliente, nomeCliente, emailCliente FROM cliente WHERE idCliente = '${idUsuario}';
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function autenticar_funcionario(email, senha) {
    console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function entrar(): ", email, senha);
    var instrucaoSql = `
    SELECT idFuncionario, fkCliente , nomeFuncionario, emailFuncionario, fkEstabelecimento FROM funcionario WHERE emailfuncionario = '${email}' AND senhafuncionario = '${senha}';
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

function atualiza_refrigerador_estabelecimento(qtd_refrigeradores, idcliente, idEstabelecimento) {
    

    // Insira exatamente a query do banco aqui, lembrando da nomenclatura exata nos valores
    //  e na ordem de inserção dos dados.
    var instrucaoSql = `
        update estabelecimento set qtdRefrigeradores = ${qtd_refrigeradores} where fkCliente = ${idcliente} and idEstabelecimento = ${idEstabelecimento};
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function cadastrar_estabelecimento(idEstabelecimento, nomeE, uf, cidade, bairro, cep, numero, idCliente, telefone) {
    console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function cadastrar_estabelecimento():", nomeE, uf, cidade, bairro, cep, numero, idCliente, telefone);

    // Insira exatamente a query do banco aqui, lembrando da nomenclatura exata nos valores
    //  e na ordem de inserção dos dados.
    var instrucaoSql = `
    INSERT INTO estabelecimento  VALUES (${idEstabelecimento}, ${idCliente},'${nomeE}', '${uf}', '${cidade}', '${bairro}',  '${cep}', '${numero}', '${telefone}', null);
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}


function cadastrar_funcionario(id, nomeFunc, cargo, telefone, email, senha, idcliente, idEstabelecimento) {
    console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function cadastrar_estabelecimento():", nomeFunc, cargo, telefone, email, senha, idcliente);

    // Insira exatamente a query do banco aqui, lembrando da nomenclatura exata nos valores
    //  e na ordem de inserção dos dados.
    var instrucaoSql = `
    INSERT INTO funcionario VALUES  (${id}, ${idcliente}, ${idEstabelecimento} , '${cargo}', '${nomeFunc}', '${email}', '${senha}','${telefone}');
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}



function cadastrar_refrigerador(local_fisico, marca, modelo, qntportas, idCliente, idrefrigerador, idEstabelecimento) {
    console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function cadastrar_refrigerador():", local_fisico, marca, modelo, qntportas, idCliente, idrefrigerador);

    // Insira exatamente a query do banco aqui, lembrando da nomenclatura exata nos valores
    //  e na ordem de inserção dos dados.
    var instrucaoSql = `
    INSERT INTO refrigerador (idRefrigerador, fkEstabelecimento, fkCliente, localFisico,
        marca,
        modelo
        ) VALUES  (${idrefrigerador}, ${idEstabelecimento}, ${idCliente} ,'${local_fisico}', '${marca}', '${modelo}');
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}


function consulta_funcionario(fkCliente, fkEstabelecimento) {
    console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function consulta_funcionario():", fkCliente);

    // Insira exatamente a query do banco aqui, lembrando da nomenclatura exata nos valores
    //  e na ordem de inserção dos dados.
    var instrucaoSql = `
    select idFuncionario from funcionario where fkCliente = ${fkCliente} and fkEstabelecimento = ${fkEstabelecimento} order by idFuncionario desc limit 1;
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}
function consulta_refrigerador(fkCliente, fkEstabelecimento) {
    // console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function consulta_funcionario():", fkCliente);

    // Insira exatamente a query do banco aqui, lembrando da nomenclatura exata nos valores
    //  e na ordem de inserção dos dados.
    var instrucaoSql = `
    select idRefrigerador from refrigerador where fkcliente = ${fkCliente} and fkestabelecimento = ${fkEstabelecimento} order by idRefrigerador desc limit 1;
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function cadastrar_sensorTemperatura(idcliente, idrefrigerador, idestabelecimento, idsensor, modelo){
    var cmd = `
    insert into SensorTemperatura values (
    ${idsensor}, ${idrefrigerador}, ${idestabelecimento}, ${idcliente}, '${modelo}'
    );
    `
    return database.executar(cmd)
}

function cadastrar_portaRefrigerador(idporta, idcliente,idrefrigerador, idestabelecimento, produto, tipoporta){
    var cmd = `
    insert into portaRefrigerador values (
    ${idporta}, ${idrefrigerador}, ${idestabelecimento}, ${idcliente}, '${produto}', '${tipoporta}'
    )

    `
    return database.executar(cmd)
}

function cadastrar_sensorBloqueio(idporta, idcliente, idrefrigerador, idestabelecimento, idsensor, modelo){
    var cmd = `
    insert into SensorBloqueio values (
    ${idsensor}, ${idporta}, ${idrefrigerador}, ${idestabelecimento}, ${idcliente}, '${modelo}'
    )

    `
    return database.executar(cmd)
}



function mockarAberturas(iddado, idsensor, idporta, idrefrigerador, idestabelecimento, idcliente, aberturas, horario){

var cmd = `
insert into dadosabertura values (${iddado}, ${idsensor},${idporta}, ${idrefrigerador}, ${idestabelecimento}, ${idcliente}, ${aberturas}, '${horario}')
`
return database.executar(cmd)
}



module.exports = {
    autenticar,
    autenticardash,
    autenticar_funcionario,
    cadastrar,
    cadastrar_estabelecimento,
    cadastrar_refrigerador,
    cadastrar_funcionario,
    consulta_funcionario,
    consulta_refrigerador,
    atualiza_refrigerador_estabelecimento,
    cadastrar_sensorTemperatura,
    cadastrar_portaRefrigerador,
    cadastrar_sensorBloqueio,
    mockarAberturas

};