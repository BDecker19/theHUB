require 'test_helper'

class UserTest < ActiveSupport::TestCase
 
    def setup
        @user = users(:dave)
    end

    test "user created" do
        assert_equal(@user.email, "dave@yahoo.com", "Email not set correctly")
        assert_equal(@user.class, Admin, "Type not set correctly")
    end

end
