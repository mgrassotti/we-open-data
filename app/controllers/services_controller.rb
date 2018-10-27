class ServicesController < ApplicationController
  def index
    redirect_to cities_names_path
  end
end
