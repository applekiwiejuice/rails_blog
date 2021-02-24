require 'test_helper'

class ArticleTest < ActiveSupport::TestCase

  test 'should not save when title is blank' do
    article = Article.new(title: "Not blank", body: "1234567890")
    assert_not article.save
    assert_equal article.errors.full_messages.to_sentence, "Title can't be blank"
  end

  test 'should not save when description is blank' do
    article = Article.new(title: "Lego: The Movie", body: "")
    assert_not article.save
    assert_equal article.errors.full_messages.to_sentence, "Description can't be blank and Description is too short (minimum is 10 characters)"
  end

  test 'should not save when description is less than 10 characters' do
    article = Article.new(title: "Lego: The Movie", body: "123456")
    assert_not article.save
    assert_equal("Description is too short (minimum is 10 characters)", article.errors.full_messages.to_sentence)
  end

  test 'should save when everything is awesome' do
    article = Article.new(title: "Lego: The Movie", body: "This is a Lego Movie.")
    assert article.save
  end
end
