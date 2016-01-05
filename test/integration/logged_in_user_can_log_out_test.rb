require 'test_helper'

class LoggedInUserCanLogOutTest < ActionDispatch::IntegrationTest
  # include Capybara::DSL

  test "logging out" do
    user = User.create(username: 'Rachel', password: 'password')

    visit login_path

    fill_in "Username", with: 'Rachel'
    fill_in "Password", with: 'password'

    click_on "Login"

    assert page.has_content?("Welcome back!"), "no flash message"

    click_link 'logout'
    refute page.has_content?("Rachel")
    assert page.has_content?("Log In")

  end
end
