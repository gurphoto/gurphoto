# encoding: utf-8
require 'spec_helper'

describe 'Hotels' do
  before :each do
    visit hotels_path
  end

  it 'List' do
    page.should have_content 'Гостиницы'
    page.should have_selector '.hotels'

    find('.hotels .table tbody a').click

    page.should have_selector '.hotels-show'
    page.should have_no_content 'Редактировать'
  end
end
