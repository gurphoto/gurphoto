class Hotel::BankAttribute < ActiveRecord::Base
  attr_accessible :bik, :corr_account, :current_account, :name
  strip_attributes
end
