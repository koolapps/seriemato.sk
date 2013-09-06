require 'spec_helper'

feature 'Manage issues' do
  scenario 'adding issue with valid information' do
    visit new_admin_issue_path
    expect(page).to have_css 'h1', 'Create Issue'
    fill_in 'Name', with: 'This is new issue'
    fill_in 'Short description', with: 'Short text'
    fill_in 'SMT limit', with: 100
    fill_in 'Solvers limit', with: 30
    fill_in 'Long description', with: 'Long text'
    click_button 'Create Issue'

    expect(page).to have_content 'Issue has been created.'
    expect(page).to have_css 'h1', text: 'Edit Issue'
    expect(page).to have_css 'input[value="This is new issue"]'
    expect(page).to have_css 'textarea', text: 'Short text'
    expect(page).to have_css 'input[value="100"]'
    expect(page).to have_css 'input[value="30"]'
    expect(page).to have_css 'textarea', text: 'Long text'
  end

  scenario 'adding issue with invalid information' do
    visit new_admin_issue_path
    click_button 'Create Issue'

    expect(page).to have_css 'div.alert-error'
  end
end
