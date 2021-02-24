require "test_helper"

class ArticlesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @article = articles(:one)
  end

  test "should get root path" do
    get root_path
    assert_response :success
  end

  test "should respond with HTTP code 200 when request goes to GET /articles" do
    get articles_path
    assert_equal response.code, "200"
    # assert_response :success
  end

  test "should respond with redirect when a valid request goes to POST /articles" do
    post articles_path, params: { article: { title: "Silicon Valley", body: "This is an awesome TV series" } }
    assert_equal response.code, "302"
    # assert_response :redirect
  end

  test "should respond with render when an invalid request goes to POST /articles" do
    post articles_path, params: { article: { title: "Lego: The Movie", body: "" } }
    assert_equal(response.code, "200")
    # assert_response :success
  end

  test "should respond with HTTP code 200 when request goes to GET /articles/new" do
    get new_article_path
    assert_response :success
  end

  test "should respond with HTTP code 200 when request goes to GET /articles/:id/edit" do
    get edit_article_path(@article)
    assert_response :success
  end

  test "should respond with HTTP code 200 when request goes to GET /articles/:id" do
    get article_path(@article)
    assert_response :success
  end

  test "should respond with redirect when a valid request goes to PATCH /articles/:id" do
    patch article_path(@article), params: { article: { title: "Silicon Valley: The TV Series", body: "This is an awesome TV series from HBO" } }
    assert_equal response.code, "302"
    # assert_response :redirect
  end

  test "should respond with redirect when a valid request goes to PUT /articles/:id" do
    put article_path(@article), params: { article: { body: "This is an awesome TV series from HBO" } }
    assert_equal response.code, "302"
    # assert_response :redirect
  end

  test "should respond with redirect when a valid request goes to DELETE /articles/:id" do
    delete article_path(@article)
    assert_equal response.code, "302"
    # assert_response :redirect
  end

end
