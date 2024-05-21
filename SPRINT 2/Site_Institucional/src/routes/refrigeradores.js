var express = require("express");
var router = express.Router();

var refrigeradorController = require("../controllers/refrigeradorController");

router.get("/:idCliente", function (req, res) {
  refrigeradorController.buscarRefrigedadorPorEmpresa(req, res);
});

router.post("/cadastrar", function (req, res) {
  refrigeradorController.cadastrar(req, res);
})

module.exports = router;