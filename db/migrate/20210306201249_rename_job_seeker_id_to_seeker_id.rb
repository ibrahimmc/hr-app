class RenameJobSeekerIdToSeekerId < ActiveRecord::Migration[6.0]
  def change
    rename_column :bids, :job_seeker_id, :seeker_id
  end
end
