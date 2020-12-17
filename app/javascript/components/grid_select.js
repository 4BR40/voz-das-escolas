const grid = document.getElementById("grid");
var lastactive = "";

grid.onclick = (event) => {
  // event.stopPropagation();
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