require File.expand_path("../config/initializers/interpol", __FILE__)
require 'interpol/documentation_app'

run Interpol::DocumentationApp.build
