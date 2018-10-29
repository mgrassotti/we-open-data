class ApplicationController < ActionController::Base
  rescue_from Mongoid::Errors::DocumentNotFound, with: :not_found

  def not_found
    render json: { error: "Not found" }, status: :not_found
  end

private
  def base_url
    url = request.protocol + request.host
    url += ":#{request.port}" unless request.port == 80
    url
  end
  helper_method :base_url
end
