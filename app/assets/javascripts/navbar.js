// $(function(){
    // $(".navbar-wagon-link:nth-child(2)").on("click", function(e) {
    //   $(".navbar-wagon-link:nth-child(2)").addClass("active");
    // });
var navbarlinks = ".navbar-wagon-right a"
  $(navbarlinks).on("click", function(e){
    $(".navbar-wagon-right").find(".active").removeClass("active");
    $(this).addClass("active");
  });
// });

// $(".nav a").on("click", function(){
//    $(".nav").find(".active").removeClass("active");
//    $(this).parent().addClass("active");
// });

// $(function(){

//   $(".navbar-wagon-link").on("click", function(e){

//     var element = $(this).data("target");
//     $(".navbar-wagon-link").removeClass("active");
//     $(this).addClass('active');

//     $(".tab-content").addClass("hidden");

//     $(element).removeClass("hidden");


//   });

// });


