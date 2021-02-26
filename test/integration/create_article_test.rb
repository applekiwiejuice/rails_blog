require 'test_helper'

class CreateArticleTest < ActionDispatch::IntegrationTest
    test "should go to new_article_path and create article" do
      get new_article_path
      assert_response :success
      assert_difference 'Article.count', 1 do
        post articles_path, params: { article: { title: "Silicon Valley", body: "This is an awesome TV series" } }
        assert_equal response.code, "302"
    end
    follow_redirect!
    assert_response :success
  end
end