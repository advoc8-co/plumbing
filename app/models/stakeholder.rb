class Stakeholder < ApplicationRecord
  has_many :project_stakeholders, dependent: :destroy
  has_many :projects, through: :project_stakeholders
end

# == Schema Information
#
# Table name: stakeholders
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
