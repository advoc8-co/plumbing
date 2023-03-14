require "test_helper"

class PostsControllerTest < ActionDispatch::IntegrationTest
  def setup
    # TODO: this call to super is awkward - delegate to a custom setup
    # method from test_helper?
    super
    create_list(:post, 2)

    Tenant.switch!(@second_co, @second_user)
    create(:post)
  end

  test "index" do
    get posts_url
    assert_select "h1", "Posts"
    assert_select "#count", "2 posts found"
  end
end
