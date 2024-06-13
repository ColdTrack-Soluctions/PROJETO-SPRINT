async function obterdadosdashboard(){

    try{
    const response = await fetch(`/medidas/ultimas/`, { cache: 'no-store' })

    const data = await response.json()
    // console.log(data)
    return data
    
    }catch(erro){
        throw new Error(erro)
    }

}

async function obterdadosdashboard(parametros){
    console.log(parametros)
    try{

    const response = await fetch(`/medidas/aberturasSemana/${parametros}`)
    const data = await response.json()
    return data
    
    }catch(erro){
        throw new Error(erro)
    }
}


async function atualizar_dash(dash, parametros){

    const dados = await obterdadosdashboard(parametros);
    const label_dash = []
    const data_dash = []
    dados.forEach(dado => {
        label_dash.push(dado.Dia)
        data_dash.push(dado.Aberturas)
      });

      dash.config.data.datasets[0].data = data_dash;
      dash.update();


}


