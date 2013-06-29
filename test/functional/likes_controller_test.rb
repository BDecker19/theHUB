require 'test_helper'

class LikesControllerTest < ActionController::TestCase
  setup do
  		@content_item = content_items(:Post1)
        @user = users(:Dave)
        # current_user.id = @user.id
  end


  test "should create like" do
    post :create, :acted_on => @content_item.id, :acted_on_type => "content_item"
    binding.pry
  end

  # test "should create action" do
  #   post :create, :acted_on => @content_item.id, :acted_on_type => "content_item"
  #   assert_equal (
  # end

end
