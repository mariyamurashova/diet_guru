import $ from "jquery";
$(document).ready(function(){
  $('.dish_info').on('click', '.dish_edit_link', function(e){
    console.log("dish info")
    e.preventDefault();
    $(this).addClass('hidden');
    $('form#add-new-dish').removeClass('hidden');
  })
})
