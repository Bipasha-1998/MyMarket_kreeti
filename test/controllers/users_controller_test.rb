require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
    
    def setup
        @user = users(:user1)
        @other_user = users(:user2)
    end
    
    test "should get new" do
        get signup_path
        assert_response :success
    end

    test "should redirect index when not logged in" do
        get users_path
        assert_redirected_to login_url
    end

    test "should not redirect edit when logged in as wrong user" do
        log_in_as(@other_user)
        get edit_user_path(@user)
        assert_not flash.empty?
        assert_redirected_to root_path
    end
    test "should not redirect update when logged in as wrong user" do
        log_in_as(@other_user)
        patch user_path(@user), params: { user: { username: @user.username,
                                                email: @user.email } }
        assert_not flash.empty?
        assert_redirected_to root_path
    end
end