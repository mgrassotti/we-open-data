class ApplicationController < ActionController::Base
  rescue_from Mongoid::Errors::DocumentNotFound, with: :not_found

  def not_found
    render json: { error: "Not found" }, status: :not_found
  end
end
