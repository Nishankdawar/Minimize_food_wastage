class CreateOrganizers < ActiveRecord::Migration
  def change
    create_table :organizers do |t|
      t.string :name
      t.decimal :lat
      t.decimal :lng
      t.string :password
      t.string :email
      t.string :phone_number
      t.timestamps null: false
    end
  end
end
