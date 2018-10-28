class ServicesController < ApplicationController
  def index
    render json: Service.all.map { |s| s.as_json(url: current_url) }
  end

  def show
    @service = Service.find(params[:id])
    render json: @service.as_json(url: current_url)
  end
end
