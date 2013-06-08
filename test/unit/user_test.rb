require 'test_helper'

class UserTest < ActiveSupport::TestCase
 
    def setup
        @user = users(:dave)        
        @newVote = votes(:sampleVote)
    end

    test "user created" do
        assert_equal(@user.email, "dave@yahoo.com", "Email not set correctly")
        assert_equal(@user.class, Admin, "Type not set correctly")
    end


    test "user should show votes" do
        assert_not_nil(@user.votes[0], "Not finding vote")
    end

end
