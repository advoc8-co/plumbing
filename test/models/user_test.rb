require "test_helper"

class UserTest < ActiveSupport::TestCase
  setup do
    @user = create(:user)
  end

  test "valid" do
    assert @user.valid?
  end

  test "create" do
    u = User.create! name: "trevor"
    assert_equal "trevor", u.reload.name
  end
end
