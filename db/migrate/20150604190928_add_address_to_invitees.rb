class AddAddressToInvitees < ActiveRecord::Migration
  def change
    add_column :invitees, :address, :string
  end
end
