require 'spec_helper'

feature 'Solvers stats' do
  scenario 'showing all solvers for all issues' do
    issue = FactoryGirl.create(:issue)
    FactoryGirl.create(:solver,
                       issue: issue,
                       first_name: 'John',
                       last_name: 'Doe',
                       email: 'john.doe@example.com'
                      )
    visit admin_path
    click_link 'Solvers Stats'

    within 'table' do
      expect(page).to have_content issue.name
      expect(page).to have_content issue.category.name
      expect(page).to have_content 'John'
      expect(page).to have_content 'Doe'
      expect(page).to have_content 'john.doe@example.com'
      expect(page).to have_content Time.now.strftime '%Y-%m-%d'
    end
  end
end
