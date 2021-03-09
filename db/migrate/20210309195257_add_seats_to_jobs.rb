class AddSeatsToJobs < ActiveRecord::Migration[6.0]
  def change
    add_column :jobs, :seats, :integer
  end
end
