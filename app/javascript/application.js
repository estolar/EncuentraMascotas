// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "@popperjs/core"
import "bootstrap"


document.addEventListener('DOMContentLoaded', function() {
  const flipButtons = document.querySelectorAll('.flip-button');

  flipButtons.forEach(function(button) {
    button.addEventListener('click', function(event) {
      event.preventDefault(); // Evita que el botón realice su acción predeterminada
      const flipCard = button.closest('.flip-card');
      flipCard.classList.toggle('flipped');
    });
  });
});
