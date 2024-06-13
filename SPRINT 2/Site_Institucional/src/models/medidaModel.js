var database = require("../database/config");

function buscarUltimasMedidas(idporta, idrefrigerador, idestabelecimento, idcliente, limite_linhas) {

    var instrucaoSql = `select sum(Aberturas) as Aberturas, DATE_FORMAT(HORARIO, '%W %d/%m/%Y') as Dia from dadosAbertura 
    where fkporta = ${idporta} and fkrefrigerador = ${idrefrigerador} and fkestabelecimento = ${idestabelecimento} and fkcliente = ${idcliente}
    group by Dia;`;

    // console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function buscarMedidasEmTempoReal(idRefrigerador, idEstabelecimento, idCliente) {

    var instrucaoSql = ` 
    select idDadoTemperatura as 'IdTemp', dadosTemperatura.fkRefrigerador as 'idRefrigerador', Temperatura, DATE_FORMAT(Horario,'%H:%i:%s') as 'Horario' from 
    dadosTemperatura where dadosTemperatura.fkRefrigerador = ${idRefrigerador} and dadosTemperatura.fkEstabelecimento = ${idEstabelecimento} 
    and dadosTemperatura.fkCliente = ${idCliente} order by idTemp desc limit 1;`

    // console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}
function buscarMedidasEmTempoRealPorta(idporta, idrefrigerador, idestabelecimento, idcliente) {

    var instrucaoSql = `select idDadoAbertura as 'idAbertura', Aberturas, DATE_FORMAT(Horario,'%H:%i:%s') as 'Horario', fkSensorBloqueio as 'Porta', dadosAbertura.fkrefrigerador as 'Refrigerador',
    dadosAbertura.fkestabelecimento as 'Estabelecimento',
    dadosAbertura.fkcliente as 'cliente' from dadosAbertura 
    where dadosAbertura.fkporta = ${idporta} and dadosAbertura.fkrefrigerador = ${idrefrigerador} and dadosAbertura.fkestabelecimento = ${idestabelecimento} and dadosAbertura.fkcliente = ${idcliente} order by idAbertura desc limit 1;`

    // console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

module.exports = {
    buscarUltimasMedidas,
    buscarMedidasEmTempoReal,
    buscarMedidasEmTempoRealPorta
}
