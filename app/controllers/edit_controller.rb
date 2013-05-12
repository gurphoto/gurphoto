class EditController < InheritedResources::Base
  include InheritedResources::DSL

  load_and_authorize_resource

  update! do |success, failure|
    success.html { redirect_to collection_path }
  end

  create! do |success, failure|
    success.html { redirect_to collection_path }
  end
end
