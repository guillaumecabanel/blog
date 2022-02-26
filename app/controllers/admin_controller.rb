class AdminController < ApplicationController
  http_basic_authenticate_with name: ENV["ADMIN_NAME"], password: ENV["ADMIN_PASSWORD"] if Rails.env.production?
  skip_before_action :record_page_view
end
