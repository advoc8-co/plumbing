# TODO: should this be tenanted?
class ProjectStakeholder < ApplicationRecord
  belongs_to :project
  belongs_to :stakeholder
end

# == Schema Information
#
# Table name: project_stakeholders
#
#  id             :bigint           not null, primary key
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  project_id     :bigint           not null
#  stakeholder_id :bigint           not null
#
# Indexes
#
#  index_project_stakeholders_on_project_id      (project_id)
#  index_project_stakeholders_on_stakeholder_id  (stakeholder_id)
#
# Foreign Keys
#
#  fk_rails_...  (project_id => projects.id)
#  fk_rails_...  (stakeholder_id => stakeholders.id)
#
