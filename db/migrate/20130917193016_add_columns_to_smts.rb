class AddColumnsToSmts < ActiveRecord::Migration
  def change
    add_column :smts, :sex, :string
    add_column :smts, :year_of_birth, :string
    add_column :smts, :city, :string
    add_column :smts, :job, :string
    add_column :smts, :email, :string
  end
end
