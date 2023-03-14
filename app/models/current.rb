class Current < ActiveSupport::CurrentAttributes
  attribute :company, :user

  class MissingCurrentCompany < StandardError; end

  def company_or_raise!
    msg = "You must set an company with Current.company="
    raise Current::MissingCurrentCompany, msg unless company

    company
  end

  # NOTE: intentionally blows up unless user is set first...
  def company=(company)
    raise unless user.company_users.map(&:company).include? company
    super
  end

  # TODO: bit weird? useful in tests...
  def company_user
    CompanyUser.find_sole_by(company: company, user: user)
  end
end
