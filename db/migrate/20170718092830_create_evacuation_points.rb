class CreateEvacuationPoints < ActiveRecord::Migration[5.0]
  def change
    create_table :evacuation_points do |t|
      t.references :user, foreign_key: true
      t.string :address
      t.float :latitude
      t.float :longitude
      t.integer :number_of_evacuees
      t.integer :max_evacuees

      t.timestamps
    end
  end
end
