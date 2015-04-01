class AddStatusTypeToStatusTransition < ActiveRecord::Migration
  def change
    add_column :status_transitions, :status_type, :string
  end
end
