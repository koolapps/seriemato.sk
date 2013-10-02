require 'spec_helper'

describe Smt do
  it { should belong_to :issue }

  describe 'validataion of data when validate == true' do
    let(:smt) { FactoryGirl.build(:smt, validate: true, sex: 'Muž', city: 'Košice', job: 'Programátor', year_of_birth: '1234') }
    subject { smt }
    it { should be_valid }
    it_should_be_invalid_without(:sex)
    it_should_be_invalid_without(:year_of_birth)
    it_should_be_invalid_without(:job)
    it_should_be_invalid_without(:city)
  end

  it 'updates smts_count of parent issue' do
    issue = FactoryGirl.create(:issue)
    FactoryGirl.create(:smt, issue: issue)
    expect(issue.smts_count).to be 1
  end

  describe '#issue' do
    it 'returns issue even if it is not published (unscoped)' do
      issue = FactoryGirl.create(:issue, published: false)
      smt = FactoryGirl.create(:smt, issue: issue)
      smt.reload
      expect(smt.issue).to eq issue
    end
  end
end
