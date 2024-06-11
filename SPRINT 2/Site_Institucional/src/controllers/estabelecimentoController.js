var estabelecimentoModel = require("../models/estabelecimentoModel");



function pesquisarporfk(req, res) {
  var fkcliente = req.params.fkcliente;
  estabelecimentoModel.pesquisarporfk(fkcliente).then((resultado) => {
    res.status(200).json(resultado);
  });
}

function pesquisarporfkestabelecimento(req, res) {
  var fkcliente = req.params.parametros[0];
  var fkEstabelecimento = req.params.parametros[2];
  estabelecimentoModel.pesquisarporfkestabelecimento(fkcliente, fkEstabelecimento).then((resultado) => {
    res.status(200).json(resultado);
  });
}

module.exports = {
  pesquisarporfk,
  pesquisarporfkestabelecimento,
};
