require 'spec_helper'

feature 'Click on "Chcem to riesit" button', js: true do
  scenario 'signing up as solver with valid data' do
    visit_issue_and_click_solvers_link
    fill_and_save_user_data
    expect(page).to have_content 'Ďakujeme! Boli ste pridaný na zoznam riešiteľov tohto problému.'
    expect(page).to have_css '.solvers-count', text: 1
    solver = Solver.last
    expect(solver.first_name).to eq 'John'
    expect(solver.last_name).to eq 'Doe'
    expect(solver.email).to eq 'john.doe@example.com'
  end

  scenario 'signing up as solver with invalid data' do
    visit_issue_and_click_solvers_link
    click_button 'Zapíšte ma ako riešiteľa'
    expect(page).to have_css 'div.form-errors'
  end

  scenario 'sign up as solver with valid data saves user data' do
    visit_issue_and_click_solvers_link
    fill_and_save_user_data
    click_link 'Chcem to riešiť'
    within '#modal' do
      expect(page).to have_css '#solver_first_name[value="John"]'
      expect(page).to have_css '#solver_last_name[value="Doe"]'
      expect(page).to have_css '#solver_email[value="john.doe@example.com"]'
    end
  end

  scenario 'solvers sign up form has cancel link' do
    visit_issue_and_click_solvers_link
    click_button 'Nechcem to riešiť'
    expect(page).not_to have_css '#modal'
  end

  def visit_issue_and_click_solvers_link
    issue = FactoryGirl.create(:issue)
    visit issue_path(issue)
    click_link 'Chcem to riešiť'
  end

  def fill_and_save_user_data
    fill_in 'Meno', with: 'John'
    fill_in 'Priezvisko', with: 'Doe'
    fill_in 'Email', with: 'john.doe@example.com'
    click_button 'Zapíšte ma ako riešiteľa'
  end
end
