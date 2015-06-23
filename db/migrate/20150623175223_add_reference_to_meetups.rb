class AddReferenceToMeetups < ActiveRecord::Migration
  def change
    add_reference :meetups, :location, index: true, foreign_key: true
  end
end
