class Post < ApplicationRecord
  include Audited
  include Tenanted

  belongs_to :user
  belongs_to :project
end

# == Schema Information
#
# Table name: posts
#
#  id         :bigint           not null, primary key
#  body       :string
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  company_id :bigint           not null
#  project_id :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_posts_on_company_id  (company_id)
#  index_posts_on_project_id  (project_id)
#  index_posts_on_user_id     (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (company_id => companies.id)
#  fk_rails_...  (project_id => projects.id)
#  fk_rails_...  (user_id => users.id)
#
