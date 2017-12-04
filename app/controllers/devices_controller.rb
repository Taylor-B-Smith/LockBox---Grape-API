class DevicesController < ApplicationController


  def create
    @user = User.find(params[:user_id])
    @device = @user.devices.create(device_params)
    redirect_to user_path(@user)
  end

  def index

  end

  def show
    @user = User.find(params[:user_id])
    @device = @user.devices.find(params[:id])

    # delete device on show is bad practice
    # unsure why it isn't routing to destroy
    @device.delete

    redirect_to user_path(@user)
  end

  def destroy
    @user = User.find(params[:user_id])
    @device = @user.devices.find(params[:id])
    @device.delete
    redirect_to user_path(@user)
  end

  private

  def device_params
    params.require(:device).permit(:mac)
  end

end
