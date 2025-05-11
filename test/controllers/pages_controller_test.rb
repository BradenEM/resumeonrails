require "test_helper"

class PagesControllerTest < ActionDispatch::IntegrationTest
  # setup do
  # @user = users(:one)
  # post new_session_path, params: { email_address: @user.email_address, password: "password" }
  # end
  test "should get new session" do
    get root_path
    assert_redirected_to "/session/new"
  end
end
