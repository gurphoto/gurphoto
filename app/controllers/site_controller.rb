class SiteController < ApplicationController
  skip_load_and_authorize_resource

  def index
    @page = Page.find_by_alias :about
  end

  def partners
    @partners = User::Agency.only_partners.includes(:profile).order('profiles.city').all
  end
end
