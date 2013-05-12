# encoding: utf-8

require 'spec_helper'

describe 'Documents', js: true do
  include Helpers

  it 'Create' do
    auth_as_agency
    click_on 'Каталог'

    find('.hotels table.table-striped tbody td a:first').click

    page.should have_content 'Информация о гостинице'
    page.should have_content 'Отчет'

    find('.rooms-list a:first').click
    page.should have_content 'Распечатать'
    click_on 'Добавить этот номер в запрос'

    click_on 'Создать запрос'
    page.should have_content 'Объекты для запроса'
    fill_in 'ticket_message_attributes_text', with: 'First message!'
    click_on 'Создать запрос'

    page.should have_content 'First message!'
    page.should have_content 'Добавить новое сообщение'
    page.should have_content 'Закрыть этот запрос'

    fill_in 'message_text', with: 'Second message!'
    click_on 'Отправить'

    page.should have_content 'First message!'
    page.should have_content 'Second message!'
  end

  it 'Pull and reply' do
    auth_as_moderator
  end
end
