class HomeController < ApplicationController

  def index
    if (current_user && current_user.approved)
      render :portal
    end
  end
end
