require 'test_helper'

class DbmanagerControllerTest < ActionController::TestCase
  test "should get form" do
    get :form
    assert_response :success
  end

end
