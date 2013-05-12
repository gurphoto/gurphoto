class User::Hotelier < User
  attr_accessible :email, :password, :is_partner, :is_hotelier, :validity, :profile_attributes

  scope :only_partners, conditions: { is_partner: false }

  has_many :tickets
  #has_one :hotelier_hotel

  #accepts_nested_attributes_for :hotelier_hotels, update_only: true

  def self.sort_column_names
    %w[profiles.city profiles.company_name profiles.agreement profiles.name is_partner]
  end

  def tickets
    #Ticket.where("hotelier_id=#{id}").all
  end

  after_create do |record|
    if User.admin and (message = EmailTemplate.render('create_hotelier', { 'user' => record }))
      TemplateMailer.delay.send_template User.admin.email, message
    end
  end

  after_destroy do |record|
    if User.admin and (message = EmailTemplate.render('delete_hotelier', { 'user' => record }))
      TemplateMailer.delay.send_template User.admin.email, message
    end

    #record.tickets.each do |t|
      #t.destroy
    #end
  end
end
