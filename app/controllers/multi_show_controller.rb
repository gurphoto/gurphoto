class MultiShowController < EditController
  def index
    super do |format|
      format.html do
        if params[:table]
          render :index_table
        else
          render :index
        end
      end
    end
  end

  protected

  def collection
    @collection ||= end_of_association_chain.paginate page: params[:page]
  end
end
