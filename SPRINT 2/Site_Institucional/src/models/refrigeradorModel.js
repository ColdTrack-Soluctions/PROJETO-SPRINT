var database = require("../database/config");

function buscarRefrigeradorPorCliente(idcliente) {

  var instrucaoSql = `select idEstabelecimento as 'Estabelecimento_id', nomeEstabelecimento as 'Estabelecimento_nome', fkCliente as 'Cliente_Id', qtdRefrigeradores as 'Refrigeradores_qtd', idRefrigerador as 'Refrigerador_id' from estabelecimento join  refrigerador on fkestabelecimento = idestabelecimento 
  where fkcliente = ${idcliente};
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
  cadastrar
}
