class User::Tourist < User
  attr_accessible :email, :password, :is_partner, :is_hotelier, :is_tourist, :surname, :profile_attributes

  scope :only_partners, conditions: { is_partner: false }

  has_many :tickets

  #accepts_nested_attributes_for update_only: true

  def self.sort_column_names
    %w[profiles.city profiles.company_name profiles.agreement profiles.name is_partner]
  end

  def tickets
    #Ticket.where("tourist_id=#{id}").all
  end

  after_create do |record|
    if User.admin and (message = EmailTemplate.render('create_tourist', { 'user' => record }))
      TemplateMailer.delay.send_template User.admin.email, message
    end
    redirect_to :back
  end

  after_destroy do |record|
    if User.admin and (message = EmailTemplate.render('delete_tourist', { 'user' => record }))
      TemplateMailer.delay.send_template User.admin.email, message
    end

    #record.tickets.each do |t|
      #t.destroy
    #end
  end
end
