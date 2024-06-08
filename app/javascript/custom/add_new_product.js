import $ from "jquery";
$(document).ready(function(){
  $('.create_product').on('click', '.add-new-product-link', function(e){
    console.log("create product")
    e.preventDefault();
    $(this).addClass('hidden');
    $('form#add-new-product').removeClass('hidden');
  })

  .on('click', '.add-new-product-btn', function(e){
    $('form#add-new-product').addClass('hidden');
    $('.add-new-product-link').removeClass('hidden');  
  })

  .on('ajax:success', function(e) { 
    console.log(e.detail[0])
    render_message(e.detail[0]['text']);
    })
  
  .on('ajax:error', function(e) { 
     render_errors(e.detail[0]);
    })

  function render_message(message) {
    $('.notice').html(" ");
    $('.notice').append('<p>' + message + '</p>');
  }

  function render_errors(errors) {
    console.log(errors)
    $('.errors').html(" ");
    var errors = errors;

    $.each(errors, function(index, value) {
      $('.errors').append('<p>' + value + '</p>');
    })
  }

});
