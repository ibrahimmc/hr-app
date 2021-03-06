# == Schema Information
#
# Table name: bids
#
#  id            :integer          not null, primary key
#  points_bid    :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  job_id        :integer
#  job_seeker_id :integer
#
class Bid < ApplicationRecord
  belongs_to :seeker
end
