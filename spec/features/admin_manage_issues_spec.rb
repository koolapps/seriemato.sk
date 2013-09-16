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

  scenario 'adding picture to issue with invalid information' do
    visit new_admin_issue_path
    attach_file 'Picture', File.dirname(__FILE__) + '/../test_pictures/big-picture.jpg'
    click_button 'Create Issue'
    expect(page).not_to have_css 'div.picture img'
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

  scenario 'adding picture to existing issue with invalid information' do
    issue = FactoryGirl.create(:issue)
    visit edit_admin_issue_path issue
    fill_in 'Name', with: nil
    attach_file 'Picture', File.dirname(__FILE__) + '/../test_pictures/big-picture.jpg'
    click_button 'Update Issue'
    expect(page).not_to have_css 'div.picture img'
  end

  scenario 'selecting category for the issue' do
    issue = FactoryGirl.create(:issue)
    FactoryGirl.create(:category, name: 'Category 1')
    FactoryGirl.create(:category, name: 'Category 2')
    visit edit_admin_issue_path issue
    expect(page).to have_select('Category', options: ['-- Select Category --', 'Category 1', 'Category 2'])
    select 'Category 2', from: 'Category'
    click_button 'Update Issue'
    expect(page).to have_select('Category', selected: 'Category 2')
  end

  def fill_form_with_values
    fill_in 'Name', with: 'This is new issue'
    fill_in 'Short description', with: 'Short text'
    fill_in 'SMT limit', with: 100
    fill_in 'Solvers limit', with: 30
    fill_in 'Long description', with: 'Long text'
    fill_in 'Fake SMTs', with: 10
    fill_in 'Fake solvers', with: 15
    attach_file 'Picture', File.dirname(__FILE__) + '/../test_pictures/big-picture.jpg'
  end

  def validate_form
    expect(page).to have_css 'input#issue_name[value="This is new issue"]'
    expect(page).to have_css 'textarea#issue_short_description', text: 'Short text'
    expect(page).to have_css 'input#issue_smt_limit[value="100"]'
    expect(page).to have_css 'input#issue_solvers_limit[value="30"]'
    expect(page).to have_css 'input#issue_fake_smts[value="10"]'
    expect(page).to have_css 'input#issue_fake_solvers[value="15"]'
    expect(page).to have_css 'textarea', text: 'Long text'
    expect(page).to have_css 'img[src*="big-picture.jpg"]'
  end
end
