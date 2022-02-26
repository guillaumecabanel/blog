class ApplicationController < ActionController::Base
  before_action :set_active_storage_current_host
  before_action :record_page_view

  private

  def set_active_storage_current_host
    ActiveStorage::Current.host = request.base_url
  end

  def record_page_view
    ActiveAnalytics.record_request(request)
  end
end
