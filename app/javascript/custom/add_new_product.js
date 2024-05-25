import $ from "jquery";
$(document).ready(function(){
  $('.user_account').on('click', '.add-new-product-link', function(e){
    console.log("edit persanal info")
    e.preventDefault();
    $(this).addClass('hidden');
    $('form#add-new-product').removeClass('hidden');
  })

  .on('click', '.add-new-product-btn', function(e){
    $('form#add-new-product').addClass('hidden');
    $('.add-new-product-link').removeClass('hidden');
    console.log(e.detail[0])
    render_message(e.detail[0]);
  
  })

  .on('ajax:error', function (e) { 
      render_errors(e.detail[0]);
    });

  function render_message(message) {
    $('.notice').html(" ");
    $('.notice').append('<p>' + message + '</p>');
  }

  function render_errors(errors) {
    console.log(errors)
    $('.notice').html(" ");
    var errors = errors;

    $.each(errors, function(index, value) {
      $('.notice').append('<p>' + value + '</p>');
    })
  }

});
