import { Controller } from "@hotwired/stimulus"
import Swal from 'sweetalert2';

// Connects to data-controller="alert"
export default class extends Controller {
  connect() {
    console.log("alertas conectado!")
  }
  showAlert() {
    Swal.fire({
      title: '¡Hola!',
      text: 'Registro exitoso',
      icon: 'success',
      confirmButtonText: 'Ok'
    });
  }
}
