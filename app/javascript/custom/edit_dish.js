import $ from "jquery";
$(document).ready(function(){
  $('.user_account').on('click', '.edit-dish-link', function(e){
    console.log("dish info")
    e.preventDefault();
    $(this).addClass('hidden');
    $('.edit_dish_form').removeClass('hidden');
  })
})
