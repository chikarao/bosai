class CreateRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :requests do |t|
      t.references :user, foreign_key: true
      t.string :category
      t.string :address
      t.float :latitude
      t.float :longitude
      t.string :status
      t.string :priority

      t.timestamps
    end
  end
end
