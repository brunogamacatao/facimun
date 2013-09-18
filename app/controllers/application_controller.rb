class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def set_locale
    I18n.locale = :"pt-BR"
  end
  before_filter :set_locale
end
