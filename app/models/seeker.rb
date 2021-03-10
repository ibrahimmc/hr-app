# == Schema Information
#
# Table name: seekers
#
#  id              :integer          not null, primary key
#  bid_points      :integer
#  email           :string
#  first_name      :string
#  industry        :string
#  last_name       :string
#  password_digest :string
#  years_of_exp    :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class Seeker < ApplicationRecord
  validates :email, :uniqueness => { :case_sensitive => false }
  validates :email, :presence => true
  has_secure_password
  has_many :bids
  has_many :winners
end
