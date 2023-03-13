require "application_system_test_case"

class ProjectsTest < ApplicationSystemTestCase
  def setup
    super
    create_list(:project, 2)
    Tenant.switch!(@second_co, @second_user)
    create(:project)
  end

  test "index" do
    visit projects_url
    assert_selector "h1", text: "Projects"
    assert_selector "#count", text: "2 projects found"
  end
end
