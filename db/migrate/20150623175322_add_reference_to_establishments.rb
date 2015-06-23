class AddReferenceToEstablishments < ActiveRecord::Migration
  def change
    add_reference :establishments, :location, index: true, foreign_key: true
  end
end
