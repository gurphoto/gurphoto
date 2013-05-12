# encoding: utf-8

require 'spork'

#ENV['RAILS_ENV'] ||= 'test'
ENV['RAILS_ENV'] = 'development' # yep, this is bad...

Spork.prefork do
  require File.expand_path('../../config/environment', __FILE__)
  require 'rspec/rails'
  require 'rspec/autorun'
  require 'capybara/rspec'

  Dir[Rails.root.join('spec/support/**/*.rb')].each {|f| require f}

  require "#{Rails.root}/db/seeds.rb";

  RSpec.configure do |config|
    config.use_transactional_fixtures = true
    config.infer_base_class_for_anonymous_controllers = false

    config.before :suite do
      #DatabaseCleaner.strategy = :transaction
      #DatabaseCleaner.start
    end

    config.after :suite do
      #DatabaseCleaner.clean
    end
  end
end

Spork.each_run do

end

module Helpers
  def auth_as_admin
    auth 'super@example.com', 'password'
  end

  def auth_as_moderator
    auth 'moderator@example.com', 'password'
  end

  def auth_as_agency
    auth 'agency@example.com', 'password'
  end

  def auth_as_hotelier
    auth 'hotelier@example.com', 'password'
  end

  def auth email, password
    visit '/'
    page.should have_content 'О компании'

    click_link 'Вход для партнеров'

    fill_in 'Электронный адрес', with: email
    fill_in 'Пароль', with: password

    click_button 'Войти'
  end
end
