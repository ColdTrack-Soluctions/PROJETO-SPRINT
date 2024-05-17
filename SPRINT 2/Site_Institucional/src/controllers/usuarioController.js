var usuarioModel = require("../models/usuarioModel");

function autenticar(req, res) {
    var email = req.body.emailServer;
    var senha = req.body.senhaServer;

    if (email == undefined) {
        res.status(400).send("Seu email está undefined!");
    } else if (senha == undefined) {
        res.status(400).send("Sua senha está indefinida!");
    } else {

        usuarioModel.autenticar(email, senha)
            .then(
                function (resultadoAutenticar) {
                    console.log(`\nResultados encontrados: ${resultadoAutenticar.length}`);
                    console.log(`Resultados: ${JSON.stringify(resultadoAutenticar)}`); // transforma JSON em String

                    if (resultadoAutenticar.length == 1) {
                        console.log(resultadoAutenticar);

                        res.status(200).json(resultadoAutenticar[0]);


                    } else if (resultadoAutenticar.length == 0) {
                        res.status(403).send("Email e/ou senha inválido(s)");
                    } else {
                        res.status(403).send("Mais de um usuário com o mesmo login e senha!");
                    }
                }
            ).catch(
                function (erro) {
                    console.log(erro);
                    console.log("\nHouve um erro ao realizar o login! Erro: ", erro.sqlMessage);
                    res.status(500).json(erro.sqlMessage);
                }
            );
    }

}

function consulta_funcionario(req, res){
    var fkCliente = req.body.FkClienteServer;

    if (fkCliente == undefined) {
        res.status(400).send("Seu fkcliente da tabela funcionario está undefined!");
    } else {

        usuarioModel.consulta_funcionario(fkCliente)
            .then(
                function (resultado) {
                    console.log(`\nResultados encontrados: ${resultado.length}`);
                    console.log(`Resultados: ${JSON.stringify(resultado)}`); // transforma JSON em String

                    if (resultado.length == 1) {
                        console.log(resultado);
                        res.status(200).json(resultado[0]);
                    } else if (resultado.length == 0) {
                        res.status(403).send("O cliente não tem funcionarios");
                    } else {
                        res.status(403).send("ERROEEREOREORERO");
                    }
                }
            ).catch(
                function (erro) {
                    console.log(erro);
                    console.log("\nHouve um erro ao realizar o login! Erro: ", erro.sqlMessage);
                    res.status(500).json(erro.sqlMessage);
                }
            );
    }

    // usuarioModel.consulta_funcionario(res).then(
    //     function(resultado) {
    //         if (resultado.length >= 1) {
    //             // console.log('resultado: ' + JSON.stringify(resultado, null, 2))
    //             return JSON.stringify(resultado);
    //         }else{
                
    //             console.log('abc')
    //                                     }  
    //     }
    // ).catch(console.log('bca'));

}



function cadastrar(req, res) {
    // Crie uma variável que vá recuperar os valores do arquivo cadastro.html
    var nome = req.body.nomeServer;
    var email = req.body.emailServer;
    var senha = req.body.senhaServer;
    var cnpj = req.body.cnpjServer;


    // Faça as validações dos valores
    if (nome == undefined) {
        res.status(400).send("Seu nome está undefined!");
    } else if (email == undefined) {
        res.status(400).send("Seu email está undefined!");
    } else if (senha == undefined) {
        res.status(400).send("Sua senha está undefined!");
    }
    else if (cnpj == undefined) {
        res.status(400).send("Sua senha está undefined!");
    }
    else {

        // Passe os valores como parâmetro e vá para o arquivo usuarioModel.js
        usuarioModel.cadastrar(nome, email, senha, cnpj)
            .then(
                function (resultado) {
                    res.json(resultado);
                }
            ).catch(
                function (erro) {
                    console.log(erro);
                    console.log(
                        "\nHouve um erro ao realizar o cadastro! Erro: ",
                        erro.sqlMessage
                    );
                    res.status(500).json(erro.sqlMessage);
                }
            );
    }
}


function cadastrar_estabelecimento(req, res) {
    // Crie uma variável que vá recuperar os valores do arquivo cadastro.html

    var nomeE = req.body.nomeEServer;
    var uf = req.body.ufServer;
    var cidade = req.body.cidadeServer;
    var bairro = req.body.bairroServer;
    var cep = req.body.cepServer;
    var numero = req.body.numeroServer;
    var qntRefrigeradores = req.body.qntRefrigeradoresServer;
    var idCliente = req.body.IdClienteServer;
    var telefone = req.body.telefoneServer;

    // Faça as validações dos valores
    if (nomeE == undefined) {
        res.status(400).send("Seu nome está undefined!");
        console.log("Seu nome está undefined!");
    } else if (uf == undefined) {
        res.status(400).send("Seu email está undefined!");
        console.log("Seu uf está undefined!");
    } else if (cidade == undefined) {
        res.status(400).send("Sua senha está undefined!");
        console.log("Sua cidade está undefined!");
    }
    else if (bairro == undefined) {
        res.status(400).send("Sua senha está undefined!");
        console.log("Sua bairro está undefined!");
    }
    else if (cep == undefined) {
        res.status(400).send("Sua senha está undefined!");
        console.log("Sua cep está undefined!");
    }
    else if (numero == undefined) {
        res.status(400).send("Sua senha está undefined!");
        console.log("Sua numero está undefined!");
    }
    else if (qntRefrigeradores == undefined) {
        res.status(400).send("Sua senha está undefined!");
        console.log("Sua qntRefri está undefined!");
    }
    else if (idCliente == undefined) {
        res.status(400).send("Sua senha está undefined!");
        console.log("Sua idCliente está undefined!");
    }
    else if (telefone == undefined) {
        res.status(400).send("Sua senha está undefined!");
        console.log("Sua telefone está undefined!");
    }
    else {

        // Passe os valores como parâmetro e vá para o arquivo usuarioModel.js
        usuarioModel.cadastrar_estabelecimento(nomeE, uf, cidade, bairro, cep, numero, qntRefrigeradores, idCliente, telefone)
            .then(
                function (resultado) {
                    res.json(resultado);
                }
            ).catch(
                function (erro) {
                    console.log(erro);
                    console.log(
                        "\nHouve um erro ao realizar o cadastro! Erro: ",
                        erro.sqlMessage
                    );
                    res.status(500).json(erro.sqlMessage);
                }
            );
    }
}


async function cadastrar_funcionario(req, res) {
    // Crie uma variável que vá recuperar os valores do arquivo cadastro.html


    var nomeFunc = req.body.nomeFuncServer;
    var cargo = req.body.cargoServer;
    var telefone = req.body.telefoneServer;
    var email = req.body.emailServer;
    var senha = req.body.senhaServer;
    var idCliente = req.body.idClienteServer;

    // Faça as validações dos valores
    if (nomeFunc == undefined) {
        res.status(400).send("Seu nome está undefined!");
        console.log("Seu nome está undefined!");
    } else if (cargo == undefined) {
        res.status(400).send("Seu cargo está undefined!");
        console.log("Seu uf está undefined!");
    } else if (telefone == undefined) {
        res.status(400).send("Sua telefone está undefined!");
        console.log("Sua cidade está undefined!");
    }
    else if (email == undefined) {
        res.status(400).send("Sua email está undefined!");
        console.log("Sua bairro está undefined!");
    }
    else if (senha == undefined) {
        res.status(400).send("Sua senha está undefined!");
        console.log("Sua cep está undefined!");
    }
    else if (idCliente == undefined) {
        res.status(400).send("Sua idCliente está undefined!");
        console.log("Sua numero está undefined!");
    }
    else {

       
      
        const id = await usuarioModel.consulta_funcionario(idCliente).then((data) =>{
            return data.length == 0 ? 1 : data[0].idFuncionario + 1;
        })

        // Passe os valores como parâmetro e vá para o arquivo usuarioModel.js
        usuarioModel.cadastrar_funcionario(id,nomeFunc,
            cargo,
            telefone,
            email,
            senha,
            idCliente)
            .then(
                function (resultado) {
                    res.json(resultado);
                }
            ).catch(
                function (erro) {
                    console.log(erro);
                    console.log(
                        "\nHouve um erro ao realizar o cadastro! Erro: ",
                        erro.sqlMessage
                    );
                    res.status(500).json(erro.sqlMessage);
                }
            );
    }
}

module.exports = {
    autenticar,
    cadastrar,
    cadastrar_estabelecimento,
    cadastrar_funcionario,
    consulta_funcionario
};