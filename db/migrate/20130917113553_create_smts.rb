class CreateSmts < ActiveRecord::Migration
  def change
    create_table :smts do |t|
      t.references :issue, index: true

      t.timestamps
    end
  end
end
