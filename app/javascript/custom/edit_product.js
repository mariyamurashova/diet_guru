import $ from "jquery";
$(document).ready(function(){
  $('.products').on('click', '.product_edit_link', function(e){
    console.log("product edit")
    e.preventDefault();
    $(this).addClass('hidden');
    var productId = $(this).data('productId');
    $('form#edit-product-'+productId).removeClass('hidden');
  })

  .on('click', '.product-info-link', function(e){
    console.log("product info")
    e.preventDefault();
    $(this).addClass('hidden');
    var productId = $(this).data('productId');
    $('.product'+productId+'_info').removeClass('hidden');
  })
})
