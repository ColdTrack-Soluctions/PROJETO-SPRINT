var database = require("../database/config");

function buscarUltimasMedidas(idporta, idrefrigerador, idestabelecimento, idcliente, limite_linhas) {

    var instrucaoSql = `select sum(Aberturas) as Aberturas, DATE_FORMAT(HORARIO, '%W %d/%m/%Y') as Dia from DadosAbertura 
    where fkporta = ${idporta} and fkrefrigerador = ${idrefrigerador} and fkestabelecimento = ${idestabelecimento} and fkcliente = ${idcliente}
    group by Dia;`;

    // console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function buscarMedidasEmTempoReal(idRefrigerador, idEstabelecimento, idCliente) {

    var instrucaoSql = ` 
    select idDadoTemperatura as 'IdTemp', dadostemperatura.fkRefrigerador as 'idRefrigerador', Temperatura, DATE_FORMAT(Horario,'%H:%i:%s') as 'Horario' from 
    dadostemperatura where dadostemperatura.fkRefrigerador = ${idRefrigerador} and dadostemperatura.fkEstabelecimento = ${idEstabelecimento} 
    and dadostemperatura.fkCliente = ${idCliente} order by idTemp desc limit 1;`

    // console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}
function buscarMedidasEmTempoRealPorta(idporta, idrefrigerador, idestabelecimento, idcliente) {

    var instrucaoSql = `select idDadoAbertura as 'idAbertura', Aberturas, DATE_FORMAT(Horario,'%H:%i:%s') as 'Horario', fkSensorBloqueio as 'Porta', dadosabertura.fkrefrigerador as 'Refrigerador',
    dadosabertura.fkestabelecimento as 'Estabelecimento',
    dadosabertura.fkcliente as 'cliente' from dadosabertura 
    where dadosabertura.fkporta = ${idporta} and dadosabertura.fkrefrigerador = ${idrefrigerador} and dadosabertura.fkestabelecimento = ${idestabelecimento} and dadosabertura.fkcliente = ${idcliente} order by idAbertura desc limit 1;`

    // console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

module.exports = {
    buscarUltimasMedidas,
    buscarMedidasEmTempoReal,
    buscarMedidasEmTempoRealPorta
}
