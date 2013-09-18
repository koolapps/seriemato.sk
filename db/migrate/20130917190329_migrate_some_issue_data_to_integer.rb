class MigrateSomeIssueDataToInteger < ActiveRecord::Migration
  def up
    connection.execute 'ALTER TABLE issues ALTER COLUMN smt_limit TYPE INTEGER USING smt_limit::INTEGER'
    connection.execute 'ALTER TABLE issues ALTER COLUMN solvers_limit TYPE INTEGER USING solvers_limit::INTEGER'
    connection.execute 'ALTER TABLE issues ALTER COLUMN fake_smts TYPE INTEGER USING fake_smts::INTEGER'
    connection.execute 'ALTER TABLE issues ALTER COLUMN fake_solvers TYPE INTEGER USING fake_solvers::INTEGER'
  end

  def down
    connection.execute 'ALTER TABLE issues ALTER COLUMN smt_limit TYPE VARCHAR(255)'
    connection.execute 'ALTER TABLE issues ALTER COLUMN solvers_limit TYPE VARCHAR(255)'
    connection.execute 'ALTER TABLE issues ALTER COLUMN fake_smts TYPE VARCHAR(255)'
    connection.execute 'ALTER TABLE issues ALTER COLUMN fake_solvers TYPE VARCHAR(255)'
  end
end
