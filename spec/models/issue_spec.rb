require 'spec_helper'

describe Issue do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:short_description) }
  it { should validate_presence_of(:long_description) }
  it { should validate_presence_of(:smt_limit) }
  it { should validate_presence_of(:solvers_limit) }
  it { should validate_numericality_of(:smt_limit) }
  it { should validate_numericality_of(:solvers_limit) }

  it 'should respond to :fake_smts' do
    expect(Issue.new).to respond_to(:fake_smts)
  end

  it 'should respond to :fake_solvers' do
    expect(Issue.new).to respond_to(:fake_smts)
  end

  it 'has valid factory' do
    issue = FactoryGirl.build(:issue)
    expect(issue).to be_valid
  end
end
