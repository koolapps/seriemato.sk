require 'spec_helper'

feature 'Index page' do
  scenario 'has all needed elements' do
    visit root_path
    within 'nav.navbar' do
      expect(page).to have_link '', root_path
      expect(page).to have_link 'Čo je seriemato?', href: page_path('about')
      expect(page).to have_link 'Prezerať problémy'
      expect(page).to have_link 'Pridať problém'
    end
    within 'div.explanation' do
      expect(page).to have_link 'bližšie vysvetlenie', href: page_path('about')
      expect(page).to have_css 'img[src*="explanation.png"]'
    end
  end

  scenario 'is showing 8 random issues' do
    10.times { FactoryGirl.create(:issue) }
    visit root_path
    expect(page).to have_css '.issue', count: 8
  end

  scenario 'has all needed elements for random issue' do
    issue = FactoryGirl.create(:issue, name: 'My Issue', short_description: 'This is my issue')
    visit root_path
    within "div#issue_#{issue.id}" do
      expect(page).to have_css 'h3', text: 'My Issue'
      expect(page).to have_css 'p', text: 'This is my issue'
      expect(page).to have_css 'img'
      expect(page).to have_link issue.name, href: issue_path(issue)
    end
  end
end
