class CreateSolvers < ActiveRecord::Migration
  def change
    create_table :solvers do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.references :issue, index: true
    end
  end
end
