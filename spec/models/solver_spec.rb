require 'spec_helper'

describe Solver do
  it { should belong_to :issue }
  it { should validate_presence_of :first_name }
  it { should validate_presence_of :last_name }
  it { should validate_presence_of :email }
  it { should_not allow_value('asdf').for(:email) }
  it { should allow_value('user@example.com').for(:email) }

  it 'has valid factory' do
    solver = FactoryGirl.create(:solver)
    expect(solver).to be_valid
  end

  it 'updates solvers_count of parent issue' do
    issue = FactoryGirl.create(:issue)
    FactoryGirl.create(:solver, issue: issue)
    expect(issue.solvers_count).to be 1
  end

  describe '#issue' do
    it 'return issue even if it is not published (unscoped query)' do
      issue = FactoryGirl.create(:issue, published: false)
      solver = FactoryGirl.create(:solver, issue: issue)
      solver.reload
      expect(solver.issue).to eq issue
    end
  end
end
