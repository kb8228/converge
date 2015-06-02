class CreateMeetups < ActiveRecord::Migration
  def change
    create_table :meetups do |t|
      t.date :date
      t.time :time
      t.references :user, index: true, foreign_key: true
      t.references :establishment, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
