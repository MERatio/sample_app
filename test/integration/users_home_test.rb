require 'test_helper'

class UsersHomeTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:michael)
  end

  test 'home page stats' do
    log_in_as(@user)
    get root_path
    assert_select 'a[href=?]', following_user_path(@user)
    assert_match @user.following.count.to_s, response.body
    assert_select 'a[href=?]', followers_user_path(@user)
    assert_match @user.followers.count.to_s, response.body
  end
end
