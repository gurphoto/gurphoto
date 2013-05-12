class TicketsController < InheritedResources::Base
  load_and_authorize_resource

  helper_method :sort_direction, :sort_column

  def new
    redirect_to baskets_path if current_user.basket_items == 0

    @ticket = Ticket.new

    current_user.basket_items.each do |i|
      @ticket.rooms << i.room
    end
  end

  def show
    not_read_messages = 0
    not_read_messages += resource.agency_new_messages_count if User.current_user.agency?
    not_read_messages += resource.camper_new_messages_count if User.current_user.camper?
    not_read_messages += resource.admin_new_messages_count if User.current_user.moderator?

    @page = params[:page] || ((resource.messages.count - not_read_messages) / Message.per_page.to_f).ceil
    @page = 1 if @page < 1
    @messages = resource.messages.paginate(page: @page)
    @messages.each { |message| message.read! }
  end

  def pull
    resource.pull!
    redirect_to resource
  end

  private
  
  def collection
    return @collection if @collection

=begin
    unless @collection
      model = Ticket.paginate(page: params[:page])

      if params[:archive]
        model = model.closed
      end

      if params[:mine]
        if current_user.agency?
          model = model.has_agency current_user.id
        else
          model = model.has_admin current_user.id
        end
      end

      @collection = model.all
    end

    @collection
=end
    if current_user.agency?
      @collection = Ticket.mine.order("#{sort_column} #{sort_direction}").all
    elsif current_user.camper?
      @collection = Ticket.mine1.order("#{sort_column} #{sort_direction}").all
    elsif current_user.moderator?
      @collection = { mine: current_user.tickets.order("#{sort_column} #{sort_direction}").all, open: current_user.open_tickets_in_mine_regions("#{sort_column} #{sort_direction}")  }
    elsif current_user.super_admin?
      if params[:moderator_id]
        @collection = Ticket.where(moderator_id: params[:moderator_id]).order("#{sort_column} #{sort_direction}").all
      else
        @collection = Ticket.order("#{sort_column} #{sort_direction}").all
      end
    end
  end

  def sort_column
    Ticket.sort_column_names.include?(params[:sort]) ? params[:sort] : "created_at"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end
