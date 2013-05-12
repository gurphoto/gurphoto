class HotelsController < InheritedResources::Base
  include InheritedResources::DSL

  respond_to :pdf, only: :show, wkhtmltopdf: '/usr/bin/wkhtmltopdf'
  helper_method :sort_column, :sort_direction

  load_and_authorize_resource

  def print
    render layout: false
  end

  def retval
    $hotel_save = resource.id
    $hotel_name = resource.name.to_s + " - " + resource.address.to_s
  end

  def index
    if user_signed_in?
      if params[:reset_search]
        current_user.update_attributes hotel_search_query: ''
        params.delete :reset_search
      end
      unless params[:hotel] || params[:per_page]
        if current_user.save_hotel_search_query and current_user.hotel_search_query and !current_user.hotel_search_query.empty?
          redirect_to "#{collection_path}?#{current_user.hotel_search_query}"
          return
        end
      end

      if (params[:hotel] and current_user.save_hotel_search_query) or params[:per_page]
        current_user.update_attributes hotel_search_query: request.query_string
      end
    end

    @search = Hotel.new params[:hotel]

    if user_signed_in? and current_user.admin? and params[:only_published] != '1'
      model = Hotel
    else
      model = Hotel.published
    end

    params[:per_page] = 10 unless params[:per_page]
    params[:page] = 1 unless params[:page]

    per_page = params[:per_page]
    page = params[:page]
    query = model.includes(:city).order("#{sort_column} #{sort_direction}").paginate(page: page, per_page: per_page)

    respond_to do |format|
      format.html do
        if params[:hotel]
          @hotels = query.search(params)
        else
          @hotels = query.all
        end

        render
      end

      if user_signed_in? && current_user.super_admin?
        format.csv do
          filename = I18n.l(Time.now, format: :short) + ' - Hotels.csv'
          content = Hotel.to_csv(params[:commit] ? Hotel.search(params) : Hotel.all)
          send_data content, filename: filename
        end
      end
    end
    $is_hotelier_form = false

  end

  private

  helper_method :reviews

  def reviews
    @reviews ||= if can? :edit, Hotel::Review
      resource.reviews.all
    else
      resource.reviews.published.all
    end
  end

  def sort_column
    Hotel.sort_column_names.include?(params[:sort]) ? params[:sort] : "hotels.name"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end
