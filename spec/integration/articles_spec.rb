# encoding: utf-8

require 'spec_helper'

describe 'Articles', js: true do
  include Helpers

  before :each do
    auth_as_admin
  end

  it 'Create' do
    within '.submenu' do
      click_link 'Акцию'
    end

    page.should have_content 'Добавить акцию'

    click_button 'Сохранить'
    page.should have_selector '.alert-error'

    title = "Тестовая акция #{Time.now}"

    fill_in 'Заголовок', with: title
    fill_in 'Описание', with: 'Описание акции'

    evaluate_script 'tinyMCE.activeEditor.setContent("Lorem ipsum dolor sit amet, consectetur adipiscing elit.")'
    attach_file 'Картинка', Rails.root.join('spec', 'factories', 'image.jpeg')

    click_button 'Сохранить'

    page.should have_content title
  end

  it 'Delete' do
    click_link 'Акции'
    click_link 'Показать список'

    find('.articles a[data-method="delete"]').click

    alert = page.driver.browser.switch_to.alert
    alert.accept

    page.should have_content 'Акции'
  end

  it 'Edit' do
    click_link 'Акции'
    click_link 'Показать список'

    find('.articles a[href*="edit"]').click

    page.should have_content 'Редактирование акции'

    title = "Тестовая акция #{Time.now}"
    fill_in 'Заголовок', with: title
    click_button 'Сохранить'
    page.should have_content title
  end
end
