class ApplicationController < ActionController::Base
  before_action do
    ActiveStorage::Current.host = request.base_url
  end
end
