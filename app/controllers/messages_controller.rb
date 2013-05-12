class MessagesController < InheritedResources::Base
  include InheritedResources::DSL

  load_and_authorize_resource
  belongs_to :ticket

  update! do |success, failure|
    success.html { redirect_to parent_path }
  end

  create! do |success, failure|
    success.html { redirect_to parent_path }
  end
end
