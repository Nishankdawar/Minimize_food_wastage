class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.string :start_time
      t.string :end_time
      t.integer :no_of_people
      t.integer :organizer_id
      t.string :status
      t.timestamps null: false
    end
  end
end
