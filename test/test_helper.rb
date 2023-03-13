ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"

class ActiveSupport::TestCase
  include FactoryBot::Syntax::Methods

  parallelize(workers: :number_of_processors)

  # NOTE: current company and user are set for all tests
  def setup
    @first_user = create(:user)
    @second_user = create(:user)
    @multi_user = create(:user)

    @first_co = create(:company, name: "first")
    @second_co = create(:company, name: "second")

    create(:company_user, company: @first_co, user: @first_user)
    create(:company_user, company: @first_co, user: @multi_user)
    create(:company_user, company: @second_co, user: @second_user)
    create(:company_user, company: @second_co, user: @multi_user)

    Tenant.switch!(@first_co, @multi_user)
  end

  def teardown
    Current.reset
  end
end
