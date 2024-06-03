var alertas = [];

function obterdados(a, b, c) {

    const parametros = [a, b, c];
    // console.log(JSON.stringify(parametros.length));

    fetch(`/medidas/tempo-real/${parametros}`)
        .then(resposta => {
            if (resposta.status == 200) {
                resposta.json().then(resposta => {

                    // console.log(`Dados recebidos: ${JSON.stringify(resposta)}`);
                    const element = document.getElementById(`temp_refrigerador_${parametros[0]}`);
                    if (element) {
                        element.innerHTML = `${resposta[0].Temperatura} -°C`;
                    } else {
                        console.error(`Elemento com ID temp_refrigerador_${parametros[0]} não encontrado.`);
                    }

                    // alertar(resposta, idRefrigerador);
                });
            } else {
                const element = document.getElementById(`temp_refrigerador_${parametros[0]}`);
                if (element) {
                    element.innerHTML = `N/A`;
                } else {
                    console.error(`Elemento com ID temp_refrigerador_${parametros[0]} não encontrado.`);
                }
            }
        })
        .catch(function (error) {
            console.error(`Erro na obtenção dos dados do aquario p/ gráfico: ${error.message}`);
        });

}
function obterdadosportas(parametros) {
    fetch(`/medidas/tempo-real-porta/${parametros}`)
        .then(resposta => {
            if (resposta.status == 200) {
                resposta.json().then(resposta => {

                    
                    // console.log(resposta);

                    const element = document.getElementById(`abertura_porta_${parametros[0]}_refrigerador_${parametros[1]}`);
                    if (element) {
                        element.innerHTML = `Aberturas: ${resposta[0].Aberturas}`;
                    } else {
                        // console.error(`Elemento com ID abertura_porta_${parametros[0]} não encontrado.`);
                    }

                    // alertar(resposta, idRefrigerador);
                });
            } else {
                // console.error(`Nenhum dado encontrado para o id ${parametros[0]} ou erro na API`);
                const element = document.getElementById(`abertura_porta_${parametros[0]}`);
                    if (element) {
                        element.innerHTML = `Aberturas: N/A`;
                    } else {
                        // console.error(`Elemento com ID abertura_porta_${parametros[0]} não encontrado.`);
                    }
            }
        })
        .catch(function (error) {
            console.error(`Erro na obtenção dos dados do aquario p/ gráfico: ${error.message}`);
        });

}

function alertar(resposta, idAquario) {
    var temp = resposta[0].temperatura;

    var grauDeAviso = '';

    var limites = {
        muito_quente: 23,
        quente: 22,
        ideal: 20,
        frio: 10,
        muito_frio: 5
    };

    var classe_temperatura = 'cor-alerta';

    if (temp >= limites.muito_quente) {
        classe_temperatura = 'cor-alerta perigo-quente';
        grauDeAviso = 'perigo quente'
        grauDeAvisoCor = 'cor-alerta perigo-quente'
        exibirAlerta(temp, idAquario, grauDeAviso, grauDeAvisoCor)
    }
    else if (temp < limites.muito_quente && temp >= limites.quente) {
        classe_temperatura = 'cor-alerta alerta-quente';
        grauDeAviso = 'alerta quente'
        grauDeAvisoCor = 'cor-alerta alerta-quente'
        exibirAlerta(temp, idAquario, grauDeAviso, grauDeAvisoCor)
    }
    else if (temp < limites.quente && temp > limites.frio) {
        classe_temperatura = 'cor-alerta ideal';
        removerAlerta(idAquario);
    }
    else if (temp <= limites.frio && temp > limites.muito_frio) {
        classe_temperatura = 'cor-alerta alerta-frio';
        grauDeAviso = 'alerta frio'
        grauDeAvisoCor = 'cor-alerta alerta-frio'
        exibirAlerta(temp, idAquario, grauDeAviso, grauDeAvisoCor)
    }
    else if (temp <= limites.muito_frio) {
        classe_temperatura = 'cor-alerta perigo-frio';
        grauDeAviso = 'perigo frio'
        grauDeAvisoCor = 'cor-alerta perigo-frio'
        exibirAlerta(temp, idAquario, grauDeAviso, grauDeAvisoCor)
    }

    var card;

    if (document.getElementById(`temp_aquario_${idAquario}`) != null) {
        document.getElementById(`temp_aquario_${idAquario}`).innerHTML = temp + "°C";
    }

    if (document.getElementById(`card_${idAquario}`)) {
        card = document.getElementById(`card_${idAquario}`)
        card.className = classe_temperatura;
    }
}

function exibirAlerta(temp, idAquario, grauDeAviso, grauDeAvisoCor) {
    var indice = alertas.findIndex(item => item.idAquario == idAquario);

    if (indice >= 0) {
        alertas[indice] = { idAquario, temp, grauDeAviso, grauDeAvisoCor }
    } else {
        alertas.push({ idAquario, temp, grauDeAviso, grauDeAvisoCor });
    }

    exibirCards();
}

function removerAlerta(idAquario) {
    alertas = alertas.filter(item => item.idAquario != idAquario);
    exibirCards();
}

function exibirCards() {
    alerta.innerHTML = '';

    for (var i = 0; i < alertas.length; i++) {
        var mensagem = alertas[i];
        alerta.innerHTML += transformarEmDiv(mensagem);
    }
}

function transformarEmDiv({ idAquario, temp, grauDeAviso, grauDeAvisoCor }) {

    var descricao = JSON.parse(sessionStorage.AQUARIOS).find(item => item.id == idAquario).descricao;
    return `
    <div class="mensagem-alarme">
        <div class="informacao">
            <div class="${grauDeAvisoCor}">&#12644;</div> 
            <h3>${descricao} está em estado de ${grauDeAviso}!</h3>
            <small>Temperatura capturada: ${temp}°C.</small>   
        </div>
        <div class="alarme-sino"></div>
    </div>
    `;
}

 async function atualizacaoPeriodica() {
    var refrigeradores = JSON.parse(sessionStorage.getItem('Refrigeradores'));
    refrigeradores.forEach(item => {
        obterdados(item.idRefrigerador, item.fkEstabelecimento, item.fkCliente);
   
  
    });
    var portasrefrigeradores = JSON.parse(sessionStorage.getItem('PortasRefrigeradores'))
    portasrefrigeradores.forEach(item =>{
        const parametros = [item.idPorta, item.fkRefrigerador, item.fkEstabelecimento, item.fkCliente]
        obterdadosportas(parametros);





    })

            // console.log(refrigeradores);
    setTimeout(atualizacaoPeriodica, 5000);
}
