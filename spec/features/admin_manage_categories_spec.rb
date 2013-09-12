require 'spec_helper'

feature 'Manage categories' do
  scenario 'creating new category with valid information' do
    visit new_admin_category_path
    expect(page).to have_css 'h1', text: 'Create Category'
    fill_in 'Name', with: 'Awesome category'
    click_button 'Create Category'
    expect(page).to have_content 'New category has been created.'
    expect(page).to have_css 'h1', text: 'Update Category'
    expect(page).to have_css '#category_name[value="Awesome category"]'
  end

  scenario 'creating new category with invalid iformation' do
    visit new_admin_category_path
    expect { click_button 'Create Category' }.not_to change(Category, :count)
    expect(page).to have_css 'div.alert-danger'
  end

  scenario 'editing existing category with valid information' do
    category = FactoryGirl.create(:category, name: 'Awesome')
    visit edit_admin_category_path(category)
    fill_in 'Name', with: 'Not so awesome'
    expect { click_button 'Update Category' }.not_to change(Category, :count)
    expect(page).to have_content 'New category has been updated.'
    expect(page).to have_css '#category_name[value="Not so awesome"]'
  end

  scenario 'editing existing category with invalid iformation' do
    category = FactoryGirl.create(:category)
    visit edit_admin_category_path(category)
    fill_in 'Name', with: nil
    expect { click_button 'Update Category' }.not_to change(Category, :count)
    expect(page).to have_css 'div.alert-danger'
  end

  scenario 'listing all existing categories' do
    category_foo = FactoryGirl.create(:category, name: 'Foo')
    category_bar = FactoryGirl.create(:category, name: 'Bar')
    visit admin_categories_path
    within 'div.admin-dashboard' do
      expect(page).to have_css 'h1', text: 'All Categories'
      expect(page).to have_link 'Foo', edit_admin_category_path(category_foo)
      expect(page).to have_link 'Bar', edit_admin_category_path(category_bar)
    end
  end

  scenario 'deleting categories' do
    FactoryGirl.create(:category, name: 'Awesome')
    visit admin_categories_path
    click_link 'Delete'
    expect(page).to have_content 'Category has been deleted'
    expect(page).not_to have_link 'Awesome'
  end

  scenario 'deleting categories without accepting confirmation box', js: true do
    page.driver.dismiss_js_confirms!
    FactoryGirl.create(:category, name: 'Awesome')
    visit admin_categories_path
    click_link 'Delete'
    expect(page).not_to have_content 'Category has been deleted'
    expect(page).to have_link 'Awesome'
  end
end
