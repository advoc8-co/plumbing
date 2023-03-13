require "test_helper"

class TenantTest < ActiveSupport::TestCase
  test "switch company" do
    check @first_co, @multi_user
    Tenant.switch_company!(@second_co)
    check @second_co, @multi_user
  end

  test "switch to nil company raises" do
    assert_raises(RuntimeError) { Tenant.switch_company!(nil) }
  end

  test "switch user and company" do
    check @first_co, @multi_user
    Tenant.switch!(@second_co, @second_user)
    check @second_co, @second_user
  end

  test "switch to nil company or user raises" do
    assert_raises(RuntimeError) { Tenant.switch!(nil, nil) }
    assert_raises(RuntimeError) { Tenant.switch!(@second_co, nil) }
    assert_raises(RuntimeError) { Tenant.switch!(nil, @second_user) }
  end

  test "switching to a company where there is no company_user raises" do
    Tenant.switch!(@first_co, @first_user)
    assert_raises(RuntimeError) { Tenant.switch_company!(@second_co) }
  end

  private

  def check(company, user)
    assert_equal Current.company, company
    assert_equal Current.user, user
  end
end
