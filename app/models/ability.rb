class Ability
  include CanCan::Ability

  def initialize(user)

    #can :manage, :all

    can :read, Document
    can :read, Hotel, booking_id: 1
    can :read, Article
    can :read, Page

    can :create, Hotel::Review

    can :create, User
    can :create, Profile
    can :update, User, id: user.id if user

    can :update, Message do |message|
      message.have_read_users.count == 0 and message.user_id == user.id
    end

    can :save_hotel_search_query, User do |u|
      u.id == user.id
    end

    return unless user

    case user.type
    when 'User::Moderator'
      moderator user
    when 'User::Agency'
      agency user
    when 'User::Hotelier'
      hotelier user
    when 'User::Camper'
      camper user
    when nil
      super_admin
    end
  end

  def super_admin
    can :manage, :all
    cannot [:new, :create, :edit], Message
    cannot [:new, :create], Hotel::Review
  end

  def moderator user
    can :print, Hotel
    can :manage, Hotel
    can :manage, Hotel::Review
    can :manage, User::Agency
    can :manage, Profile

    can [:read, :pull], Ticket, moderator_id: nil
    can [:destroy, :read, :pull, :update, :close], Ticket, moderator_id: user.id

    can :show, Profile do |profile|
      profile.id != 1
    end

    can :create, Message do |message|
      !message.ticket.closed && message.ticket.moderator_id == user.id
    end
  end

  def agency user
    can :print, Hotel
    can [:read, :edit, :update], Profile, user_id: user.id
    can [:manage], BasketItem, user_id: user.id
    can [:destroy, :read, :update, :close], Ticket, agency_id: user.id
    can :create, Ticket

    can :show, Profile do |profile|
      profile.id != 1
    end

    can :create, Message do |message|
      !message.ticket.closed && message.ticket.agency_id == user.id
    end
  end

  def hotelier user             #!!!!!!!!!
    can :print, Hotel
    can [:read, :edit, :update], Profile, user_id: user.id
    can [:manage], BasketItem, user_id: user.id
    can [:destroy, :read, :update], Ticket, hotelier_id: user.id
    can :create, Ticket

    can :show, Profile do |profile|
      profile.id != 1
    end

    can :create, Message do |message|
      !message.ticket.closed && message.ticket.hotelier_id == user.id
    end
  end

  def camper user             #!!!!!!!!!
    can :print, Hotel
    can [:read, :edit, :update], Profile, user_id: user.id
    can [:manage], BasketItem, user_id: user.id
    can [:destroy, :read, :update, :close], Ticket, camper_id: user.id
    can :create, Ticket

    can :show, Profile do |profile|
      profile.id != 1
    end

    can :create, Message do |message|
      !message.ticket.closed && message.ticket.camper_id == user.id
    end
  end
end
