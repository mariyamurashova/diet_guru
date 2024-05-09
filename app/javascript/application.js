// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

//import * as ActiveStorage from '@rails/activestorage'
//ActiveStorage.start()
//console.log("ActiveStorage")

import Rails from '@rails/ujs';
Rails.start();
console.log("Rails")

import jquery from 'jquery'
window.jQuery = jquery
window.$ = jquery
console.log("jquery")


import "bootstrap"

import "./custom/edit_persanal_info.js"
