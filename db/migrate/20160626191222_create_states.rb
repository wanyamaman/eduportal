class CreateStates < ActiveRecord::Migration
  def change
    create_table :states do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
# 20160712160646_create_states
