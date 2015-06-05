class RemoveAddressFromInvitees < ActiveRecord::Migration
  def change
    remove_column :invitees, :address, :string
  end
end
