require 'spec_helper'

feature 'Manage issues' do
  scenario 'adding issue with valid information' do
    visit new_admin_issue_path
    expect(page).to have_css 'h1', 'Create Issue'
    fill_form_with_values
    click_button 'Create Issue'
    expect(page).to have_content 'Issue has been created.'
    expect(page).to have_css 'h1', text: 'Edit Issue'
    validate_form
  end

  scenario 'adding issue with invalid information' do
    visit new_admin_issue_path
    click_button 'Create Issue'
    expect(page).to have_css 'div.alert-danger'
  end

  scenario 'selecting existing story from index' do
    issue = FactoryGirl.create(:issue)
    visit admin_issues_path
    expect(page).to have_css 'h1', text: 'All Issues'
    expect(page).to have_link issue.name, href: edit_admin_issue_path(issue)
  end

  scenario 'editing existing issue' do
    issue = FactoryGirl.create(:issue)
    visit edit_admin_issue_path issue
    fill_form_with_values
    click_button 'Update Issue'
    expect(page).to have_content 'Issue has been updated.'
    expect(page).to have_css 'h1', text: 'Edit Issue'
    validate_form
  end

  scenario "editing existing issue doesn't create new issue" do
    issue = FactoryGirl.create(:issue)
    visit edit_admin_issue_path issue
    expect { click_button 'Update Issue' }.not_to change(Issue, :count)
  end

  def fill_form_with_values
    fill_in 'Name', with: 'This is new issue'
    fill_in 'Short description', with: 'Short text'
    fill_in 'SMT limit', with: 100
    fill_in 'Solvers limit', with: 30
    fill_in 'Long description', with: 'Long text'
    fill_in 'Fake SMTs', with: 10
    fill_in 'Fake solvers', with: 15
  end

  def validate_form
    expect(page).to have_css 'input[value="This is new issue"]'
    expect(page).to have_css 'textarea', text: 'Short text'
    expect(page).to have_css 'input[value="100"]'
    expect(page).to have_css 'input[value="30"]'
    expect(page).to have_css 'input[value="30"]'
    expect(page).to have_css 'input[value="30"]'
    expect(page).to have_css 'textarea', text: 'Long text'
  end
end
