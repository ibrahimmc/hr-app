# == Schema Information
#
# Table name: winners
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  job_id     :integer
#  seeker_id  :integer
#
class Winner < ApplicationRecord
  belongs_to :job
  belongs_to :seeker
end
