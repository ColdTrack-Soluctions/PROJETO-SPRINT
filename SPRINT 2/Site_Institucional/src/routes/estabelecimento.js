var express = require("express");
var router = express.Router();

var estabelecimentoController = require("../controllers/estabelecimentoController");


router.get("/pesquisar/:fkcliente", function (req, res) {
    estabelecimentoController.pesquisarporfk(req, res);
});

router.get("/pesquisarFuncionario/:parametros", function (req, res) {
    estabelecimentoController.pesquisarporfkestabelecimento(req, res);
});
module.exports = router;