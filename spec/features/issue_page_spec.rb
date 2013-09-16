require 'spec_helper'

feature 'Issue page' do
  scenario 'has all needed elements' do
    issue = FactoryGirl.create(:issue)
    visit issue_path(issue)
    expect(page).to have_css 'h1', text: issue.name
    expect(page).to have_content issue.long_description
    expect(page).to have_css 'img[src*="large_picture.jpg"]'
  end

  scenario 'list related issues' do
    category = FactoryGirl.create(:category)
    issue = FactoryGirl.create(:issue, category: category)
    other_issue = FactoryGirl.create(:issue, category: category)
    visit issue_path(issue)
    within 'div.related-issues' do
      expect(page).to have_css 'h3', text: 'Súvisiace problémy'
      expect(page).to have_link other_issue.name, href: issue_path(other_issue)
    end
  end
end
