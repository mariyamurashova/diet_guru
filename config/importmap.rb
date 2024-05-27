# Pin npm packages by running ./bin/importmap

pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin "@rails/ujs", to: "https://ga.jspm.io/npm:@rails/ujs@7.1.2/app/assets/javascripts/rails-ujs.esm.js"
pin "jquery", to: "https://ga.jspm.io/npm:jquery@3.7.1/dist/jquery.js", preload: true
pin_all_from "app/javascript/controllers", under: "controllers"

pin "bootstrap", to: "https://ga.jspm.io/npm:bootstrap@5.3.2/dist/js/bootstrap.esm.js"
pin "@popperjs/core", to: "https://ga.jspm.io/npm:@popperjs/core@2.11.8/lib/index.js"
pin_all_from 'app/javascript/custom', under: 'custom'

pin "@rails/activestorage", to: "https://ga.jspm.io/npm:@rails/activestorage@7.1.2/app/assets/javascripts/activestorage.esm.js"
pin "select2", to: "https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"
pin "@notus.sh/cocooned", to: "https://ga.jspm.io/npm:@notus.sh/cocooned@2.0.4/index.js"

