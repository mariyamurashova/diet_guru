import { Application } from "@hotwired/stimulus"

const application = Application.start()

import jQuery from "jquery"
window.jQuery = jQuery // <- "select2" will check this
window.$ = jQuery

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }
