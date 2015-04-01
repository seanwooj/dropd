class AddBossFlagToUser < ActiveRecord::Migration
  def change
    add_column :users, :boss, :boolean
  end
end
