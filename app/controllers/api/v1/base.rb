

module API
  module V1
    class Base < Grape::API

      #include DeviseTokenAuth::Concerns::SetUserByToken


      mount API::V1::Devices
      mount API::V1::Users

    end
  end
end
