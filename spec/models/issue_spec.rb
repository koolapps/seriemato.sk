require 'spec_helper'

describe Issue do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:short_description) }
  it { should validate_presence_of(:long_description) }
  it { should validate_presence_of(:smt_limit) }
  it { should validate_presence_of(:solvers_limit) }
  it { should validate_numericality_of(:smt_limit) }
  it { should validate_numericality_of(:solvers_limit) }
  it { should belong_to :category }
  it { should have_many :smts }
  it { should have_attached_file(:picture) }

  it 'has correct picture styles' do
    expect(Issue.attachment_definitions[:picture][:styles][:small]).to eq '144x54#'
    expect(Issue.attachment_definitions[:picture][:styles][:large]).to eq '640x240#'
  end

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

  describe '#random_issues' do
    it 'returns eight random issues' do
      10.times { FactoryGirl.create(:issue) }
      expect(Issue.randoms.size).to be 8
    end
  end

  describe '#related_issues' do
    it 'returns other issues from same category' do
      category = FactoryGirl.create(:category)
      issue = FactoryGirl.create(:issue, category: category)
      other_issue = FactoryGirl.create(:issue, category: category)
      expect(issue.related_issues.to_a).to eq [other_issue]
    end

    it 'does not return issues from other categories' do
      category = FactoryGirl.create(:category)
      issue = FactoryGirl.create(:issue, category: category)
      other_category = FactoryGirl.create(:category)
      non_related_issue = FactoryGirl.create(:issue, category: other_category)
      expect(issue.related_issues).not_to include(non_related_issue)
    end
  end

  describe '#smt_count' do
    it 'returns number of SMTs' do
      issue = FactoryGirl.create(:issue)
      FactoryGirl.create(:smt, issue: issue)
      expect(issue.smt_count).to eq 1
    end

    it 'adds fake SMTs to total SMT count' do
      issue = FactoryGirl.create(:issue, fake_smts: 10)
      FactoryGirl.create(:smt, issue: issue)
      expect(issue.smt_count).to eq 11
    end
  end
end
