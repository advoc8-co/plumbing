class Post < ApplicationRecord
  include Audited
  include Tenanted

  # TODO: not convinced this is better than :user
  belongs_to :company_user
  belongs_to :project
end

# == Schema Information
#
# Table name: posts
#
#  id              :bigint           not null, primary key
#  body            :string
#  title           :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  company_id      :bigint           not null
#  company_user_id :bigint           not null
#  project_id      :bigint           not null
#
# Indexes
#
#  index_posts_on_company_id       (company_id)
#  index_posts_on_company_user_id  (company_user_id)
#  index_posts_on_project_id       (project_id)
#
# Foreign Keys
#
#  fk_rails_...  (company_id => companies.id)
#  fk_rails_...  (company_user_id => company_users.id)
#  fk_rails_...  (project_id => projects.id)
#
