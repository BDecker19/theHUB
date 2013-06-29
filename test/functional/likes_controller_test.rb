require 'test_helper'

class LikesControllerTest < ActionController::TestCase
  setup do
  		@content_item = content_items(:Post1)
        @user = users(:Dave)
        # current_user.id = @user.id
  end


  test "should create like" do
    post :create, {:acted_on => @content_item.id, :acted_on_type => "content_item"}
    binding.pry
    # assert_equal (@like.liked_id, @content_item.id)
  end

end
