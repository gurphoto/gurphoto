# encoding: utf-8
require 'spec_helper'

describe 'Site controller' do
  before :each do
    visit root_path
  end

  it 'Title' do
    page.should have_content 'О портале'
  end

  it 'Reviews' do
    page.should have_content 'Отзывы'
    page.should have_selector '.reviews-cell'

    find('.reviews-cell a').click

    page.should have_content 'Отзывы'
    page.should have_no_content 'О портале'
  end

  it 'Articles' do
    page.should have_selector '.articles-cell'

    find('.articles-cell a').click

    page.should have_selector '.articles-show'
    page.should have_no_content 'О портале'
  end
end
