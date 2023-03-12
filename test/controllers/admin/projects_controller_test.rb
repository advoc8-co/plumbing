require "test_helper"

class Admin::ProjectsControllerTest < ActionDispatch::IntegrationTest
  def setup
    super
    create_list(:project, 2)
    Tenant.switch(Company.find_by(name: "second")) { create(:project) }
    Tenant.clear!
  end

  test "index" do
    get admin_projects_url
    assert_select "h1", "All Projects"
    assert_select "#count", "3 projects found"
  end
end
