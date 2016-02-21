class Api::V1::StudentsController < Api::V1::ApiController
  before_action :authenticate_with_token!, only: [:create, :update, :destroy]
  # skip_before_filter :verify_authenticity_token
  # TODO csrf token

  def index
    if id = params[:room_id]
      students = Student.roomFilter(id)
    else
      students = Student.all
    end
    query = params[:search_string] || ""
    students = students.search(query)
    render json: students, root: false
  end

  private
  def search_params
    puts params
    params.permit(:room_id, :search_string)
  end
end
