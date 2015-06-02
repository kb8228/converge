class CreateInvitees < ActiveRecord::Migration
  def change
    create_table :invitees do |t|
      t.string :name
      t.string :email
      t.string :phone_number
      t.references :meetup, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
