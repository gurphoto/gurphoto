class PagesController < InheritedResources::Base
  load_and_authorize_resource

  def resource
    @page ||= Page.find_by_alias! params[:alias] if params[:alias]
    @page ||= Page.find params[:id] if params[:id]
    @page
  end
end
