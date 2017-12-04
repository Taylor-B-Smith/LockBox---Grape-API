class ApplicationController < ActionController::Base
  #include DeviseTokenAuth::Concerns::SetUserByToken
  protect_from_forgery with: :exception

  def index

  end

  private
  def after_sign_out_path_for(resource_or_scope)
    root_path
  end



end
