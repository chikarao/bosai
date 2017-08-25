class ChangeDefaultOfRequestsAndItemsRequests < ActiveRecord::Migration[5.0]
  def change
    change_column_default :requests, :status, 'open'
    change_column_default :items_requests, :status, 'open'
  end
end
