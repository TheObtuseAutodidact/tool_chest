require 'test_helper'

class UserCreationTest < ActionDispatch::IntegrationTest
  # include Capybara::DSL

  test "user is registered" do
    visit new_user_path

    fill_in "Username", with: 'Rachel'
    fill_in "Password", with: 'password'
    fill_in "Password confirmation", with: 'password'

    click_on "Create Account"

    user = User.last

    assert_equal user_path(user), current_path
    assert page.has_content?("Rachel")
    assert page.has_content?("Account Created"), "no flash here"
  end
end
