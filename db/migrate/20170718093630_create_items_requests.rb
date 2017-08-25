class CreateItemsRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :items_requests do |t|
      t.references :item
      t.references :request, foreign_key: true
      t.string :quantity
      t.string :status

      t.timestamps
    end
  end
end
