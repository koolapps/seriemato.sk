require 'spec_helper'

describe Smt do
  it { should belong_to :issue }

  it 'updates smt_count of parent issue' do
    issue = FactoryGirl.create(:issue)
    FactoryGirl.create(:smt, issue: issue)
    expect(issue.smts_count).to be 1
  end
end
