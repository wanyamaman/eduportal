class AddIndexToStates < ActiveRecord::Migration[5.0]
  def change
    add_index :states, :name, unique: true
  end
end
