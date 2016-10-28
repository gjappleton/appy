require 'test_helper'

class WelcomeControllerTest < ActionDispatch::IntegrationTest
  test "should get inde" do
    get welcome_inde_url
    assert_response :success
  end

end
