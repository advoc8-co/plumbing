module Tenanted
  extend ActiveSupport::Concern

  included do
    belongs_to :company, optional: true
    default_scope { where(company: Current.company_or_raise!) }
  end
end
