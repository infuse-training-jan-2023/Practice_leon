
const cardDiv = document.getElementById("cardContainer");

async function getText() {
  let data = await fetch('https://pokeapi.co/api/v2/pokemon');
  let jsonData = await data.json();

  namedata = jsonData.results;

  namedata.forEach(r => {
    getMoreInfo(r , name)
    
  });

}


async function getMoreInfo(item){
  let moreInfodata = await fetch(item.url);
  let moreInfo = await moreInfodata.json();




 const cardDiv = document.getElementById("cardContainer");
  let newcard = document.createElement("div");
  newcard.className = "card";
  newcard.innerHTML = 
  `<div >
    <h1><b>${item.name}</b></h1>
    <img  class="imgpokemon" src=${moreInfo.sprites.front_default} onmouseover="card_back(this ,'${moreInfo.sprites.back_default}')" onmouseout="card_front(this ,'${moreInfo.sprites.front_default}')"> 
    <p class="specs">Weight :${moreInfo.weight}</p>
    <p class="specs">base_exp :${moreInfo.base_experience}</p>
    <p class="specs">hp : ${moreInfo.stats[0].base_stat}</p>
  </div>`;

  cardDiv.appendChild(newcard);
 
}


function card_back(x , url) {
  x.src=`${url}`;
}
 
function card_front(x , url) {
  x.src=`${url}`;
 
}
