class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :address
      t.float :lat
      t.float :lng
      t.references :user, index: true, foreign_key: true
      t.references :invitee, index: true, foreign_key: true
      t.references :meetup, index: true, foreign_key: true
      t.references :establishment, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
