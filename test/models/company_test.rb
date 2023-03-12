require "test_helper"

class CompanyTest < ActiveSupport::TestCase
  setup do
    @company = create(:company)
  end

  test "valid fixture" do
    assert @company.valid?
  end

  test "create" do
    c = Company.create! name: "name"
    assert_equal "name", c.reload.name
  end
end
