class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :set_locale, :get_path

  def set_locale
    I18n.locale = current_user.language if current_user
    I18n.locale = params[:language]   if !current_user
  end

  def get_path
    uri = URI(request.url)
    @path = uri.path
  end
end
