// sessão
function validarSessao() {
    var email = sessionStorage.EMAIL_USUARIO;
    var nome = sessionStorage.NOME_USUARIO;

    var b_usuario = document.getElementById("b_usuario");

    if (email != null && nome != null) {
        b_usuario.innerHTML = nome;
    } else {
        window.location = "../login.html";
    }
}

async function buscar_estabelecimentos(slc) {
    var idCliente = sessionStorage.ID_USUARIO;

    const estabelecimentos = await fetch(`/estabelecimento/pesquisar/${idCliente}`, { cache: 'no-store' }).then(async (response) => {
        if (response.ok) {
            const resposta = await response.json();
            return JSON.stringify(resposta);
        } else {
            console.error('Nenhum dado encontrado ou erro na API');
        }
    })
        .catch(function (error) {
            console.error(`Erro na obtenção dos dados p/ estabelecimentos: ${error.message}`);
        });

    if (slc != undefined) {

        var mensagem = '';
        console.log('resposta: ' + estabelecimentos);
        JSON.parse(estabelecimentos).forEach(item => {
            mensagem += `
    <option value="${item.idEstabelecimento}">${item.nomeEstabelecimento}</option>
    `;
        });

        estabelecimento_escolha.innerHTML = `
    
    <p class="perguntas">Estabelecimento</p>
    <select name="estalebecimento_slc" id="estabelecimento_slc">
                        
        ${mensagem}
    </select>
    
    `;
    } else {
        return estabelecimentos;
    }

}
async function buscar_estabelecimentos2(slc) {
    var idCliente = sessionStorage.ID_USUARIO;
    var fkEstabelecimento = sessionStorage.FK_ESTABELECIMENTO;
    var lista = [idCliente, fkEstabelecimento]
    const estabelecimentos = await fetch(`/estabelecimento/pesquisarFuncionario/${lista}`, { cache: 'no-store' }).then(async (response) => {
        if (response.ok) {
            const resposta = await response.json();
            return JSON.stringify(resposta);
        } else {
            console.error('Nenhum dado encontrado ou erro na API');
        }
    })
        .catch(function (error) {
            console.error(`Erro na obtenção dos dados p/ estabelecimentos: ${error.message}`);
        });

    if (slc != undefined) {

        var mensagem = '';
        console.log('resposta: ' + estabelecimentos);
        JSON.parse(estabelecimentos).forEach(item => {
            mensagem += `
    <option value="${item.idEstabelecimento}">${item.nomeEstabelecimento}</option>
    `;
        });

        estabelecimento_escolha.innerHTML = `
    
    <p class="perguntas">Estabelecimento</p>
    <select name="estalebecimento_slc" id="estabelecimento_slc">
                        
        ${mensagem}
    </select>
    
    `;
    } else {
        return estabelecimentos;
    }

}
function limparSessao() {
    sessionStorage.clear();
    window.location = "../login.html";
}

function Autenticar_Usuario(usuario, email, id) {

    if (usuario == undefined || email == undefined || id == undefined) {
        window.location = 'pagina-login.html';
    }

    else {
        console.log('ESTOU AUTENTICADO');
    }
}

// carregamento (loading)
function aguardar() {
    var divAguardar = document.getElementById("div_aguardar");
    divAguardar.style.display = "flex";
}

function finalizarAguardar(texto) {
    var divAguardar = document.getElementById("div_aguardar");
    divAguardar.style.display = "none";

    var divErrosLogin = document.getElementById("div_erros_login");
    if (texto) {
        divErrosLogin.style.display = "flex";
        divErrosLogin.innerHTML = texto;
    }
}

function logout() {
    sessionStorage.removeItem('EMAIL_USUARIO');
    sessionStorage.removeItem('NOME_USUARIO');
    sessionStorage.removeItem('ID_USUARIO');
    sessionStorage.removeItem('Refrigeradores');
    sessionStorage.removeItem('PortasRefrigeradores');
    sessionStorage.removeItem('nomeEstabelecimento');
    sessionStorage.removeItem('idEstabelecimento');


    document.location.href = 'index.html';

}

function autenticarLogado() {
    var usuario = sessionStorage.ID_USUARIO;
    var idestabelecimento = sessionStorage.idEstabelecimento;
    fetch("/usuarios/autenticardash", {
        method: "POST",
        headers: {
            "Content-Type": "application/json"
        },
        body: JSON.stringify({
            usuarioServer: usuario,
            estabelecimentoServer: idestabelecimento
        })
    }).then(function (resposta) {
        // console.log("ESTOU NO THEN DO entrar()!");

        if (resposta.ok) {
            // console.log('ENTREI AQUI');
            // console.log(resposta);
            //     setTimeout(function espera() {
            //         window.location.href = 'principal-cadastrado.html';
            //     }, 2300);
            resposta.json().then(json => {
                // console.log('ESTOU NO JSON');
                // console.log(json);
                // console.log(JSON.stringify(json));
                mensagem = '<span style =" color: green"> Login correto! </span> ';
                sessionStorage.EMAIL_USUARIO = json.email;
                sessionStorage.NOME_USUARIO = json.nome;
                sessionStorage.ID_USUARIO = json.id;
                sessionStorage.setItem('Refrigeradores', JSON.stringify(json.refrigeradores));
                sessionStorage.setItem('PortasRefrigeradores', JSON.stringify(json.portasrefrigeradores));

            });

            // finalizarAguardar();


            // console.log('DEU CERTOOOOOOOOOOOOOOOOOOOOOO');
        } else {

            console.log("Houve um erro ao tentar realizar o login!");
            mensagem = ' <span style =" color: lightcoral">Erro! Login ou senha inválidos.</span>';
            tentativas--;

            resposta.text().then(texto => {
                console.error(texto);
            });
        }

    }).catch(function (erro) {
        console.log(erro);
    });


}