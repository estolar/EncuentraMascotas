import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";

// Connects to data-controller="datepicker"
export default class extends Controller {
  static values = { today: String }

  connect() {
    flatpickr(this.element, {
      minDate: this.todayValue
    })
  }
}
