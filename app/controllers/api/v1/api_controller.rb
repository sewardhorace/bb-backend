module Api
  module V1
    class InvalidGoogleParamsError < StandardError; end
    class ApiController < ActionController::Base
      protect_from_forgery with: :null_session
      respond_to :json

      include Authenticable

    end
  end
end
