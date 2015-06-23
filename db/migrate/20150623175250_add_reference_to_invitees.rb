class AddReferenceToInvitees < ActiveRecord::Migration
  def change
    add_reference :invitees, :location, index: true, foreign_key: true
  end
end
