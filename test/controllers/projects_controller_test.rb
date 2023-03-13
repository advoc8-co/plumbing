require "test_helper"

class ProjectsControllerTest < ActionDispatch::IntegrationTest
  def setup
    super
    create_list(:project, 2)

    Tenant.switch!(@second_co, @second_user)
    create(:project)
  end

  test "index" do
    get projects_url
    assert_select "h1", "Projects"
    assert_select "#count", "2 projects found"
  end
end
