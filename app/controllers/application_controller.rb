class ApplicationController < ActionController::Base
  private

  # NOTE: this would happen as part of logging in / switching company
  # TODO: request based?
  def stub_company
    company_user = CompanyUser.unscoped.first
    Current.user = company_user.user
    Current.company = company_user.company
  end
end
