require 'test_helper'

class RegisterFlowsTest < ActionDispatch::IntegrationTest
  test "can see register page" do
    get "/register"
    assert_select "h1", "Register"
  end
end
