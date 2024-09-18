import { Controller } from "@hotwired/stimulus"
import Swal from 'sweetalert2';

export default class extends Controller {
  connect() {
    console.log("alertas conectado!")
  }
  showAlert(event) {
    event.preventDefault();
    console.log('turbo end conectado')
    // console.log(event.detail)
    console.log(event.detail.success)
    // console.log(event.detail.formSubmission)
    console.log(event.detail.formSubmission.result.success)
    console.log(Swal)
    // event.preventDefault();
    const mode = this.element.dataset.mode;
    let title, text;
    if (mode === "new") {
      title = "¡Registro exitoso!";
      text = "Esperamos tener pronto buenas noticias para ti";
    } else if (mode === "edit") {
      title = "¡Registro actualizado!";
      text = "Has actualizado la información de tu mascotita correctamente.";
    }


    if (event.detail.formSubmission.result.success) {
      console.log("hecho!");
      Swal.fire({
        title: 'Success',
        text: 'You are connected',
        icon: 'success',
        timer: 5000,
        timerProgressBar: true
      }).then(() => {
        // Redirige después de que la alerta se ha mostrado
        this.element.submit();
      });
    } else {
      console.log("error");
      Swal.fire({
        icon: "error",
        title: "Oops...",
        text: "Something went wrong!",
        footer: '<a href="#">Why do I have this issue?</a>',
        timer: 5000,
        timerProgressBar: true
      }).then(() => {
        // Redirige o maneja el error después de que la alerta se ha mostrado
        this.element.submit();
      });
    }
  }
}
