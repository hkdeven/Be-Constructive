class ResourcesController < ApplicationController

  def show
    render template: "resources/#{params[:resource]}"
  end
end
