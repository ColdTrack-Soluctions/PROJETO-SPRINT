var database = require("../database/config");

function buscarUltimasMedidas(idAquario, limite_linhas) {

    var instrucaoSql = `SELECT 
        dht11_temperatura as temperatura, 
        dht11_umidade as umidade,
                        momento,
                        DATE_FORMAT(momento,'%H:%i:%s') as momento_grafico
                    FROM medida
                    WHERE fk_aquario = ${idAquario}
                    ORDER BY id DESC LIMIT ${limite_linhas}`;

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
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
