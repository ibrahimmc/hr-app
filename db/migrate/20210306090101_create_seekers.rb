class CreateSeekers < ActiveRecord::Migration[6.0]
  def change
    create_table :seekers do |t|
      t.string :email
      t.string :password_digest
      t.string :first_name
      t.string :last_name
      t.string :industry
      t.integer :years_of_exp
      t.integer :bid_points

      t.timestamps
    end
  end
end
