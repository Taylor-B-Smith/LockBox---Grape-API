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
        # TODO shouldn't use POST for this. find a way to pass params with GET
        # do this via query string vars

        # validate user credentials and account-device association
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

        post "/devices" do
          if validateUser
            @user.devices
          end
        end

        post "/user" do
          if validateUser
            @user
          end
        end

      end

    end
  end
end
