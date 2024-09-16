import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="type-pet"
export default class extends Controller {

  static targets = ['perro', 'gato', 'otros']

  connect() {
    console.log("conectado type-pet!");
  }

  // hideBreeds(type1, type2) {

  //   if (type1.classList === "") {
  //     this.type1.classList.add('d-none')
  //   }
  //   if (type2.classList === "") {
  //     this.type2.classList.add('d-none')
  //   }
  // }
  showBreed(event) {
    console.log('evento conectado');
    const selectedType = event.target.value;
    // console.log(event.target.value)
    if (selectedType === 'perro') {
      this.perroTarget.classList.remove('d-none');
      // this.hideBreeds(gatoTarget, otrosTarget);
      this.gatoTarget.classList.add('d-none')
      this.otrosTarget.classList.add('d-none')

    } else if (selectedType === 'gato') {
      this.gatoTarget.classList.remove('d-none');

      this.perroTarget.classList.add('d-none')
      this.otrosTarget.classList.add('d-none')

    } else if (selectedType === 'otros') {
      this.otrosTarget.classList.remove('d-none');
      this.perroTarget.classList.add('d-none')
      this.gatoTarget.classList.add('d-none')
    }

  }
}
