class Project < ApplicationRecord
  include Tenanted

  belongs_to :company

  # NOTE: all company users are on all projects
  has_many :users, through: :company

  has_many :project_stakeholders, dependent: :destroy
  has_many :stakeholders, through: :project_stakeholders

  has_many :posts, dependent: :destroy # TODO: soft delete
end

# == Schema Information
#
# Table name: projects
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  company_id :bigint           not null
#
# Indexes
#
#  index_projects_on_company_id  (company_id)
#
# Foreign Keys
#
#  fk_rails_...  (company_id => companies.id)
#
