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
end
