var express = require("express");
var router = express.Router();

var usuarioController = require("../controllers/usuarioController");

//Recebendo os dados do html e direcionando para a função cadastrar de usuarioController.js
router.post("/cadastrar", function (req, res) {
    usuarioController.cadastrar(req, res);
})
router.post("/cadastrar_estabelecimento", function (req, res) {
    usuarioController.cadastrar_estabelecimento(req, res);
})

router.post("/cadastrar_funcionario", function (req, res) {
    usuarioController.cadastrar_funcionario(req, res);
})

router.post("/consulta_funcionario", function (req, res) {
    usuarioController.consulta_funcionario(req, res);
})

router.post("/autenticar", function (req, res) {
    usuarioController.autenticar(req, res);
});

module.exports = router;