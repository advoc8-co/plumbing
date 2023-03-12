class ApplicationController < ActionController::Base
  private

  # NOTE: this would happen as part of logging in / switching company
  def stub_company
    company_user = CompanyUser.unscoped.first
    Current.company = company_user.company
    Current.user = company_user.user
  end
end
