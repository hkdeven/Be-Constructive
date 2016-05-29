class HomeController < ApplicationController

  def index
    @shots = Shot.all
    @users = User.all
  end

end
