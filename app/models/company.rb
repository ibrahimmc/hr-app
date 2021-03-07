# == Schema Information
#
# Table name: companies
#
#  id                  :integer          not null, primary key
#  email               :string
#  hq_location         :string
#  logo                :string
#  name                :string
#  number_of_employees :integer
#  password_digest     :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#
class Company < ApplicationRecord
  validates :email, :uniqueness => { :case_sensitive => false }
  validates :email, :presence => true
  has_secure_password
  has_many :jobs
end
