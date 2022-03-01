// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

document.addEventListener('turbo:load', function() {
  var nav = document.getElementById('nav-wrapper');
  var hamburger = document.getElementById('js-hamburger');

  hamburger.addEventListener('click', function () {
      nav.classList.toggle('open');
  });
});