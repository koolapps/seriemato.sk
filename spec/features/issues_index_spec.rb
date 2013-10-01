require 'spec_helper'

feature 'Issues index page' do
  scenario 'is showing all issues' do
    issue = FactoryGirl.create(:issue)
    visit issues_path
    within "#issue_#{issue.id}" do
      expect(page).to have_link issue.name, href: issue_path(issue)
    end
  end
end
