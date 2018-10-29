class Italy::CitiesController < ApplicationController
  def index
    @service = Service.find_by!(name: "Italian Cities")
    respond_to do |format|
      format.html { render file:  "#{Rails.root}/app/views/services/show" } 
      format.json { render json: @service.as_json(base_url: base_url) }
    end
  end
end
