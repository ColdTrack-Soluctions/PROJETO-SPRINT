var medidaModel = require("../models/medidaModel");
const { param } = require("../routes");

function buscarUltimasMedidas(req, res) {

    const limite_linhas = 7;

    var idAquario = req.params.idAquario;

    console.log(`Recuperando as ultimas ${limite_linhas} medidas`);

    medidaModel.buscarUltimasMedidas(idAquario, limite_linhas).then(function (resultado) {
        if (resultado.length > 0) {
            res.status(200).json(resultado);
        } else {
            res.status(204).send("Nenhum resultado encontrado!")
        }
    }).catch(function (erro) {
        console.log(erro);
        console.log("Houve um erro ao buscar as ultimas medidas.", erro.sqlMessage);
        res.status(500).json(erro.sqlMessage);
    });
}


function buscarMedidasEmTempoReal(req, res) {
    const parametros = req.params.parametros;

    var idRefrigerador = parametros[0];
    var idEstabelecimento = parametros[2];
    var idCliente = parametros[4];
 
    medidaModel.buscarMedidasEmTempoReal(idRefrigerador, idEstabelecimento, idCliente).then(function (resultado) {
        if (resultado.length > 0) {
            res.status(200).json(resultado);
        } else {
            res.status(204).send("Nenhum resultado encontrado!")
        }
    }).catch(function (erro) {
        console.log(erro);
        console.log("Houve um erro ao buscar as ultimas medidas.", erro.sqlMessage);
        res.status(500).json(erro.sqlMessage);
    });
}

function buscarMedidasEmTempoRealPorta(req, res) {

    var idPorta = req.params.parametros[0];
    var idRefrigerador = req.params.parametros[2];
    var idEstabelecimento = req.params.parametros[4];
    var idCliente = req.params.parametros[6];

    // console.log(idPorta, idRefrigerador, idEstabelecimento, idCliente);

    // res.status(204).send('erro')
    console.log(`Recuperando medidas em tempo real`);
    medidaModel.buscarMedidasEmTempoRealPorta(idPorta, idRefrigerador, idEstabelecimento, idCliente).then(function (resultado) {
        if (resultado.length > 0) {
            console.log(resultado);
            res.status(200).json(resultado);

        } else {
            res.status(204).send("Nenhum resultado encontrado!")
        }
    }).catch(function (erro) {
        console.log(erro);
        console.log("Houve um erro ao buscar as ultimas medidas.", erro.sqlMessage);
        res.status(500).json(erro.sqlMessage);
    });
}

module.exports = {
    buscarUltimasMedidas,
    buscarMedidasEmTempoReal,
    buscarMedidasEmTempoRealPorta

}