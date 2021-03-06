# == Schema Information
#
# Table name: jobs
#
#  id                :integer          not null, primary key
#  industry          :string
#  job_description   :text
#  title             :string
#  yearly_usd_salary :integer
#  years_of_exp      :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  company_id        :integer
#
class Job < ApplicationRecord
end
