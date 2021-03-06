class CreateJobs < ActiveRecord::Migration[6.0]
  def change
    create_table :jobs do |t|
      t.string :title
      t.string :industry
      t.integer :yearly_usd_salary
      t.text :job_description
      t.integer :years_of_exp
      t.integer :company_id

      t.timestamps
    end
  end
end
