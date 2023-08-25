const card = document.createElement("div");
const searchInput = document.getElementById("searchInput");
const searchInput_2 = document.getElementById("searchInput-2");
const searchButton = document.getElementById("searchButton");
const countryInfoContainer = document.getElementById("countryInfoContainer");
var countryInformation = [];
var selectedType;
var selectedCountryData = null;
// let convertedData = [];

function getAllData(){
  const apiUrl = "https://restcountries.com/v3.1/all";

fetch(apiUrl)
  .then((response) => response.json())
  .then((data) => {
      // console.log(data)
    countryInformation = data;
    console.log(countryInformation);
    // console.log(JSON.stringify(countryInformation))

  })
  .catch((error) => {
    card.innerHTML = `Sorry your country not found!  
    Please try again!`
    countryInfoContainer.appendChild(card);
    searchInput.value = '';
  })
}

getAllData();


//creating a function for conversion

function createObject(element){
  const jsonObject = {};
  // console.log(element[0].classList.contains('container'));
  if(element.classList.contains("container")){
    jsonObject.tagName = element.tagName;
    jsonObject.className = element.className;

    if(element.children.length > 0){
      jsonObject.children = [];

      for(const child of element.children){
        jsonObject.children.push(createObject(child));
      }
    }
  }
  return jsonObject;
}
  

// function createObject(){
//    convertedData = convertedData.push(new Object());
//    convertedData = convertedData.push();
//    document.querySelector(".container").tagName
//    document.querySelector(".container").childNodes;
//    console.log(convertedData);

// }


//searching by name*****
searchButton.addEventListener("click", function () {
  const searchTerm = searchInput.value.trim();
  
  if (searchTerm !== "") {
    
    const  country = countryInformation.find((c) => 
    c.name.common.toLowerCase() === searchTerm.toLowerCase()  
    // c.object.keys(currencies).name === searchTerm.toLowerCase()
    );
    if(country){
      displayCountryInfo(country);
      // createSaveButton();
      // createObject();
    }
    else{
      card.classList.add("card");
      card.innerHTML = `Sorry your country not found!  
    Please try again!`
    countryInfoContainer.appendChild(card);
    searchInput.value = '';
    }
  } 
});

//searching by prefix*********
searchButton.addEventListener("click", function () {
  const searchTerm = searchInput_2.value.trim();
  var key;
  if (searchTerm !== "") {
      
    const  country_2 = countryInformation.find((c) => 
    c.idd.root === searchTerm  
    );
    if(country_2){displayCountryInfo(country_2);
      
        // createSaveButton();
      
    }
    else{
      card.classList.add("card");
      card.innerHTML = `Sorry your country not found!  
    Please try again!`
    countryInfoContainer.appendChild(card);
    searchInput_2.value = '';
    } 
    
  } 
});

// function fetchCountryData(countryName) {
//   // const apiUrl = "https://restcountries.com/v3.1/all";

//   fetch(countryInformation)
//     .then((response) => response.json())
//     .then((data) => {
//         // console.log(data)
//       displayCountryInfo(data);
//     })
//     .catch((error) => {
//         card.innerHTML = `Sorry your country not found!  
//         Please try again!`
//         countryInfoContainer.appendChild(card);
//         searchInput.value = '';
//     })
    
// }

function displayCountryInfo(country) {
    // console.log(JSON.stringify(country));
    // console.log(country); 

  card.classList.add("card");
  card.innerHTML = `
    <img src="${country.flags.png} " alt="${country.flags.alt}" class = "image">
    <h2 class = "countryName">${country.name.common}</h2>
    <p class = "capital">Capital: ${country.capital}</p>
    <p class = "population">Population: ${country.population}</p>`;

    card.addEventListener("click", function(){
      // selectedCountryData = JSON.stringify({
      //   name:country.name.common,
      //   capital:country.capital,
      //   population:country.population,
      
      // });
      // convertedData.push(country.flags.png,
      //   country.flags.alt,
      //   country.name.common,
      //     country.capital,
      //     country.population,);
      //     console.log(JSON.stringify(convertedData));
      // createSaveButton();

      const root = document.getElementById("countryInfoContainer").children;
      // console.log(root);
      
      var ans = createObject(root);
      // console.log(JSON.stringify(ans));
      console.log((ans));

    });

    countryInfoContainer.innerHTML = "";
    countryInfoContainer.appendChild(card);
    searchInput.value = '';
    searchInput_2.value = '';
}

