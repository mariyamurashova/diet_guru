import $ from "jquery";
$(document).ready(function(){
  $('.user_account').on('click', '.dish_info_links', function(e){
    console.log("dish info")
    e.preventDefault();
    $(this).addClass('hidden');
    $('.dish_show_view').removeClass('hidden');
  })
})
