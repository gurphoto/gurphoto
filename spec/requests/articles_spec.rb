# encoding: utf-8
require 'spec_helper'

describe 'Article' do
  before :each do
    visit articles_path
  end

  it 'List' do
    page.should have_content 'Новости'
    page.should have_selector '.articles'

    find('.articles a').click

    page.should have_selector '.articles-show'
    page.should have_no_content 'Редактировать'
  end
end
