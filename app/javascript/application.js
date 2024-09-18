// application.js
import "@hotwired/turbo-rails";
import "controllers";
import "@popperjs/core";
import "bootstrap";

// Funcionalidad principal
document.addEventListener('turbo:load', function() {

  // Funcionalidad de flip-button
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
  var navbar = document.querySelector('.navbar-lewagon');
  if (navbar) { // Asegurarnos de que el navbar existe
    var lastScrollTop = 0; // Guardamos la posición del scroll anterior

    window.addEventListener('scroll', function() {
      var currentScroll = window.pageYOffset || document.documentElement.scrollTop;

      if (currentScroll > 100) {
        // Añadimos la clase 'scrolled' cuando el usuario se desplaza más de 100px
        navbar.classList.add('scrolled');
      } else {
        // Removemos la clase 'scrolled' cuando volvemos a la parte superior
        navbar.classList.remove('scrolled');
      }
    });
  }
  // Funcionalidad de compartir
  const shareButtons = document.querySelectorAll('.share-button');

  shareButtons.forEach(button => {
    button.addEventListener('click', function() {
      const title = button.getAttribute('data-title');
      const text = button.getAttribute('data-text');
      const url = button.getAttribute('data-url');
      const imageUrl = button.getAttribute('data-image-url'); // La URL de la imagen

      // Verificamos si el navegador soporta compartir archivos
      if (navigator.canShare && navigator.canShare({ files: [new File([], 'dummy.png')] })) {
        fetch(imageUrl)
          .then(res => res.blob())
          .then(blob => {
            const file = new File([blob], 'pet-image.jpg', { type: 'image/jpeg' });

            navigator.share({
              title: title,
              text: text,
              url: url,
              files: [file]  // Compartir el archivo
            }).then(() => {
              console.log('¡Compartido exitosamente!');
            }).catch(error => {
              console.error('Error al compartir:', error);
              showShareModal(title, text, url, imageUrl);
            });
          })
          .catch(error => {
            console.error('Error al obtener la imagen:', error);
            showShareModal(title, text, url, imageUrl);
          });

      } else if (navigator.share) {
        // Si el navegador soporta la Web Share API pero no archivos
        navigator.share({
          title: title,
          text: text,
          url: url
        }).then(() => {
          console.log('¡Compartido exitosamente!');
        }).catch(console.error);
      } else {
        // Mostrar un modal personalizado si Web Share API no está disponible
        showShareModal(title, text, url, imageUrl);
      }
    });
  });
});

// Función para mostrar un modal personalizado para compartir
function showShareModal(title, text, url, imageUrl) {
  const modalHtml = `
    <div class="custom-share-modal">
      <h5>Compartir en:</h5>
      <ul>
        <li><a href="https://www.facebook.com/sharer/sharer.php?u=${encodeURIComponent(url)}" target="_blank">Facebook</a></li>
        <li><a href="https://twitter.com/intent/tweet?text=${encodeURIComponent(text)}&url=${encodeURIComponent(url)}" target="_blank">Twitter</a></li>
        <li><a href="https://api.whatsapp.com/send?text=${encodeURIComponent(text)} ${encodeURIComponent(url)}" target="_blank">WhatsApp</a></li>
      </ul>
      <button class="btn btn-secondary close-share-modal">Cerrar</button>
    </div>
  `;

  const modalContainer = document.createElement('div');
  modalContainer.classList.add('modal-overlay');
  modalContainer.innerHTML = modalHtml;
  document.body.appendChild(modalContainer);

  // Cerrar el modal
  document.querySelector('.close-share-modal').addEventListener('click', function() {
    document.body.removeChild(modalContainer);
  });
};
