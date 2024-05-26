var database = require("../database/config");

function pesquisarporfk(fkcliente) {
  var instrucaoSql = `select * from estabelecimento where fkcliente = ${fkcliente};`;
  return database.executar(instrucaoSql);
}

function consultar_estabelecimento(idCliente){
  var instrucaoSql = `
  select idEstabelecimento from estabelecimento where fkCliente = ${idCliente} order by idEstabelecimento desc limit 1
  `
  return database.executar(instrucaoSql)
}
module.exports = { pesquisarporfk, consultar_estabelecimento};
