require 'test_helper'

class DeviceControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get device_create_url
    assert_response :success
  end

end
