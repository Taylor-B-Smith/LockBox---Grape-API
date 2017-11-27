class DevicesController < ApplicationController


  def create
    @user = User.find(params[:user_id])
    @device = @user.devices.create(device_params)
    redirect_to user_path(@user)
  end

  def index

  end

  private

  def device_params
    params.require(:device).permit(:mac)
  end

end
