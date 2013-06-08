require 'test_helper'

class VoteTest < ActiveSupport::TestCase
    
    def setup
        @vote = votes(:sampleVote)
    end

    test "vote created" do
        assert_equal(@vote.votable.title, "News Title", "Vote not set correctly")
        binding.pry
    end
end
