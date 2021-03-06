class CreateBids < ActiveRecord::Migration[6.0]
  def change
    create_table :bids do |t|
      t.integer :job_seeker_id
      t.integer :job_id
      t.integer :points_bid

      t.timestamps
    end
  end
end
