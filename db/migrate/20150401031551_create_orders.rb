class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.text :note
      t.text :order_contents
      t.string :order_number
      t.string :customer_email
      t.string :customer_phone
      t.string :customer_delivery_address
      t.string :customer_delivery_city
      t.string :customer_delivery_state
      t.integer :customer_delivery_zipcode
      t.boolean :contacted, :default => false
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
