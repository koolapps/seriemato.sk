require 'spec_helper'

feature 'Admin dashboard' do
  scenario 'has menu with admin links' do
    visit admin_path
    within 'div.sidebar' do
      expect(page).to have_link 'Issues', admin_issues_path
      expect(page).to have_link 'New Issue', new_admin_issue_path
      expect(page).to have_link 'Categories', admin_categories_path
      expect(page).to have_link 'New Category', new_admin_category_path
    end
  end

  scenario 'list all issues' do
    issue = FactoryGirl.create(:issue)
    other_issue = FactoryGirl.create(:issue)
    visit admin_path
    expect(page).to have_link issue.name, edit_admin_issue_path(issue)
    expect(page).to have_link other_issue.name, edit_admin_issue_path(other_issue)
  end
end
