import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="fakelazy"
export default class extends Controller {
  static targets = ["reveal"]

  connect() {
    const firststargets = this.revealTargets.slice(0, 5);

    firststargets.forEach(li => {
      li.classList.add("magic-reveal");
    });

  }

  magicreveal() {
    const scrolltop = window.scrollY;


    this.revealTargets.forEach(li => {

      if (li.offsetTop < (window.innerHeight + scrolltop)) {
          li.classList.add("magic-reveal");
      }
    });
  }


}
