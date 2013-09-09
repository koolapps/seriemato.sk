require 'spec_helper'

feature 'Index page' do
  scenario 'is showing 8 random issues' do
    10.times { FactoryGirl.create(:issue) }
    visit root_path
    expect(page).to have_css '.issue', count: 8
  end

  scenario 'has all needed elements for random issue' do
    issue = FactoryGirl.create(:issue, name: 'My Issue', short_description: 'This is my issue')
    visit root_path
    expect(page).to have_css "div#issue_#{issue.id}"
    expect(page).to have_css 'h3', text: 'My Issue'
    expect(page).to have_css 'p', text: 'This is my issue'
    expect(page).to have_css "div#issue_#{issue.id} img"
  end
end