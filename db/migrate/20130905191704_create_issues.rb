class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.string :name
      t.text :short_description
      t.text :long_description
      t.string :SMT_limit
      t.string :solvers_limit

      t.timestamps
    end
  end
end
