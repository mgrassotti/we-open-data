class ServicesController < ApplicationController
  def index
    @services = Service.all
    respond_to do |format|
      format.html
      format.json { 
        render json: @services.map { |s| s.as_json(base_url: base_url) } 
      }
    end
  end

  def show
    @service = Service.find(params[:id])
    render json: @service.as_json(base_url: base_url)
  end
end
