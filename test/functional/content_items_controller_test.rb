require 'test_helper'

class ContentItemsControllerTest < ActionController::TestCase

    def nil.authenticate!
      puts "Bingo! Nil is now authentic!"
    end

  test "should create content_item" do

    sign_in users(:Dave)

    assert_difference('ContentItem.count') do
      binding.pry
      post :create, { author_id: 1, title: "Test", type: "ContentItemArticle" }
      binding.pry
    end
  end



end
