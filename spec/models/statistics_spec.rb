require 'spec_helper'

describe Statistics do
  let(:statistics) { Statistics.new }
  describe '#total_issues' do
    it 'returns count of all issues' do
      expect(statistics.total_issues).to eq 0
      FactoryGirl.create(:issue)
      expect(statistics.total_issues).to eq 1
    end
  end

  describe '#total_smts' do
    it 'returns count of all SMTs' do
      FactoryGirl.create(:issue_with_smts, smts_count: 1, fake_smts: 2)
      expect(statistics.total_smts).to be 3
    end
  end

  describe '#latest_issue' do
    it 'returns latest issue' do
      FactoryGirl.create(:issue)
      issue = FactoryGirl.create(:issue)
      expect(statistics.latest_issue).to eq issue
    end
  end

  describe '#last_week_issues_count' do
    it 'returns all issues created in last 7 days' do
      FactoryGirl.create(:issue, created_at: 8.days.ago)
      FactoryGirl.create(:issue)
      expect(statistics.last_week_issues_count).to be 1
    end
  end

  describe '#top_issue_by_smts' do
    it 'returns issue with the highest SMTs count' do
      FactoryGirl.create(:issue_with_smts, smts_count: 1, fake_smts: 1)
      top = FactoryGirl.create(:issue_with_smts, smts_count: 1, fake_smts: 2)
      expect(statistics.top_issue_by_smts).to eq top
    end
  end

  describe '#last_week_top_issue_by_smts' do
    it 'returns issue with the highest SMTs count from last 7 days' do
      FactoryGirl.create(:issue_with_smts, smts_count: 1)
      top = FactoryGirl.create(:issue_with_smts, smts_count: 2)
      old_top = FactoryGirl.create(:issue, created_at: 8.days.ago)
      3.times { FactoryGirl.create(:smt, created_at: 8.days.ago, issue: old_top) }
      expect(statistics.last_week_top_issue_by_smts).to eq top
    end
  end

  describe '#lowest_issue_by_smts' do
    it 'returns oldest issue with smallest SMTs count' do
      FactoryGirl.create(:issue, fake_smts: 1, created_at: 2.days.ago)
      lowest = FactoryGirl.create(:issue_with_smts, smts_count: 1, created_at: 3.days.ago)
      expect(statistics.lowest_issue_by_smts).to eq lowest
    end
  end

  describe '#top_category' do
    it 'returns category with most issues' do
      FactoryGirl.create(:category_with_issues, issues_count: 1)
      top = FactoryGirl.create(:category_with_issues, issues_count: 2)
      expect(statistics.top_category).to eq top
    end
  end
end
