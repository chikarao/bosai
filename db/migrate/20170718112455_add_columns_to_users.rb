class AddColumnsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :address, :string
    add_column :users, :phone_number, :string
    add_reference :users, :organization, foreign_key: true
    add_column :users, :latitude, :float
    add_column :users, :longitude, :float
    add_reference :users, :evacuation_point, foreign_key: true
    ###################################################
  end
end
