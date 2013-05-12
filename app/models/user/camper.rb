class User::Camper < User
  attr_accessible :email, :password, :is_partner, :is_hotelier, :is_tourist, :surname, :profile_attributes

  scope :only_partners, conditions: { is_partner: false }

  has_many :tickets

  validates :surname, presence: true, length: { minimum: 3, maximum: 255 }

  def self.sort_column_names
    %w[profiles.city profiles.company_name profiles.agreement profiles.name is_partner]
  end

  def tickets
    Ticket.where("camper_id=#{id}").all
  end

  after_create do |record|
    if User.admin and (message = EmailTemplate.render('create_camper', { 'user' => record }))
      TemplateMailer.delay.send_template User.admin.email, message
    end
  end

  after_destroy do |record|
    if User.admin and (message = EmailTemplate.render('delete_camper', { 'user' => record }))
      TemplateMailer.delay.send_template User.admin.email, message
    end

    record.tickets.each do |t|
      t.destroy
    end
  end
end
