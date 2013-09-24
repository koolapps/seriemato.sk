require 'spec_helper'

feature 'Click on "Chcem to riesit" button', js: true do
  scenario 'signing up as solver with valid information' do
    issue = FactoryGirl.create(:issue)
    visit issue_path(issue)
    click_link 'Chcem to riešiť'
    fill_in 'Meno', with: 'John'
    fill_in 'Priezvisko', with: 'Doe'
    fill_in 'Email', with: 'john.doe@example.com'
    click_button 'Uložiť údaje'
    expect(page).to have_content 'Ďakujeme! Boli ste pridaný na zoznam riešiteľov tohto problému.'
    expect(page).to have_css '.solvers-count', text: 1
  end
end
