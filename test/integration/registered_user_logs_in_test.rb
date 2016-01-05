require 'test_helper'

class RegisteredUserLogsInTest < ActionDispatch::IntegrationTest
  # include Capybara::DSL
test "existing user can log in" do
  user = User.create(username: 'Rachel', password: 'password')

  visit login_path

  fill_in "Username", with: 'Rachel'
  fill_in "Password", with: 'password'

  click_on "Login"

  assert_equal user_path(user), current_path
  assert page.has_content?("Rachel")
  assert page.has_content?("Welcome back!"), "no flash message"
end

end
