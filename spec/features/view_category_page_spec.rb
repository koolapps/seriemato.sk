require 'spec_helper'

feature 'Viewing issues in category' do
  scenario 'showing all issues in given category' do
    category = FactoryGirl.create(:category)
    issue = FactoryGirl.create(:issue, category: category)
    visit category_path(category)
    expect(page).to have_css 'h2', text: "Problémy v kategórii: #{category.name}"
    within "#issue_#{issue.id}" do
      expect(page).to have_link issue.name, href: issue_path(issue)
    end
    within '.categories-sidebar' do
      expect(page).to have_link category.name, href: category_path(category)
    end
  end
end
