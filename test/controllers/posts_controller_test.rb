require "test_helper"

class PostsControllerTest < ActionDispatch::IntegrationTest
  test "index" do
    get posts_url
    assert_select "h1", "Posts"
    assert_select "#count", "0 posts found"
  end
end
