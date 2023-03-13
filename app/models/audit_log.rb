class AuditLog < ApplicationRecord
  include Tenanted

  belongs_to :company
  belongs_to :user

  # TODO: polymorphic join to parent? useful if we are e.g. going to show history in UI
end

# == Schema Information
#
# Table name: audit_logs
#
#  id          :bigint           not null, primary key
#  action      :string
#  changelog   :string
#  model_class :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  company_id  :bigint           not null
#  model_id    :bigint
#  user_id     :bigint           not null
#
# Indexes
#
#  index_audit_logs_on_company_id  (company_id)
#  index_audit_logs_on_user_id     (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (company_id => companies.id)
#  fk_rails_...  (user_id => users.id)
#
