import { Controller } from "stimulus"


export default class extends Controller {
  static targets = [ "cell" ]

  // connect() {
  //   console.log('Hello');
  //   // this.outputTarget.textContent = 'Hello, Stimulus!'
  // }

  toggle() {
    // console.log("click")

    if (this.cellTarget.classList.contains('active')){
      this.cellTarget.classList.remove('active');
    } else this.cellTarget.classList.add('active');
  };
}