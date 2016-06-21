class CreateSchools < ActiveRecord::Migration
  def change
    create_table :schools do |t|
      t.string :name, limit: 255, null: false
      t.integer :phone
      t.string :email, limit: 50

      # Ownership types: Private,Public
      t.string :ownership, limit: 50, default: 'private', null: false
      # Level options: Pre-School, Primary, Secondary, all, Primary and Secondary, other
      t.string :level, limit: 50, default: 'secondary', null: false
      # Mode types: Day, Boarding, Mixed
      t.string :mode, limit: 50, default: 'day', null: false

      t.string :gender, limit: 50, default: 'mixed', null: false
      t.text :about
    end
  end
end
