var alertas = [];

function obterdados(a, b, c) {

    const parametros = [a, b, c];
    // console.log(JSON.stringify(parametros.length));

    fetch(`/medidas/tempo-real/${parametros}`)
        .then(resposta => {
            if (resposta.status == 200) {
                resposta.json().then(resposta => {

                    // console.log(`Dados recebidos: ${JSON.stringify(resposta)}`);
                    if(resposta[0].Temperatura > 10){
                        alerta(resposta[0].Temperatura, resposta[0].idRefrigerador, resposta[0].Horario)
                    }

                    const element = document.getElementById(`temp_refrigerador_${parametros[0]}`);
                    if (element) {
                        element.innerHTML = `<span class="temperatura" id="temperatura">${resposta[0].Temperatura}</span> °C`;
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

function alerta(Temperatura, Refrigerador, Horario) {

    
    alert(`AVISO!, O REFRIGERADOR DE ID ${Refrigerador} ESTA COM A TEMPERATURA DE ${Temperatura} aos ${Horario}.`)
    

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
    setTimeout(atualizacaoPeriodica, 5000);
}
