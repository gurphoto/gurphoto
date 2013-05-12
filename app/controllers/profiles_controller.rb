class ProfilesController < InheritedResources::Base
  actions :all, :except => [ :destroy, :index ]
  load_and_authorize_resource
end
