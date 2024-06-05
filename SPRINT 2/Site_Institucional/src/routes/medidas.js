var express = require("express");
var router = express.Router();

var medidaController = require("../controllers/medidaController");

router.get("/ultimas/:idAquario", function (req, res) {
    medidaController.buscarUltimasMedidas(req, res);
});

router.get("/tempo-real/:parametros", function (req, res) {
    medidaController.buscarMedidasEmTempoReal(req, res);
})
router.get("/tempo-real-porta/:parametros", function (req, res)
 {
    medidaController.buscarMedidasEmTempoRealPorta(req, res);
})


router.get("/aberturasSemana/:parametros", function (req, res)
 {
    medidaController.buscarAberturaSemana(req, res);
});

module.exports = router;