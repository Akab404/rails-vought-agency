import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="totalprice"
export default class extends Controller {
  static targets = ["price", "checkin", "checkout", "totalPrice"]

  calcul(){
    // 132 => price
    // 13.03.2024
    // 1.03.2024
    const priceInt = parseInt(this.priceTarget.innerHTML, 10)
    const checkinMonth = parseInt(this.checkinTarget.value.split("-")[1], 10)
    const checkoutMonth = parseInt(this.checkoutTarget.value.split("-")[1], 10)
    const checkinDay = parseInt(this.checkinTarget.value.split("-")[0], 10)
    const checkoutDay =  parseInt(this.checkoutTarget.value.split("-")[0], 10)


    const countedMonth = checkoutMonth - checkinMonth

    if (countedMonth == 0) {
      const total = priceInt*(checkoutDay - checkinDay)
      this.totalPriceTarget.innerHTML = `Total prestation : <span class="total-price-value">${total}</span> €`
    } else {
      const total = priceInt*((30*countedMonth)-(checkoutDay- checkinDay))
      this.totalPriceTarget.innerHTML =  `Total prestation : <span class="total-price-value">${total}</span> €`
    }
  }
}
