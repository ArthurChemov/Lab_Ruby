class ApplicationController < ActionController::Base
  def after_sign_in_path_for(deviseuser)
    '/links'
  end
end
