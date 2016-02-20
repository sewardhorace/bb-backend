
class Api::V1::RoomsController < Api::V1::ApiController
  before_action :authenticate_with_token!, only: [:create, :update, :destroy]
  # skip_before_filter :verify_authenticity_token
  # TODO csrf token

  def index
    rooms = Room.all
    render json: rooms, root: false
  end
end
