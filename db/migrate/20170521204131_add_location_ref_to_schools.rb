class AddLocationRefToSchools < ActiveRecord::Migration[5.0]
  def change
    add_reference :schools, :location, foreign_key: true
  end
end
