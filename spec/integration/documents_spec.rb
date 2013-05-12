# encoding: utf-8

require 'spec_helper'

describe 'Documents', js: true do
  include Helpers

  before :each do
    auth_as_admin

    visit '/'
    click_link 'Документы'
  end

  it 'Create' do
    click_link 'Новый документ'

    click_on 'Сохранить'
    page.should have_selector '.alert-error'

    name = "Документ #{Time.now}"

    fill_in 'Название', with: name
    fill_in 'Описание', with: 'Описание'
    attach_file 'Файл', Rails.root.join('spec', 'factories', 'image.jpeg')

    click_on 'Сохранить'
    page.should have_content 'Документы'
    page.should have_content name
  end

  it 'Edit' do
    find('.documents a[href*="edit"]').click
    page.should have_content 'Редактирование документа'

    name = "Документ #{Time.now}"
    fill_in 'Название', with: name

    click_on 'Сохранить'
    page.should have_content 'Документы'
    page.should have_content name
  end

  it 'Delete' do
    find('.documents a[data-method="delete"]').click

    alert = page.driver.browser.switch_to.alert
    alert.accept

    page.should have_content 'Документы'
  end
end
