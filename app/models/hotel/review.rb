class Hotel::Review < ActiveRecord::Base
  strip_attributes
  apply_simple_captcha

  default_value_for :email do
    User.current_user.email if User.current_user
  end

  default_value_for :name do
    User.current_user.profile.name if User.current_user
  end

  belongs_to :hotel, counter_cache: true, validate: true
  scope :published, conditions: { published: true }
  default_scope :order => 'published ASC'

  attr_accessible :name, :email, :text, :character_id, :hotel_id, :captcha, :captcha_key
  attr_accessible :published

  validates :name, :email, :text, :character_id, presence: true
  validates :email, :format => { :with => %r{.+@.+\..+} }, allow_blank: true
  validates :character_id, inclusion: { in: [1, 2, 3] }
  validates :text, length: { minimum: 5, maximum: 600 }
  validates :name, length: { minimum: 3, maximum: 255 }

  def self.count_not_publiched
    count conditions: { published: false }
  end
end
