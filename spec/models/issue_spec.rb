require 'spec_helper'

describe Issue do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:short_description) }
  it { should validate_presence_of(:long_description) }
  it { should validate_presence_of(:SMT_limit) }
  it { should validate_presence_of(:solvers_limit) }
  it { should validate_numericality_of(:SMT_limit) }
  it { should validate_numericality_of(:solvers_limit) }
end
