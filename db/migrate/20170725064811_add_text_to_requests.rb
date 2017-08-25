class AddTextToRequests < ActiveRecord::Migration[5.0]
  def change
    add_column :requests, :text, :text
  end
end
