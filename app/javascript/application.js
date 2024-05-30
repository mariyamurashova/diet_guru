// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

//import * as ActiveStorage from '@rails/activestorage'
//ActiveStorage.start()
//console.log("ActiveStorage")

import Rails from '@rails/ujs';
Rails.start();
console.log("Rails")

import Cocooned from '@notus.sh/cocooned'
Cocooned.start()
console.log("Cocooned")


import jquery from 'jquery'
window.jQuery = jquery
window.$ = jquery
console.log("jquery")

//import "select2";
//console.log("select2")



import "bootstrap"

import "./custom/edit_persanal_info.js"
import "./custom/add_new_product.js"
//import "./custom/search_util.js"
import "./custom/add_new_dish.js"
