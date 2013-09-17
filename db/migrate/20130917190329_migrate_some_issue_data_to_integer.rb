class MigrateSomeIssueDataToInteger < ActiveRecord::Migration
  def up
    connection.execute 'ALTER TABLE issues ALTER COLUMN smt_limit TYPE INTEGER USING CAST(smt_limit AS INTEGER)'
    connection.execute 'ALTER TABLE issues ALTER COLUMN solvers_limit TYPE INTEGER USING CAST(solvers_limit AS INTEGER)'
    connection.execute 'ALTER TABLE issues ALTER COLUMN fake_smts TYPE INTEGER USING CAST(fake_smts AS INTEGER)'
    connection.execute 'ALTER TABLE issues ALTER COLUMN fake_solvers TYPE INTEGER USING CAST(fake_solvers AS INTEGER)'
  end

  def down
    connection.execute 'ALTER TABLE issues ALTER COLUMN smt_limit TYPE VARCHAR(255)'
    connection.execute 'ALTER TABLE issues ALTER COLUMN solvers_limit TYPE VARCHAR(255)'
    connection.execute 'ALTER TABLE issues ALTER COLUMN fake_smts TYPE VARCHAR(255)'
    connection.execute 'ALTER TABLE issues ALTER COLUMN fake_solvers TYPE VARCHAR(255)'
  end
end
