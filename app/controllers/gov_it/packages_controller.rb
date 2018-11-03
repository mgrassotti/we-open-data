class GovIt::PackagesController < ApplicationController
  def index
    @total_packages = if params[:catalog_parent_name].present? && 
        params[:catalog_parent_name].downcase != "all"
      GovIt::Package.where(_catalog_parent_name: params[:catalog_parent_name])
    else
      GovIt::Package.all
    end
    @packages = @total_packages.asc(:name).limit(1000)
      .skip(params[:offset].presence || 0)
    respond_to do |format|
      format.html
      format.json { render json: @packages }
    end
  end

  def show
    @package = GovIt::Package.find_by(name: params[:id])
    respond_to do |format|
      format.html
      format.json { render json: @package }
    end
  end
end
