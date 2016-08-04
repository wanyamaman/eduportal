class AddDescriptionsToSchools < ActiveRecord::Migration
  def change
    add_column :schools, :news, :text
    add_column :schools, :faculties, :text
    add_column :schools, :staff, :text
    add_column :schools, :academics, :text
    add_column :schools, :contact_us, :text
  end
end
