class Hotel::Filter::Item < ActiveRecord::Base
  belongs_to :filter
  attr_accessible :name, :filter_id
end
