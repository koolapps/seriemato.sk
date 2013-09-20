require 'spec_helper'

feature 'Issue page' do
  scenario 'has all needed elements' do
    issue = FactoryGirl.create(:issue, picture: picture_file('large_picture.jpg'))
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

  scenario 'click on SMT button and vote for the problem', js: true do
    issue = FactoryGirl.create(:issue)
    visit issue_path(issue)
    click_link 'Serie ma to!'
    expect(page).to have_css 'h4', text: 'Kto ste? Čo ste?'
    click_button 'Hlasovať anonymne'
    expect(page).to have_content 'Ďakujeme! Váš hlas bol započítaný.'
    expect(page).to have_css '.smt-count', text: 1
  end

  scenario 'click on SMT button and enter user data', js: true do
    issue = FactoryGirl.create(:issue)
    visit issue_path(issue)
    click_link 'Serie ma to!'
    expect(page).to have_css 'h4', text: 'Kto ste? Čo ste?'
    choose 'Žena'
    choose 'Muž'
    select '1990', from: 'Rok narodenia'
    select 'Košice I', from: 'Okres'
    select 'Služby', from: 'Zamestnanie'
    fill_in 'Email', with: 'user@example.com'
    click_button 'Uložiť údaje a hlasovať'
    expect(page).to have_content 'Ďakujeme! Váš hlas bol započítaný.'
    expect(page).to have_css '.smt-count', text: 1
    smt = Smt.last
    expect(smt.sex).to eq 'Muž'
    expect(smt.year_of_birth).to eq '1990'
    expect(smt.city).to eq 'Košice I'
    expect(smt.job).to eq 'Služby'
  end

  scenario 'click on SMT buttong and send empty user data', js: true do
    issue = FactoryGirl.create(:issue)
    visit issue_path(issue)
    click_link 'Serie ma to!'
    expect(page).to have_css 'h4', text: 'Kto ste? Čo ste?'
    click_button 'Uložiť údaje a hlasovať'
    expect(page).to have_css 'div.form-errors'
    expect(page).to have_css '.smt-count', text: 0
  end

  scenario 'click on SMT button increase SMT count just once for each user'
end
