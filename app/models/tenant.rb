# NOTE: equivalent to Apartment helper class
# TODO: should live somewhere else...
class Tenant
  def self.switch!(company, user)
    raise unless company && user
    Current.user = user
    Current.company = company
  end

  def self.switch_company!(company)
    raise unless company
    Current.company = company
  end

  # TODO: block versions?
end
