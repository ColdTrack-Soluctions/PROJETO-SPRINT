var estabelecimentoModel = require("../models/estabelecimentoModel");



function pesquisarporfk(req, res) {
  var fkcliente = req.params.fkcliente;
  estabelecimentoModel.pesquisarporfk(fkcliente).then((resultado) => {
    res.status(200).json(resultado);
  });
}
module.exports = {
  pesquisarporfk
};
