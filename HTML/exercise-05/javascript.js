
let data= []
async function fetch_data_base_url() {
    let base_data = await fetch('https://pokeapi.co/api/v2/pokemon');
    let base_json_data = await base_data.json();
    let pokimon_data=[]
    
    pokemon_list = base_json_data.results;

    for (const pokemon of pokemon_list){
        await fetch_pokimon_More_info(pokemon).then(x=>{pokimon_data.push(x);})
        
      }
      
    return pokimon_data
  }

async function fetch_pokimon_More_info(pokemon){
    let moreInfodata = await fetch(pokemon.url);
    moredata = await moreInfodata.json();
    moredata.pokeName = pokemon.name;
    return moredata
}
  

fetch_data_base_url().then( x => {data = x ;

    render_cards(data)
})


function render_cards(data){

    document.getElementById("cardContainer").innerHTML=""

    for (const pokemon of data){
        const cardDiv = document.getElementById("cardContainer");
        let newcard = document.createElement("div");
        newcard.className = "card";
        newcard.innerHTML = 
        `<div>
        <h1><b>${pokemon.pokeName}</b></h1>
        <img  class="imgpokemon" src=${pokemon.sprites.front_default} onmouseover="card_back(this ,'${pokemon.sprites.back_default}')" onmouseout="card_front(this ,'${pokemon.sprites.front_default}')"> 
        <p class="specs">Weight :${pokemon.weight}</p>
        <p class="specs">base_exp :${pokemon.base_experience}</p>
        <p class="specs">hp : ${pokemon.stats[0].base_stat}</p>
        <button id="moreInfo "type="button" onclick="load_more_details('${pokemon.pokeName}')">More Info!</button>
        </div>`;
        
      
        cardDiv.appendChild(newcard);
       
        
    }
}

function display(data){

    data.sort((a, b) => {
        const nameA = a.pokeName.toUpperCase(); // ignore upper and lowercase
        const nameB = b.pokeName.toUpperCase(); // ignore upper and lowercase
        if (nameA < nameB) {
          return -1;
        }
        if (nameA > nameB) {
          return 1;
        }
      
        // names must be equal
        return 0;
      });

    for (const pokemon of data){
        console.log(`name = ${pokemon.pokeName} weight = ${pokemon.weight}`)
      }
    console.log("-------------------------------------------")

    data.sort((a, b) => a.weight - b.weight);
    for (const pokemon of data){
        console.log(`name = ${pokemon.pokeName} weight = ${pokemon.weight}`)
      }
    

    console.log("-------------------------------------------")

    data.sort((a, b) => a.base_experience - b.base_experience);
    for (const pokemon of data){
        console.log(`name = ${pokemon.pokeName} base exp = ${pokemon.base_experience}`)
        }
}

function card_back(x , url) {
    x.src=`${url}`;
  }
   
  function card_front(x , url) {
    x.src=`${url}`;
   
  }
  

  function sort_cards(){
   
       index = document.getElementById("sort").selectedIndex
       if(index == 0){
        data.sort((a, b) => {
            const nameA = a.pokeName.toUpperCase(); // ignore upper and lowercase
            const nameB = b.pokeName.toUpperCase(); // ignore upper and lowercase
            if (nameA < nameB) {
              return -1;
            }
            if (nameA > nameB) {
              return 1;
            }
          
            // names must be equal
            return 0;
          });

       }
       else if(index == 1){
        data.sort((a, b) => a.weight - b.weight);
        // for (const pokemon of data){
        //     console.log(`name = ${pokemon.pokeName} weight = ${pokemon.weight}`)
        //   }
       }
       else{
        data.sort((a, b) => a.base_experience - b.base_experience);
        // for (const pokemon of data){
        //     console.log(`name = ${pokemon.pokeName} base exp = ${pokemon.base_experience}`)
        //     }
       }

       render_cards(data)
      
  }



  function search_card(){

    searchBarElement = document.getElementById("searchBar")
    search = searchBarElement.value 
    search_result= []
    console.log(search)
    search_result.push(data.find(({ pokeName }) => pokeName == search))
    console.log(search_result)

    if(search == "")
      render_cards(data)
    else
      render_cards(search_result)

  }


  function load_more_details(pokemon_name){

    pokemon = data.find(({ pokeName }) => pokeName == pokemon_name)
    document.getElementById("moreInfoIframe").srcdoc = 
    `<pre>
    species: ${pokemon.species.name}
    stat: ${pokemon.stats[0].stat.name}
          ${pokemon.stats[1].stat.name}
          ${pokemon.stats[2].stat.name}
          ${pokemon.stats[3].stat.name}
          ${pokemon.stats[4].stat.name}
                                                      
    </pre>`;
      
  }