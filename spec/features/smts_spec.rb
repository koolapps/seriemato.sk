require 'spec_helper'

feature 'SerieMaTo votes' do
  scenario 'click on SMT button and vote for the problem', js: true do
    issue = FactoryGirl.create(:published_issue)
    visit issue_path(issue)
    click_link 'Serie ma to!'
    expect(page).to have_css 'h4', text: 'Kto ste? Čo ste?'
    click_button 'Hlasovať anonymne'
    expect(page).to have_content 'Ďakujeme! Váš hlas bol započítaný.'
    expect(page).to have_css '.smt-count', text: 1
  end

  scenario 'click on SMT button and enter user data', js: true do
    issue = FactoryGirl.create(:published_issue)
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
    expect(smt.email).to eq 'user@example.com'
  end

  scenario 'click on SMT button and enter user data saves user data in cookies', js: true do
    issue = FactoryGirl.create(:published_issue)
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
    sleep 1
    visit issue_path(issue)
    click_link 'Serie ma to!'
    within '#modal' do
      expect(page).to have_css 'input[value="Muž"][checked="checked"]'
      expect(page).to have_css 'option[value="1990"][selected="selected"]'
      expect(page).to have_css 'option[value="Košice I"][selected="selected"]'
      expect(page).to have_css 'option[value="Služby"][selected="selected"]'
      expect(page).to have_css 'input[value="user@example.com"]'
    end
  end

  scenario 'click on SMT button and send empty user data', js: true do
    issue = FactoryGirl.create(:published_issue)
    visit issue_path(issue)
    click_link 'Serie ma to!'
    expect(page).to have_css 'h4', text: 'Kto ste? Čo ste?'
    click_button 'Uložiť údaje a hlasovať'
    expect(page).to have_css 'div.form-errors'
    expect(page).to have_css '.smt-count', text: 0
  end

  scenario 'click on SMT button increase SMT count just once for each user'

end
