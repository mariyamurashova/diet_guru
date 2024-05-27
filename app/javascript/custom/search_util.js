import $ from "jquery";
import "select2"

$(document).ready(function () {
  $('#dish_product_title').select2({
        placeholder: "Выберите город",
        maximumSelectionLength: 2,
        language: "ru"
    });
});
