import $ from "jquery";
$(document).ready(function(){
  $('.user_accaunt').on('click', '.edit-persanal-info-link', function(e){
    console.log("edit persanal info")
    e.preventDefault();
    //$(this).hide()
    $(this).addClass('hidden');
   // var answerId = $(this).data('answerId');
    //$('.delete_file_' + answerId).removeClass('hidden');
    $('form#edit-persanal-info').removeClass('hidden');
    //$('.delete_link_' + answerId).removeClass('hidden');
  })


  .on('click', '.update-persanal-info-btn', function(e){
   // console.log("update persanal info submithed")
    //e.preventDefault();
   $('form#edit-persanal-info').hide();
   // var answerId = $(this).data('answerId');
    //$('.delete_file_' + answerId).removeClass('hidden');
    $('.edit-persanal-info-link').removeClass('hidden');
    //$('.delete_link_' + answerId).removeClass('hidden');
  })

  //.on('ajax:success', function(e) {
    // console.log(e.detail[0]['partial'])
     //const element =  document.querySelector(".user_accaunt")
     // element.insertAdjacentHTML("beforeend", e.detail[0][partial])
  //})

});
