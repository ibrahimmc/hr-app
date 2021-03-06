class CreateCompanies < ActiveRecord::Migration[6.0]
  def change
    create_table :companies do |t|
      t.string :email
      t.string :password_digest
      t.string :name
      t.string :logo
      t.integer :number_of_employees
      t.string :hq_location

      t.timestamps
    end
  end
end
