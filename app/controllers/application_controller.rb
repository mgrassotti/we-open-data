class ApplicationController < ActionController::Base
  rescue_from Mongoid::Errors::DocumentNotFound, with: :not_found

  def not_found
    render json: { error: "Not found" }, status: :not_found
  end

private
  def current_url
    url = request.protocol + request.host
    url += ":#{request.port}" unless request.port == 80
    url
  end
end
