require 'test_helper'

class EditArticleTest < ActionDispatch::IntegrationTest
    setup do
     @article = articles(:one)
    end

    test "should go to edit_article_path - /articles/:id(.:format) and patch/edit article" do
       get edit_article_path(@article)
       assert_response :success
        patch article_path(@article), params: { article: { title: "Silicon Valley: The TV Series", body: "This is an awesome TV series from HBO" } }
        assert_equal response.code, "302"
    follow_redirect!
    assert_response :success
  end
end