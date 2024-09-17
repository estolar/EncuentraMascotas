import { Controller } from "@hotwired/stimulus"
import Swal from 'sweetalert2';

// Connects to data-controller="alert"
export default class extends Controller {
  connect() {
    console.log("alertas conectado!")
  }
  showAlert(event) {
    event.preventDefault(); // Detenemos el envío del formulario

    Swal.fire({
      title: '¡Registro actualizado!',
      text: 'Esperamos ayudarte a encontrarlo(a) pronto',
      icon: 'success',
      timer: 2500,
      timerProgressBar: true,
      showConfirmButton: false
    }).then(() => {
      this.element.submit();
    });
  }
}
