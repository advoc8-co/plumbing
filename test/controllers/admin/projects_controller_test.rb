require "test_helper"

class Admin::ProjectsControllerTest < ActionDispatch::IntegrationTest
  def setup
    super
    create_list(:project, 2)
    Tenant.switch!(@second_co, @second_user)
    create(:project)
  end

  test "index" do
    get admin_projects_url
    assert_select "h1", "All Projects"
    assert_select "#count", "3 projects found"
  end
end
