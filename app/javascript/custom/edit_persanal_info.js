import $ from "jquery";
$(document).ready(function(){
  $('.user_account').on('click', '.edit-persanal-info-link', function(e){
    console.log("edit persanal info")
    e.preventDefault();
    $(this).addClass('hidden');
    $('form#edit-persanal-info').removeClass('hidden');
  })


  .on('click', '.update-persanal-info-btn', function(e){
    $('form#edit-persanal-info').hide();
    $('.edit-persanal-info-link').removeClass('hidden');
  })

});
