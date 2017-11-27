module API
  module V1
    class Users < Grape::API
      include API::V1::Defaults
      resource :users do
        desc "Return all users"
        get "", root: :users do
          User.all
        end

        desc "Return true if creds and MAC are associated"
        params do
          requires :email, type: String, desc: 'email'
          requires :password, type: String, desc: 'password'
          requires :mac, type: String, desc: 'MAC address'
        end
        # TODO shouldn't use post for this. find a way to pass params with get
        post "/validate" do
          @user = User.find_by_email params[:email]
          retval = "false"
          if @user != nil
            if @user.valid_password? params[:password]
              if @user.devices.include?( Device.find_by_mac params[:mac] )
                retval = "true"
              end
            end
          end
          retval
        end


      end

    end
  end
end
