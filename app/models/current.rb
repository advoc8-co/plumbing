class Current < ActiveSupport::CurrentAttributes
  attribute :company, :user

  class MissingCurrentCompany < StandardError; end

  def company_or_raise!
    msg = "You must set an company with Current.company="
    raise Current::MissingCurrentCompany, msg unless company

    company
  end
end
