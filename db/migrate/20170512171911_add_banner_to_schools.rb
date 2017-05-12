class AddBannerToSchools < ActiveRecord::Migration[5.0]
  def change
    add_column :schools, :banner, :string
  end
end
