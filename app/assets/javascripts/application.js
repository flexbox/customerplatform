//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require underscore
//= require gmaps/google
//= require_tree .


setTimeout(
  function()
  {
    $('.alert').slideUp(500);
  }, 2500);

$(function () {
  $('[data-toggle="tooltip"]').tooltip()
})
