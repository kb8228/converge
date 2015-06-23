class RemoveReferencesFromLocations < ActiveRecord::Migration
  def change
    remove_reference :locations, :user, index: true, foreign_key: true
    remove_reference :locations, :invitee, index: true, foreign_key: true
    remove_reference :locations, :meetup, index: true, foreign_key: true
    remove_reference :locations, :establishment, index: true, foreign_key: true
  end
end
