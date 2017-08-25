class AddNameToEvacuationPoints < ActiveRecord::Migration[5.0]
  def change
    add_column :evacuation_points, :name, :string
  end
end
