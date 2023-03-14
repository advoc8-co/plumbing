# cannot be tenanted - belongs to many companies...
class User < ApplicationRecord
  has_many :company_users, dependent: :destroy
  has_many :companies, through: :company_users
end

# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
