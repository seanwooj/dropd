class CreateStatusTransitions < ActiveRecord::Migration
  def change
    create_table :status_transitions do |t|
      t.integer :user_id
      t.integer :transitionable_id
      t.string :transitionable_type
      t.string :event
      t.string :from_state
      t.string :to_state
      t.string :notes
      t.timestamps
    end
  end
end
