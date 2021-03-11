# == Schema Information
#
# Table name: bids
#
#  id         :integer          not null, primary key
#  points_bid :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  job_id     :integer
#  seeker_id  :integer
#
class Bid < ApplicationRecord
  belongs_to :seeker
  belongs_to :job
  validates :points_bid, numericality: { only_integer: true }
  validates :points_bid, numericality: { greater_than: 0 }
  validates :points_bid, numericality: { less_than: 2000 }
end
