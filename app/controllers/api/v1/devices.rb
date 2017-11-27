module API
  module V1
    class Devices < Grape::API
      include API::V1::Defaults

      resource :devices do
        desc "Return all registered devices"
        get "", root: :devices do
          Device.all
        end



        #### Probably will not use a call like this, but leaving it here for reference
        # desc "Return a device"
        # params do
        #   requires :id, type: String, desc: "ID of the device"
        # end
        # get ":id", root: "device" do
        #   Device.where(id: permitted_params[:id]).first!
        # end

      end

    end
  end
end
