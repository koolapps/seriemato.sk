require 'spec_helper'

feature 'Index page' do
  scenario 'has navbar' do
    visit root_path
    within 'nav.navbar' do
      expect(page).to have_link '', root_path
      expect(page).to have_link 'Čo je seriemato?', href: page_path('about')
      expect(page).to have_link 'Prezerať problémy'
      expect(page).to have_link 'Pridať problém'
    end
  end

  scenario 'has explanation picture' do
    visit root_path
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
    issue = FactoryGirl.create(:issue,
                               name: 'My Issue',
                               short_description: 'This is my issue',
                               picture: picture_file('large_picture.jpg'),
                               fake_solvers: 2,
                               solvers_limit: 10,
                               fake_smts: 1,
                               smt_limit: 10
                              )
    visit root_path
    within "div#issue_#{issue.id}" do
      expect(page).to have_css 'h3', text: 'My Issue'
      expect(page).to have_css 'p', text: 'This is my issue'
      expect(page).to have_css 'a img[src*="large_picture.jpg"]'
      expect(page).to have_link issue.name, href: issue_path(issue)
      expect(page).to have_css '.smt-count', text: 'Serie to: 1 / 10'
      expect(page).to have_css '.solvers-count', text: 'Chce to riešiť: 2 / 10'
      expect(page).to have_css '.progress-bar.smt', text: '10% Hotovo'
      expect(page).to have_css '.progress-bar.solver', text: '20% Hotovo'
    end
  end

  scenario 'has category list in footer' do
    2.times { FactoryGirl.create(:category) }
    visit root_path
    within 'div.footer' do
      Category.all.each do |category|
        expect(page).to have_link category.name, category_path(category)
      end
    end
  end

  scenario 'has category list in in sidebar' do
    2.times { FactoryGirl.create(:category) }
    visit root_path
    within 'div.categories-sidebar' do
      expect(page).to have_css 'h3', text: 'Oblasti problémov'
      expect(page).to have_link 'Všetko', issues_path
      Category.all.each do |category|
        expect(page).to have_link category.name, category_path(category)
      end
    end
  end

  scenario 'has page statistics' do
    category = FactoryGirl.create(:category)
    issue = FactoryGirl.create(:issue_with_smts, smts_count: 1, category: category)
    visit root_path
    within 'div.statistics' do
      expect(page).to have_css '.total-issues', text: 1
      expect(page).to have_css '.total-smts', text: 1
      expect(page).to have_link issue.name, issue_path(issue)
      expect(page).to have_link category.name, category_path(category)
    end
  end
end
