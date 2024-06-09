import $ from "jquery";
import "select2"
$(document).ready(function(){

$('.select2_ingredient').select2();

$('.user_dishes').on('click', '.add-new-dish-link', function(e){
   
    e.preventDefault();
    $(this).addClass('hidden');
    $('form#add-new-dish').removeClass('hidden');
    console.log("add new dish")
  })

  .on('click', '.add-new-dish-btn', function(e){
    $('form#add-new-dish').addClass('hidden');
    $('.add-new-dish-link').removeClass('hidden');
    console.log(e.detail[0])
    render_message(e.detail[0]);
  })
  
  .on('ajax:success', function(e) { 
    $('form#add-new-dish').addClass('hidden');
    append_dish_link(e.detail[0]['dish'])
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

  function append_dish_link(dish_title) {
    let aTag = document.createElement('a'); 
    aTag.innerHTML='<li>'+dish_title +'</li>';

    aTag.href=dish_title;
    $('.user_dishes').append(aTag);
  }

});
