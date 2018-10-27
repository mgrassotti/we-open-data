class Cities::ZipcodesController < ApplicationController
  def index
    render json: City.pluck(:cap).flatten.sort.uniq
  end

  def show
    render json: City.find_by!(cap: params[:id]).to_json(:except => :_id)
  end
end
