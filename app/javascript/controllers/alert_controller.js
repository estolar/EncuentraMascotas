import { Controller } from "@hotwired/stimulus"
import Swal from 'sweetalert2';

export default class extends Controller {
  connect() {
    console.log("alertas conectado!")
  }
  showAlert(event) {

    event.preventDefault();
    console.log('turbo end conectado')
    const mode = this.element.dataset.mode;
    let title, text;
    if (mode === "new") {
      title = "¡Registro exitoso!";
      text = "Esperamos tener pronto buenas noticias para ti";
    } else if (mode === "edit") {
      title = "¡Registro actualizado!";
      text = "Has actualizado la información de tu mascotita correctamente.";
    }

    const swalOptions = {
      title: title,
      text: text,
      icon: 'success',
      timer: 2200,
      timerProgressBar: true,
      showConfirmButton: false
    };

    // if (event.detail.formSubmission.result.success) {
      console.log("hecho!");
      Swal.fire(swalOptions).then(() => {
        // Redirige después de que la alerta se ha mostrado
        this.element.submit();
      });

  }
}
