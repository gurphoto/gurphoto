class Profile < ActiveRecord::Base
  has_attached_file :logo, styles: { thumb: "150x200>" }, default_url: '/assets/partner.png'

  belongs_to :user
  has_many :notes

  attr_accessible :name, :skype, :icq, :phones, :company_name, :address, :agreement, :logo, :notified, :city, :validity
  attr_accessible :description

  validates :name, presence: true, length: { minimum: 5, maximum: 255 }, :if => :no_camper?
  validates :agreement, presence: true, length: { minimum: 5, maximum: 255 }

  liquid_methods :name, :company_name, :skype, :phones, :address, :icq, :agreement

  PROTECTED_ATTRIBUTES = %w(description company_name agreement)

  def no_camper?
    $no_tourist != false
  end

  def can_change? name
    not PROTECTED_ATTRIBUTES.include? name.to_s or User.current_user.admin?
  end

  after_save do |record|
    if record.user.agency? and record.company_name_changed?
      record.user.tickets.each do |t|
        t.company_name = record.company_name
      end
    end
  end

  before_save do |record|
    return unless User.current_user

    unless User.current_user.admin?
      PROTECTED_ATTRIBUTES.each do |name|
        raise CanCan::AccessDenied if record.changes.include? name
      end
    end
  end
end
