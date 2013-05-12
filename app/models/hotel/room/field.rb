class Hotel::Room::Field < ActiveRecord::Base
  attr_accessible :default_value, :name, :only_signed, :multiline, :include_to_print
  attr_accessible :position
  default_scope order: 'position'

  acts_as_list

  after_destroy do
    Value.delete_all "field_id=#{id}"
  end
end
