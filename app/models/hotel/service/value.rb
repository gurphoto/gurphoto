# encoding: utf-8

class Hotel::Service::Value < ActiveRecord::Base
  belongs_to :service, validate: true
  belongs_to :hotel, validate: true

  attr_accessible :service_id, :hotel_id, :value

  validates_each :value do |record, attr, value|
    record.errors.add(attr, "поля \"#{record.service.name}\" в сервисах слишком длинное") if value.length > 255
  end

  def check= value
  end

  def check
    value.present? || (service && service.default) || false
  end

  def valuoe
    return super unless super.empty?
    service.default_value
  end
end
