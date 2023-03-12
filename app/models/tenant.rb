# NOTE: equivalent to Apartment helper class
# TODO: should maybe live somewhere else...
# TODO: should switches be restricted to those valid for Current.user
# TODO: should we use Current for current_user?
# TODO: should we also store current CompanyUser?
class Tenant
  def self.switch!(company)
    Current.company = company
  end

  def self.switch(company)
    current_company = Current.company
    Current.company = company

    yield if block_given?

    Current.company = current_company
  end

  def self.current
    Current.company
  end

  def self.detenant!
    Current.company = nil
  end

  def self.all
    current_company = Current.company

    Company.all.each do |company|
      Current.company = company

      yield company if block_given?
    end

    Current.company = current_company
  end
end
