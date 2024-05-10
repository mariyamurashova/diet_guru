import $ from "jquery";
$(document).ready(function(){
  $('.user_account').on('click', '.edit-persanal-info-link', function(e){
    console.log("edit persanal info")
    e.preventDefault();
    $(this).addClass('hidden');
    $('form#edit-persanal-info').removeClass('hidden');
    $('#delete_photo_link').removeClass('hidden');
  })

  .on('click', '#delete_photo_link', function(e){
    $('#user_avatar').hide();
  })


  .on('click', '.update-persanal-info-btn', function(e){
    $('form#edit-persanal-info').addClass('hidden');
    $('#delete_photo_link').addClass('hidden');
    $('.edit-persanal-info-link').removeClass('hidden');
  })

});
