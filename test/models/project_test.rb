require "test_helper"

class ProjectTest < ActiveSupport::TestCase
  def setup
    super # initialize Current otherwise next line will fail
    @project = create(:project)
  end

  test "valid" do
    assert @project.valid?
  end

  test "create" do
    p = Project.create! name: "project"
    assert_equal "project", p.reload.name
  end
end
