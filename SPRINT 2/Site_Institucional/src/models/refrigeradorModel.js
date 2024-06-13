var database = require("../database/config");

function buscarRefrigeradorPorCliente(idcliente, idestabelecimento) {

  var instrucaoSql = `select * from refrigerador 
  where refrigerador.fkcliente = ${idcliente} and refrigerador.fkestabelecimento = ${idestabelecimento};
  `;
  console.log("Executando a instrução SQL: \n" + instrucaoSql);
  return database.executar(instrucaoSql);
}
function buscarPortasPorRefrigerador(idestabelecimento, idcliente) {

  var instrucaoSql = ` select * from portaRefrigerador where fkestabelecimento = ${idestabelecimento} and fkcliente = ${idcliente};
  `;
  

  console.log("Executando a instrução SQL: \n" + instrucaoSql);
  return database.executar(instrucaoSql);
}

function cadastrar(empresaId, descricao) {
  
  var instrucaoSql = `INSERT INTO (descricao, fk_empresa) aquario VALUES (${descricao}, ${empresaId})`;

  console.log("Executando a instrução SQL: \n" + instrucaoSql);
  return database.executar(instrucaoSql);
}


module.exports = {
  buscarRefrigeradorPorCliente,
  cadastrar,
  buscarPortasPorRefrigerador
}
