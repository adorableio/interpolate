class ApplicationController < ActionController::API
  before_filter :determine_request_version

  private

  def determine_request_version
    @request_version = env['API_REQUEST_VERSION']
  end
end
