class User::Agency < User
  attr_accessible :email, :password, :is_partner, :profile_attributes, :agreement

  scope :only_partners, conditions: { is_partner: true }

  has_many :tickets

  def self.sort_column_names
    %w[profiles.city profiles.company_name profiles.agreement profiles.name is_partner]
  end

  def tickets
    Ticket.where("agency_id=#{id}").all
  end

  after_create do |record|
    if User.admin and (message = EmailTemplate.render('create_agency', { 'user' => record }))
      TemplateMailer.delay.send_template User.admin.email, message
    end
  end

  after_destroy do |record|
    if User.admin and (message = EmailTemplate.render('delete_agency', { 'user' => record }))
      TemplateMailer.delay.send_template User.admin.email, message
    end

    record.tickets.each do |t|
      t.destroy
    end
  end
end
