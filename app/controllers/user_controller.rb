class UserController < ApplicationController

  #before_action :authenticate_user!
  #DeviseTokenAuth::Concerns::User
  def show
    authenticate_user!
    @user = current_user
  end

  def index

  end

end
