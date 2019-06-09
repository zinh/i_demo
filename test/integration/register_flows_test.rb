require 'test_helper'

class RegisterFlowsTest < ActionDispatch::IntegrationTest
  setup do
    @user = { email: 'valid@email.com',
              username: 'valid',
              password: 'valid_password',
              password_confirmation: 'valid_password' }
  end

  test "can see register page" do
    get "/register"
    assert_response :success
    assert_select "h1", "Register"
  end

  test "submit user register form" do
    post "/register", params: { user: @user }
    assert_response :redirect
    follow_redirect!
    assert_response :success
    user = User.last
    assert_equal @user[:email], user.email
    assert_select "h1", "Welcome #{@user[:username]}"
  end
end
