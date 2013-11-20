require 'spec_helper'

feature 'Smts stats' do
  scenario 'showing all smts click for all issues' do
    issue = FactoryGirl.create(:issue)
    FactoryGirl.create(:smt,
                       issue: issue,
                       sex: 'Man',
                       year_of_birth: '1999',
                       city: 'BA',
                       job: 'programmer',
                       email: 'user@example.com',
                      )
    visit admin_path
    click_link 'Smts Stats'
    within 'table' do
      expect(page).to have_content issue.name
      expect(page).to have_content issue.category.name
      expect(page).to have_content 'Man'
      expect(page).to have_content '1999'
      expect(page).to have_content 'BA'
      expect(page).to have_content 'programmer'
      expect(page).to have_content 'user@example.com'
      expect(page).to have_content Time.now.strftime '%Y-%m-%d'
    end
  end
end
