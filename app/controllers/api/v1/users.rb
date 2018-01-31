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

          #requires :mac, type: String, desc: 'MAC address'
        end
        # Pass params via via query string vars in a GET request

        # Authenticate user credentials and account-device association.
        post "/validate" do
          params do
            requires :mac, type: String, desc: 'MAC address'
          end
          if validateUser
              if @user.devices.include?( Device.find_by_mac params[:mac] )
                retval = true
              end
          end
          retval
        end

        # Responds with json device data for devices associated with the current user, via device serializer.
        post "/devices" do
          if validateUser
            @user.devices
          end
        end

        # Responds with json user data for the current user, via user serializer.
        post "/user" do
          if validateUser
            @user
          end
        end

      end

    end
  end
end
