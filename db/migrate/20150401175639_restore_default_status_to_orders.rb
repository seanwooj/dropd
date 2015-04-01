class RestoreDefaultStatusToOrders < ActiveRecord::Migration
  def change
    change_column_default :orders, :status, 'open'
  end
end
