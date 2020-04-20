require 'test_helper'

class UsersShowTestTest < ActionDispatch::IntegrationTest
  def setup
    @unactivated_user = users(:john)
  end

  test 'show only displays activated users' do
    get user_path(@unactivated_user)
    assert_redirected_to root_url
    follow_redirect!
    assert_template 'static_pages/home'
  end
end
