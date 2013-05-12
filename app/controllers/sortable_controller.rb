class SortableController < EditController
  def sort
    if params[:direction] == 'up'
      resource.move_higher
    else
      resource.move_lower
    end

    respond_to do |format|
      format.html do
        if request.xhr?
          render partial: 'table'
        else
          redirect_to collection_path
        end
      end
    end
  end
end
