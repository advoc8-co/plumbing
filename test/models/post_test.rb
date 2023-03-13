require "test_helper"

class PostTest < ActiveSupport::TestCase
  def setup
    super # initialize Current otherwise next line will fail
    @post = create(:post)
  end

  test "valid" do
    assert @post.valid?
  end

  test "create" do
    p = Post.create! title: "Post title", user: Current.user, project: create(:project)
    assert_equal "Post title", p.reload.title
  end
end
