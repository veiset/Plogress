require 'test_helper'

class RegisterControllerTest < ActionController::TestCase
  test "should get start" do
    get :start
    assert_response :success
  end

  test "should get register" do
    get :register
    assert_response :success
  end

end
