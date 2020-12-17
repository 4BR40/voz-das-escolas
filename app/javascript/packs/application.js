// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";
// import "../components/grid_select";

// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';
import { previewImageOnFileSelect } from '../components/photo_preview';

//Plugin Mapbox
import { initMapbox } from '../plugins/init_mapbox';

document.addEventListener('turbolinks:load', () => {
  previewImageOnFileSelect();
  // Call your functions here, e.g:
  // initSelect2();
  initMapbox();
});

const grid = document.getElementById("grid");
var lastactive = "";

grid.onclick = (event) => {
  event.stopPropagation();
  const { className } = event.target;
  
  if (className.includes('cell')) {
    if (className.includes('active')) {
      event.target.className = 'cell';
      if(lastactive != "" && event.target === lastactive) {
        lastactive = "";
        let cells = document.querySelectorAll('.cell');
        for(let i = 0; i < cells.length; i++) {
          if(cells[i].className.includes('active')) {
            lastactive = cells[i];
            break;
          }
        }
      }
    } 
    else {
      event.target.className = 'cell active';
      if(event.ctrlKey && lastactive != "") {
        let current = event.target;
        if(event.target.compareDocumentPosition(lastactive) == 4 /*event target is before or after last active?*/) {
          while(current != lastactive) {
            current.className = 'cell active';
            current = current.nextElementSibling;
          }
        }
        else {
          while(current != lastactive) {
            current.className = 'cell active';
            current = current.previousElementSibling;
          }
        }
      }
      lastactive = event.target;
    }  
  }
  console.log(lastactive);
}

// const $ = document.querySelector.bind(document);
// const previewImg = $('.preview-img');
// const fileChooser = $('.file-chooser');

// fileChooser.onchange = e => {
//     const fileToUpload = e.target.files.item(0);
//     const reader = new FileReader();

//     // evento disparado quando o reader terminar de ler
//     reader.onload = e => previewImg.src = e.target.result;

//     // solicita ao reader que leia o arquivo
//     // transformando-o para DataURL.
//     // Isso disparará o evento reader.onload.
//     reader.readAsDataURL(fileToUpload);
// };
