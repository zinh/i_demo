require 'test_helper'

class LoginFlowsTest < ActionDispatch::IntegrationTest
  setup do
    @user = User.create(email: 'valid@email.com',
                     password: '12345678',
                     password_confirmation: '12345678')
  end

  test "can see login page" do
    get '/login'
    assert_response :success
    assert_select "h1", "Login"
  end

  test "can login" do
    post "/login", params: { email: @user.email, password: @user.password }
    assert_redirected_to '/profile'
    follow_redirect!
    assert_response :success
    assert_select "h1", "Welcome valid"
  end

  test "logined fail with wrong credential" do
    post "/login", params: { email: "nonexist@email.com", password: "12345678" }
    assert_response :success
    assert_match "Incorrect email/password", @response.body
  end
end
