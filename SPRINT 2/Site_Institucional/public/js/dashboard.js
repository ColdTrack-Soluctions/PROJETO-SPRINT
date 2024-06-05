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


