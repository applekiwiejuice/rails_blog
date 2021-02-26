require 'test_helper'

class DeleteArticleTest < ActionDispatch::IntegrationTest
   setup do
     @article = articles(:one)
   end

    test "should go to article_path - /articles/:id(.:format) and delete article" do
       get article_path(@article)
       assert_response :success
       assert_difference 'Article.count', -1 do
        delete article_path(@article)
        assert_equal response.code, "302"
      end
    follow_redirect!
    assert_response :success
  end
end