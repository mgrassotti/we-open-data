class Italy::CitiesController < ApplicationController
  def index
    @service = Service.find_by!(name: "Italian Cities")
    render json: @service.as_json(url: current_url)
  end
end
