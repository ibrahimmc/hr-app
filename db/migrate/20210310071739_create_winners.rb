class CreateWinners < ActiveRecord::Migration[6.0]
  def change
    create_table :winners do |t|
      t.integer :seeker_id
      t.integer :job_id

      t.timestamps
    end
  end
end
