$(function(){

  $(".navbar-wagon-link").on("click", function(e){
    // Change active tab

    // Hide all tab-content (use class="hidden")

    // Show target tab-content (use class="hidden")

    var element = $(this).data("link");
    $(".navbar-wagon-link").removeClass("active");
    $(this).addClass('active');
  });

});


