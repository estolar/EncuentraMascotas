// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "@popperjs/core"
import "bootstrap"

// Funcionalidad de flip-button
document.addEventListener('turbo:load', function() {
  const flipButtons = document.querySelectorAll('.flip-button');

  flipButtons.forEach(function(button) {
    button.addEventListener('click', function(event) {
      event.preventDefault(); // Evita que el botón realice su acción predeterminada
      const flipCard = button.closest('.flip-card');
      flipCard.classList.toggle('flipped');
    });
  });

  // AOS para animaciones
  AOS.init({
    duration: 1000, // Duración de las animaciones en milisegundos
    once: true, // Animar solo una vez
  });
    // Sticky navbar funcionalidad
    // var navbar = document.querySelector('.navbar');

    // if (navbar) { // Asegurarnos de que el navbar existe
    //   var stickyOffset = navbar.offsetTop;

    //   // Evento que se activa al hacer scroll
    //   window.addEventListener('scroll', function() {
    //     if (window.pageYOffset > stickyOffset) {
    //       navbar.classList.add('sticky-top');
    //     } else {
    //       navbar.classList.remove('sticky-top');
    //     }
    //   });
    // }


});

document.addEventListener('DOMContentLoaded', function() {
  var navbar = document.querySelector('.navbar-lewagon');
  var lastScrollTop = 0; // Guardamos la posición del scroll anterior

  // Evento que se activa al hacer scroll
  window.addEventListener('scroll', function() {
    var currentScroll = window.pageYOffset || document.documentElement.scrollTop;

    if (currentScroll > 100) {
      // Añadimos la clase 'scrolled' cuando el usuario se desplaza más de 100px
      navbar.classList.add('scrolled');
    } else {
      // Removemos la clase 'scrolled' cuando volvemos a la parte superior
      navbar.classList.remove('scrolled');
    }

    lastScrollTop = currentScroll <= 0 ? 0 : currentScroll; // Para evitar valores negativos en la parte superior de la página
  });
});
