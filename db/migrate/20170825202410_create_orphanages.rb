class CreateOrphanages < ActiveRecord::Migration
  def change
    create_table :orphanages do |t|
      t.string :name
      t.string :email
      t.string :password
      t.integer :no_of_children
      t.decimal :lat
      t.decimal :lng
      t.string :phone_number
      t.timestamps null: false
    end
  end
end
