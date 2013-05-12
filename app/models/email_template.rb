class EmailTemplate < ActiveRecord::Base
  attr_accessible :body, :name, :subject
  strip_attributes

  def self.types
    %w[contact create_ticket create_message close_ticket create_moderator create_agency delete_moderator delete_agency]
  end

  def self.render name, data
    template = find_by_name name
    return false unless template

    data['current_user'] = User.current_user

    subjectTemplate = Liquid::Template.parse template.subject
    bodyTemplate = Liquid::Template.parse template.body

    return { subject: subjectTemplate.render(data), body: bodyTemplate.render(data) }
  end

  validates :name, :body, :subject, presence: true
  validates :name, inclusion: { in: EmailTemplate.types }
end
