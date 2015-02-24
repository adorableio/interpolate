require File.expand_path("../config/initializers/interpol", __FILE__)
require 'interpol/stub_app'

run Interpol::StubApp.build
