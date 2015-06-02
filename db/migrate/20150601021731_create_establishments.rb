class CreateEstablishments < ActiveRecord::Migration
  def change
    create_table :establishments do |t|
      t.string :name
      t.string :address
      t.string :phone_number
      t.text :hours
      t.string :image_url
      t.string :category

      t.timestamps null: false
    end
  end
end
